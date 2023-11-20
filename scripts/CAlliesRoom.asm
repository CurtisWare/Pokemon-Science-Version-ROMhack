CalliesRoom_Script:
	call CallieShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, CalliesRoomTrainerHeaders
	ld de, CalliesRoom_ScriptPointers
	ld a, [wCalliesRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCalliesRoomCurScript], a
	ret

CallieShowOrHideExitBlock:
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_CALLIES_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $5
	jp .setExitBlock
.blockExitToNextRoom
	ld a, $24
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetCallieScript:
	xor a
	ld [wCalliesRoomCurScript], a
	ret

CalliesRoom_ScriptPointers:
	dw CallieScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw CallieScript2
	dw CallieScript3
	dw CallieScript4

CallieScript4:
	ret

CallieScriptWalkIntoRoom:
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
	ld [wCalliesRoomCurScript], a
	ld [wCurMapScript], a
	ret

CallieScript0:
	ld hl, CallieEntranceCoords
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
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_CALLIES_ROOM
	jr z, CallieScriptWalkIntoRoom
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
	ld [wCalliesRoomCurScript], a
	ld [wCurMapScript], a
	ret

CallieEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

CallieScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wCalliesRoomCurScript], a
	ld [wCurMapScript], a
	ret

CallieScript2:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetCallieScript
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

CalliesRoom_TextPointers:
	dw CallieText1
	dw CallieDontRunAwayText

CalliesRoomTrainerHeaders:
	def_trainers
CalliesRoomTrainerHeader0:
	trainer EVENT_BEAT_CALLIES_ROOM_TRAINER_0, 0, CallieBeforeBattleText, CallieEndBattleText, CallieAfterBattleText
	db -1 ; end

CallieText1:
	text_asm
	ld hl, CalliesRoomTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CallieBeforeBattleText:
	text_far _CallieBeforeBattleText
	text_end

CallieEndBattleText:
	text_far _CallieEndBattleText
	text_end

CallieAfterBattleText:
	text_far _CallieAfterBattleText
	text_end

CallieDontRunAwayText:
	text_far _CallieDontRunAwayText
	text_end
