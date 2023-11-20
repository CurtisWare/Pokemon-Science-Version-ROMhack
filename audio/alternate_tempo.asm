; an alternate start for MeetCoqui which has a different first measure
Music_CoquiAlternateStart::
	ld c, BANK(Music_MeetCoqui)
	ld a, MUSIC_MEET_COQUI
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetCoqui_Ch1_AlternateStart
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetCoqui_Ch2_AlternateStart
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetCoqui_Ch3_AlternateStart

Audio1_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

; an alternate tempo for MeetCoqui which is slightly slower
Music_CoquiAlternateTempo::
	ld c, BANK(Music_MeetCoqui)
	ld a, MUSIC_MEET_COQUI
	call PlayMusic
	ld de, Music_MeetCoqui_Ch1_AlternateTempo
	jr FinishAlternateCoquiMusic

; applies both the alternate start and alternate tempo
Music_CoquiAlternateStartAndTempo::
	call Music_CoquiAlternateStart
	ld de, Music_MeetCoqui_Ch1_AlternateStartAndTempo
FinishAlternateCoquiMusic:
	ld hl, wChannelCommandPointers
	jp Audio1_OverwriteChannelPointer

	ret ; unused

; an alternate tempo for Cities1 which is used for the Hall of Fame room
Music_Cities1AlternateTempo::
	ld a, 10
	ld [wAudioFadeOutCounterReloadValue], a
	ld [wAudioFadeOutCounter], a
	ld a, $ff ; stop playing music after the fade-out is finished
	ld [wAudioFadeOutControl], a
	ld c, 100
	call DelayFrames ; wait for the fade-out to finish
	ld c, BANK(Music_Cities1)
	ld a, MUSIC_CITIES1
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_Cities1_Ch1_AlternateTempo
	jp Audio1_OverwriteChannelPointer
