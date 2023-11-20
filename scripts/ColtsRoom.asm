ColtsRoom_Script:
	call ColtShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, ColtsRoomTrainerHeaders
	ld de, ColtsRoom_ScriptPointers
	ld a, [wColtsRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wColtsRoomCurScript], a
	ret

ColtShowOrHideExitBlock:
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, wBeatColt
	set 1, [hl]
	CheckEvent EVENT_BEAT_COLTS_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $5
	jr .setExitBlock
.blockExitToNextRoom
	ld a, $24
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetColtScript:
	xor a
	ld [wColtsRoomCurScript], a
	ret

ColtsRoom_ScriptPointers:
	dw ColtScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw ColtScript2
	dw ColtScript3
	dw ColtScript4

ColtScript4:
	ret

ColtScriptWalkIntoRoom:
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
	ld [wColtsRoomCurScript], a
	ld [wCurMapScript], a
	ret

ColtScript0:
	ld hl, ColtEntranceCoords
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
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_COLTS_ROOM
	jr z, ColtScriptWalkIntoRoom
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
	ld [wColtsRoomCurScript], a
	ld [wCurMapScript], a
	ret

ColtEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

ColtScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wColtsRoomCurScript], a
	ld [wCurMapScript], a
	ret

ColtScript2:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetColtScript
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

ColtsRoom_TextPointers:
	dw ColtText1
	dw ColtDontRunAwayText

ColtsRoomTrainerHeaders:
	def_trainers
ColtsRoomTrainerHeader0:
	trainer EVENT_BEAT_COLTS_ROOM_TRAINER_0, 0, ColtBeforeBattleText, ColtEndBattleText, ColtAfterBattleText
	db -1 ; end

ColtText1:
	text_asm
	ld hl, ColtsRoomTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ColtBeforeBattleText:
	text_far _ColtBeforeBattleText
	text_end

ColtEndBattleText:
	text_far _ColtEndBattleText
	text_end

ColtAfterBattleText:
	text_far _ColtAfterBattleText
	text_end

ColtDontRunAwayText:
	text_far _ColtDontRunAwayText
	text_end
