	db DEX_BILLY ; pokedex id

	db  65,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db ROCK, STINKY ; type
	db 60 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/billy.pic", 0, 1 ; sprite dimensions
	dw BillyPicFront, BillyPicBack

	db TACKLE, SOIL, ROCK_THROW, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, FIRE_BLAST,   \
	     REST,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(BillyPicFront)
