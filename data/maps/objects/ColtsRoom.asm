ColtsRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, INDIGO_PLATEAU_LOBBY, 3
	warp_event  5, 11, INDIGO_PLATEAU_LOBBY, 3
	warp_event  4,  0, CALLIES_ROOM, 1
	warp_event  5,  0, CALLIES_ROOM, 2

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_COLT, STAY, DOWN, 1, OPP_COLT, 1

	def_warps_to COLTS_ROOM
