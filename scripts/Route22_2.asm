Func_f1b27::
	CheckEvent EVENT_BEAT_ROUTE22_COQUI_1ST_BATTLE
	jr z, .asm_5118b
	ld hl, Route22CoquiAfterBattleText1
	call PrintText
	jr .asm_51191

.asm_5118b
	ld hl, Route22CoquiBeforeBattleText1
	call PrintText
.asm_51191
	ret

Route22CoquiBeforeBattleText1:
	text_far _Route22CoquiBeforeBattleText1
	text_end

Route22CoquiAfterBattleText1:
	text_far _Route22CoquiAfterBattleText1
	text_end

Func_f1b47::
	CheckEvent EVENT_BEAT_ROUTE22_COQUI_2ND_BATTLE
	jr z, .asm_511a4
	ld hl, Route22CoquiAfterBattleText2
	call PrintText
	jr .asm_511aa

.asm_511a4
	ld hl, Route22CoquiBeforeBattleText2
	call PrintText
.asm_511aa
	ret

Route22CoquiBeforeBattleText2:
	text_far _Route22CoquiBeforeBattleText2
	text_end

Route22CoquiAfterBattleText2:
	text_far _Route22CoquiAfterBattleText2
	text_end

Func_f1b67::
	ld hl, Route22FrontGateText_3c
	call PrintText
	ret

Route22FrontGateText_3c:
	text_far _Route22FrontGateText
	text_end
