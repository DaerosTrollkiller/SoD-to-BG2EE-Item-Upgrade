EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("dtksorcp")~ THEN GOTO NewItem //Sourceror's Cap +1
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN NewItem SAY @199
    IF ~!PartyHasItem("helm27")~ THEN GOTO NewItem2
    IF ~PartyHasItem("helm27")~ THEN GOTO NewItem3
  END

  IF ~~ THEN BEGIN NewItem2 SAY @200
    IF ~~ THEN GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NewItem3 SAY @201
    IF ~PartyGoldLT(5000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(4999)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",68)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(5000)
                                                 TakePartyItemNum("dtksorcp",1)
                                                 TakePartyItemNum("helm27",1)
                                                 DestroyItem("dtksorcp")
                                                 DestroyItem("helm27")
                                                 DestroyGold(5000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NoThanks SAY @3
   COPY_TRANS WSMITH01 13
  END
END