FreezeEnemyTrainerSprite::
	ld a, [wCurMap]
	cp POKEMON_TOWER_7F
	ret z ; the Rockets on Pokemon Tower 7F leave after battling, so don't freeze them
	ld hl, CoquiIDs
	ld a, [wEngagedTrainerClass]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .notCoqui
	cp b
	ret z ; the coqui leaves after battling, so don't freeze him
	jr .loop
.notCoqui
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	jp SetSpriteMovementBytesToFF

CoquiIDs:
	db OPP_COQUI1
	db OPP_COQUI2
	db OPP_COQUI3
	db -1 ; end
