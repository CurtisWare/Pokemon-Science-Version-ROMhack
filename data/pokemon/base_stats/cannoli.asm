	db DEX_CANNOLI ; pokedex id

	db 130,  65,  60,  65, 110
	;   hp  atk  def  spd  spc

	db POISON, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp

	INCBIN "gfx/pokemon/front/cannoli.pic", 0, 1 ; sprite dimensions
	dw CannoliPicFront, CannoliPicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, WATER_GUN ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE,   SURF
	; end

	db BANK(CannoliPicFront)
