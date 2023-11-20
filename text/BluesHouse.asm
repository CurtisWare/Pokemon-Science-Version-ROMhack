_DaisyInitialText::
	text "BOA: Hi!"
	line "<COQUI> is out at"
	cont "OWO's lab."
	done

_DaisyOfferMapText::
	text "BOA: OWO asked you"
	line "to run an errand?"
	cont "Here, this will"
	cont "help you!"
	prompt

_GotMapText::
	text "<PLAYER> got a"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_DaisyBagFullText::
	text "You have too much"
	line "stuff with you."
	done

_DaisyUseMapText::
	text "BOA: Use the TOWN"
	line "MAP to find out"
	cont "where you are."
	done

_BluesHouseDaisyWalkingText::
	text "BOA: Spending"
	line "time with your"
	cont "#MON makes them"
	cont "more friendly."
	done

_BluesHouseTownMapText::
	text "It's a big map!"
	line "This is useful!"
	done
