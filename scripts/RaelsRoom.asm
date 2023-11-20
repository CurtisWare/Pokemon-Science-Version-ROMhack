RaelsRoom_Script:
	call RaelShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, RaelsRoomTrainerHeaders
	ld de, RaelsRoom_ScriptPointers
	ld a, [wRaelsRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRaelsRoomCurScript], a
	ret

RaelShowOrHideExitBlock:
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_RAELS_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $e
	jp .setExitBlock
.blockExitToNextRoom
	ld a, $3b
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetRaelScript:
	xor a
	ld [wRaelsRoomCurScript], a
	ret

RaelsRoom_ScriptPointers:
	dw RaelScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw RaelScript2
	dw RaelScript3
	dw RaelScript4

RaelScript4:
	ret

RaelScriptWalkIntoRoom:
; Walk six steps upward.
	ld hl, wSimulatedJoypadStatesEnd
	ld a, D_UP
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wRaelsRoomCurScript], a
	ld [wCurMapScript], a
	ret

RaelScript0:
	ld hl, RaelEntranceCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing one tile above the exit?
	jr c, .stopPlayerFromLeaving
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_RAELS_ROOM
	jr z, RaelScriptWalkIntoRoom
.stopPlayerFromLeaving
	ld a, $2
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID  ; "Don't run away!"
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wRaelsRoomCurScript], a
	ld [wCurMapScript], a
	ret

RaelEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

RaelScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRaelsRoomCurScript], a
	ld [wCurMapScript], a
	ret

RaelScript2:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetRaelScript
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wChampionsRoomCurScript], a
	ret

RaelsRoom_TextPointers:
	dw RaelText1
	dw RaelDontRunAwayText

RaelsRoomTrainerHeaders:
	def_trainers
RaelsRoomTrainerHeader0:
	trainer EVENT_BEAT_RAELS_ROOM_TRAINER_0, 0, RaelBeforeBattleText, RaelEndBattleText, RaelAfterBattleText
	db -1 ; end

RaelText1:
	text_asm
	ld hl, RaelsRoomTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RaelBeforeBattleText:
	text_far _RaelBeforeBattleText
	text_end

RaelEndBattleText:
	text_far _RaelEndBattleText
	text_end

RaelAfterBattleText:
	text_far _RaelAfterBattleText
	text_end

RaelDontRunAwayText:
	text_far _RaelDontRunAwayText
	text_end
