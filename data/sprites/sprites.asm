MACRO overworld_sprite
	dw \1
	db \2 tiles
	db BANK(\1)
ENDM

SpriteSheetPointerTable:
	table_width 4, SpriteSheetPointerTable
	; graphics, tile count
	overworld_sprite RedSprite, 12              ; SPRITE_RED
	overworld_sprite BlueSprite, 12             ; SPRITE_BLUE
	overworld_sprite OakSprite, 12              ; SPRITE_OAK
	overworld_sprite YoungsterSprite, 12        ; SPRITE_YOUNGSTER
	overworld_sprite MonsterSprite, 12          ; SPRITE_MONSTER
	overworld_sprite CooltrainerFSprite, 12     ; SPRITE_COOLTRAINER_F
	overworld_sprite CooltrainerMSprite, 12     ; SPRITE_COOLTRAINER_M
	overworld_sprite LittleGirlSprite, 12       ; SPRITE_LITTLE_GIRL
	overworld_sprite BirdSprite, 12             ; SPRITE_BIRD
	overworld_sprite MiddleAgedManSprite, 12    ; SPRITE_MIDDLE_AGED_MAN
	overworld_sprite GamblerSprite, 12          ; SPRITE_GAMBLER
	overworld_sprite SuperNerdSprite, 12        ; SPRITE_SUPER_NERD
	overworld_sprite GirlSprite, 12             ; SPRITE_GIRL
	overworld_sprite HikerSprite, 12            ; SPRITE_HIKER
	overworld_sprite BeautySprite, 12           ; SPRITE_BEAUTY
	overworld_sprite GentlemanSprite, 12        ; SPRITE_GENTLEMAN
	overworld_sprite DaisySprite, 12            ; SPRITE_DAISY
	overworld_sprite BikerSprite, 12            ; SPRITE_BIKER
	overworld_sprite SailorSprite, 12           ; SPRITE_SAILOR
	overworld_sprite CookSprite, 12             ; SPRITE_COOK
	overworld_sprite BikeShopClerkSprite, 12    ; SPRITE_BIKE_SHOP_CLERK
	overworld_sprite MrFujiSprite, 12           ; SPRITE_MR_FUJI
	overworld_sprite RummySprite, 12            ; SPRITE_RUMMY
	overworld_sprite RocketSprite, 12           ; SPRITE_ROCKET
	overworld_sprite ChannelerSprite, 12        ; SPRITE_CHANNELER
	overworld_sprite WaiterSprite, 12           ; SPRITE_WAITER
	overworld_sprite MeatSprite, 12             ; SPRITE_MEAT
	overworld_sprite MiddleAgedWomanSprite, 12  ; SPRITE_MIDDLE_AGED_WOMAN
	overworld_sprite BrunetteGirlSprite, 12     ; SPRITE_BRUNETTE_GIRL
	overworld_sprite KrimboSprite, 12           ; SPRITE_KRIMBO
	overworld_sprite FangSprite, 12             ; SPRITE_UNUSED_RED_1 and FANGSPRITE
	overworld_sprite ScientistSprite, 12        ; SPRITE_SCIENTIST
	overworld_sprite RockerSprite, 12           ; SPRITE_ROCKER
	overworld_sprite SwimmerSprite, 12          ; SPRITE_SWIMMER
	overworld_sprite SafariZoneWorkerSprite, 12 ; SPRITE_SAFARI_ZONE_WORKER
	overworld_sprite GymGuideSprite, 12         ; SPRITE_GYM_GUIDE
	overworld_sprite GrampsSprite, 12           ; SPRITE_GRAMPS
	overworld_sprite ClerkSprite, 12            ; SPRITE_CLERK
	overworld_sprite FishingGuruSprite, 12      ; SPRITE_FISHING_GURU
	overworld_sprite GrannySprite, 12           ; SPRITE_GRANNY
	overworld_sprite NurseSprite, 12            ; SPRITE_NURSE
	overworld_sprite LinkReceptionistSprite, 12 ; SPRITE_LINK_RECEPTIONIST
	overworld_sprite SilphPresidentSprite, 12   ; SPRITE_SILPH_PRESIDENT
	overworld_sprite SilphWorkerSprite, 12      ; SPRITE_SILPH_WORKER
	overworld_sprite WardenSprite, 12           ; SPRITE_WARDEN
	overworld_sprite CaptainSprite, 12          ; SPRITE_CAPTAIN
	overworld_sprite FisherSprite, 12           ; SPRITE_FISHER
	overworld_sprite RedaSprite, 12             ; SPRITE_REDA
	overworld_sprite GuardSprite, 12            ; SPRITE_GUARD
	overworld_sprite KoopaSprite, 12            ; SPRITE_UNUSED_RED_2 RedSprite and KoopaSprite
	overworld_sprite MomSprite, 12              ; SPRITE_MOM
	overworld_sprite BaldingGuySprite, 12       ; SPRITE_BALDING_GUY
	overworld_sprite LittleBoySprite, 12        ; SPRITE_LITTLE_BOY
	overworld_sprite PeonySprite, 12            ; SPRITE_UNUSED_RED_3 RedSprite and PeonySprite
	overworld_sprite GameboyKidSprite, 12       ; SPRITE_GAMEBOY_KID
	overworld_sprite FairySprite, 12            ; SPRITE_FAIRY
	overworld_sprite RaelSprite, 12             ; SPRITE_RAEL
	overworld_sprite CallieSprite, 12           ; SPRITE_CALLIE
	overworld_sprite ColtSprite, 12             ; SPRITE_COLT
	overworld_sprite SeelSprite, 12             ; SPRITE_SEEL
	overworld_sprite PikachuSprite, 12          ; SPRITE_PIKACHU
	overworld_sprite OfficerJennySprite, 12     ; SPRITE_OFFICER_JENNY
	overworld_sprite SandshrewSprite, 12        ; SPRITE_SANDSHREW
	overworld_sprite OddishSprite, 12           ; SPRITE_ODDISH
	overworld_sprite BulbasaurSprite, 12        ; SPRITE_BULBASAUR
	overworld_sprite JigglypuffSprite, 12       ; SPRITE_JIGGLYPUFF
	overworld_sprite ClefairySprite, 12         ; SPRITE_CLEFAIRY
	overworld_sprite ChanseySprite, 12          ; SPRITE_CHANSEY
	overworld_sprite JessieSprite, 12           ; SPRITE_JESSIE
	overworld_sprite JamesSprite, 12            ; SPRITE_JAMES
	overworld_sprite PokeBallSprite, 4          ; SPRITE_POKE_BALL
	overworld_sprite FossilSprite, 4            ; SPRITE_FOSSIL
	overworld_sprite BoulderSprite, 4           ; SPRITE_BOULDER
	overworld_sprite PaperSprite, 4             ; SPRITE_PAPER
	overworld_sprite PokedexSprite, 4           ; SPRITE_POKEDEX
	overworld_sprite ClipboardSprite, 4         ; SPRITE_CLIPBOARD
	overworld_sprite SnorlaxSprite, 4           ; SPRITE_SNORLAX
	overworld_sprite OldAmberSprite, 4          ; SPRITE_UNUSED_OLD_AMBER
	overworld_sprite OldAmberSprite, 4          ; SPRITE_OLD_AMBER
	overworld_sprite GamblerAsleepSprite, 4     ; SPRITE_UNUSED_GAMBLER_ASLEEP_1
	overworld_sprite GamblerAsleepSprite, 4     ; SPRITE_UNUSED_GAMBLER_ASLEEP_2
	overworld_sprite GamblerAsleepSprite, 4     ; SPRITE_GAMBLER_ASLEEP
	assert_table_length NUM_SPRITES
