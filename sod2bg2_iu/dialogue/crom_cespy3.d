// extend cespenar's generic item search with cromwell's items
EXTEND_BOTTOM BOTSMITH 4
  IF ~OR(3)
        PartyHasItem("sw1h54a")
        PartyHasItem("sw1h54b")
        PartyHasItem("sw1h54c")~ THEN GOTO equalizer // equalizer sword
END

APPEND BOTSMITH              

  IF ~~ THEN BEGIN equalizer SAY @1399
    IF ~OR(3)
          !PartyHasItem("sw1h54a")
          !PartyHasItem("sw1h54b")
          !PartyHasItem("sw1h54c")~ THEN GOTO need_equalizer
    IF ~PartyHasItem("sw1h54a")
        PartyHasItem("sw1h54b")
        PartyHasItem("sw1h54c")~ THEN GOTO equalizer_want
  END

  IF ~~ THEN BEGIN need_equalizer SAY @1400
    COPY_TRANS BOTSMITH 4
  END

  IF ~~ THEN BEGIN equalizer_want SAY @1401
    IF ~PartyGoldLT(7500)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(7499)~ THEN REPLY #66909 DO ~SetGlobal("DTKItemsCespy","GLOBAL",153)
                                                 TakePartyGold(7500)
                                                 TakePartyItemNum("sw1h54a",1)
                                                 DestroyItem("sw1h54a")
                                                 TakePartyItemNum("sw1h54b",1)
                                                 DestroyItem("sw1h54b")
                                                 TakePartyItemNum("sw1h54c",1)
                                                 DestroyItem("sw1h54c")
                                                 DestroyGold(7500)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO equalizer_stall
  END

  IF ~~ THEN BEGIN equalizer_stall SAY @1402
    COPY_TRANS BOTSMITH 4
  END

END                                            
