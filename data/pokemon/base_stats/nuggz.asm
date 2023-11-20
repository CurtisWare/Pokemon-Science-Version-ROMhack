	db DEX_NUGGZ ; pokedex id

	db  65, 130,  60,  65, 110
	;   hp  atk  def  spd  spc

	db FIRE, GRASS ; type
	db 45 ; catch rate
	db 198 ; base exp

	INCBIN "gfx/pokemon/front/nuggz.pic", 0, 1 ; sprite dimensions
	dw NuggzPicFront, NuggzPicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, EMBER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(NuggzPicFront)
