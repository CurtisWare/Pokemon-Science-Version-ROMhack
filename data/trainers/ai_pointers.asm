TrainerAIPointers:
	table_width 3, TrainerAIPointers
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, JugglerAI ; unused_juggler
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI ; GRIMBULL
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 2, BlackbeltAI ; blackbelt
	dbw 3, GenericAI ; coqui1
	dbw 3, GenericAI
	dbw 1, GenericAI ; chief
	dbw 3, GenericAI
	dbw 1, RummyAI ; rummy
	dbw 3, GenericAI
	dbw 2, CooltrainerMAI ; cooltrainerm
	dbw 1, CooltrainerFAI ; cooltrainerf
	dbw 2, CallieAI ; callie
	dbw 5, FangAI ; fang
	dbw 1, KoopaAI ; koopa
	dbw 1, LtPeonyAI ; peony
	dbw 1, MeatAI ; meat
	dbw 2, RedaAI ; reda
	dbw 2, DanceAI ; dance
	dbw 1, TomakeysAI ; tomakeys
	dbw 3, GenericAI
	dbw 1, Coqui2AI ; coqui2
	dbw 1, Coqui3AI ; coqui3
	dbw 2, ColtAI ; colt
	dbw 3, GenericAI
	dbw 2, RaelAI ; rael
	dbw 1, KrimboAI ; krimbo
	assert_table_length NUM_TRAINERS
