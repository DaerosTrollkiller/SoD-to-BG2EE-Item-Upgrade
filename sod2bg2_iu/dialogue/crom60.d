EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("sw1h52")~ THEN GOTO NewItem 	//Water's Edge +5
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN NewItem SAY @285
    IF ~!PartyHasItem("dtkbowat")~ THEN GOTO NewItem2
    IF ~PartyHasItem("dtkbowat")~ THEN GOTO NewItem3
  END

  IF ~~ THEN BEGIN NewItem2 SAY @286
    IF ~~ THEN GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NewItem3 SAY @287
    IF ~PartyGoldLT(7500)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(7499)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",73)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(7500)
                                                 TakePartyItemNum("sw1h52",1)
                                                 TakePartyItemNum("dtkbowat",1)
                                                 DestroyItem("sw1h52")
                                                 DestroyItem("dtkbowat")
                                                 DestroyGold(7500)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NoThanks SAY @3
   COPY_TRANS WSMITH01 13
  END
END