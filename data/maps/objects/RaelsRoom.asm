RaelsRoom_Object:
	db $0 ; border block

	def_warp_events
	warp_event  4, 11, CALLIES_ROOM, 3
	warp_event  5, 11, CALLIES_ROOM, 4
	warp_event  4,  0, KRIMBOS_ROOM, 1
	warp_event  5,  0, KRIMBOS_ROOM, 1

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_RAEL, STAY, DOWN, 1, OPP_RAEL, 1

	def_warps_to RAELS_ROOM
