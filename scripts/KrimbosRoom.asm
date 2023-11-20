KrimbosRoom_Script:
	call KrimboShowOrHideEntranceBlocks
	call EnableAutoTextBoxDrawing
	ld hl, KrimbosRoomTrainerHeaders
	ld de, KrimbosRoom_ScriptPointers
	ld a, [wKrimbosRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wKrimbosRoomCurScript], a
	ret

KrimboShowOrHideEntranceBlocks:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_KRIMBOS_ROOM_LOCK_DOOR
	jr nz, .closeEntrance
	; open entrance
	ld a, $31
	ld b, $32
	jp .setEntranceBlocks
.closeEntrance
	ld a, $72
	ld b, $73
.setEntranceBlocks
; Replaces the tile blocks so the player can't leave.
	push bc
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	call .SetEntranceBlock
	pop bc
	ld a, b
	ld [wNewTileBlockID], a
	lb bc, 6, 3
.SetEntranceBlock:
	predef_jump ReplaceTileBlock

ResetKrimboScript:
	xor a
	ld [wKrimbosRoomCurScript], a
	ret

KrimbosRoom_ScriptPointers:
	dw KrimboScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw KrimboScript2
	dw KrimboScript3
	dw KrimboScript4

KrimboScript4:
	ret

KrimboScript0:
	CheckEvent EVENT_BEAT_KRIMBO
	ret nz
	ld hl, KrimboTriggerMovementCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing next to Krimbo's sprite?
	jr nc, .notStandingNextToKrimbo
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID
.notStandingNextToKrimbo
	cp $5  ; Is player standing on the entrance staircase?
	jr z, WalkToKrimbo
	CheckAndSetEvent EVENT_KRIMBOS_ROOM_LOCK_DOOR
	ret nz
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld a, SFX_GO_INSIDE
	call PlaySound
	jp KrimboShowOrHideEntranceBlocks

KrimboTriggerMovementCoords:
	dbmapcoord  5,  1
	dbmapcoord  6,  2
	dbmapcoord  5, 11
	dbmapcoord  6, 11
	dbmapcoord 24, 16
	db -1 ; end

KrimboScript2:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetKrimboScript
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

WalkToKrimbo:
; Moves the player down the hallway to Krimbo's room.
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, WalkToKrimbo_RLEList
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wKrimbosRoomCurScript], a
	ld [wCurMapScript], a
	ret

WalkToKrimbo_RLEList:
	db D_UP, 13
	db D_LEFT, 12
	db D_DOWN, 7
	db D_LEFT, 6
	db -1 ; end

KrimboScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wKrimbosRoomCurScript], a
	ld [wCurMapScript], a
	ret

KrimbosRoom_TextPointers:
	dw KrimboText1

KrimbosRoomTrainerHeaders:
	def_trainers
KrimbosRoomTrainerHeader0:
	trainer EVENT_BEAT_KRIMBOS_ROOM_TRAINER_0, 0, KrimboBeforeBattleText, KrimboEndBattleText, KrimboAfterBattleText
	db -1 ; end

KrimboText1:
	text_asm
	ld hl, KrimbosRoomTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

KrimboBeforeBattleText:
	text_far _KrimboBeforeBattleText
	text_end

KrimboEndBattleText:
	text_far _KrimboEndBattleText
	text_end

KrimboAfterBattleText:
	text_far _KrimboAfterBattleText
	text_asm
	SetEvent EVENT_BEAT_KRIMBO
	jp TextScriptEnd
