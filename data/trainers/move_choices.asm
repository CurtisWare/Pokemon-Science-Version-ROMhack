MACRO move_choices
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
	DEF list_index += 1
ENDM

; move choice modification methods that are applied for each trainer class
TrainerClassMoveChoiceModifications:
	list_start TrainerClassMoveChoiceModifications
	move_choices         ; YOUNGSTER
	move_choices 1       ; BUG CATCHER
	move_choices 1       ; LASS
	move_choices 1, 3    ; SAILOR
	move_choices 1       ; JR_TRAINER_M
	move_choices 1       ; JR_TRAINER_F
	move_choices 1, 2, 3 ; POKEMANIAC
	move_choices 1, 2    ; SUPER_NERD
	move_choices 1       ; HIKER
	move_choices 1       ; BIKER
	move_choices 1, 3    ; BURGLAR
	move_choices 1       ; ENGINEER
	move_choices 1, 2, 3 ; GRIMBULL
	move_choices 1, 3    ; FISHER
	move_choices 1, 3    ; SWIMMER
	move_choices         ; CUE_BALL
	move_choices 1       ; GAMBLER
	move_choices 1, 3    ; BEAUTY
	move_choices 1, 2    ; PSYCHIC_TR
	move_choices 1       ; ROCKER
	move_choices 1       ; JUGGLER
	move_choices 1       ; TAMER
	move_choices 1       ; BIRD_KEEPER
	move_choices 1       ; BLACKBELT
	move_choices 1       ; COQUI1
	move_choices 1, 3    ; PROF_OAK
	move_choices 1, 2    ; CHIEF
	move_choices 1, 2    ; SCIENTIST
	move_choices 1, 3    ; RUMMY
	move_choices 1       ; ROCKET
	move_choices 1, 3    ; COOLTRAINER_M
	move_choices 1, 3    ; COOLTRAINER_F
	move_choices 1       ; CALLIE
	move_choices 1       ; FANG
	move_choices 1, 3    ; KOOPA
	move_choices 1       ; LT_PEONY
	move_choices 1, 3    ; MEAT
	move_choices 1, 3    ; REDA
	move_choices 1       ; DANCE
	move_choices 1       ; TOMAKEYS
	move_choices 1, 2    ; GENTLEMAN
	move_choices 1, 3    ; COQUI2
	move_choices 1, 3    ; COQUI3
	move_choices 1, 2, 3 ; COLT
	move_choices 1       ; CHANNELER
	move_choices 1       ; RAEL
	move_choices 1, 3    ; KRIMBO
	assert_list_length NUM_TRAINERS
