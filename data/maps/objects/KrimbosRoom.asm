KrimbosRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event 24, 16, RAELS_ROOM, 3
	warp_event  5,  0, CHAMPIONS_ROOM, 1
	warp_event  6,  0, CHAMPIONS_ROOM, 1

	def_bg_events

	def_object_events
	object_event  6,  1, SPRITE_KRIMBO, STAY, DOWN, 1, OPP_KRIMBO, 1

	def_warps_to KRIMBOS_ROOM
