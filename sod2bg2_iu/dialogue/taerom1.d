APPEND TAEROM

IF WEIGHT #-1
~PartyHasItem("cdrem")~ THEN BEGIN 20 SAY @8016 
  IF ~Global("dtkMakeRemoHelm","GLOBAL",0)~ 
  THEN REPLY @6047 GOTO 22
  IF ~~ THEN REPLY @6048 DO ~StartStore("Taerum",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @6049 GOTO 21
  IF ~GlobalGT("dtkMakeRemoHelm","GLOBAL",0)~ THEN REPLY @6050 EXIT
END

IF ~~ THEN BEGIN 21 
  SAY @8017 
  IF ~~ THEN DO ~TakePartyItem("cdrem")
DestroyItem("cdrem")
GiveGoldForce(2000)~
SOLVED_JOURNAL @6058 EXIT
END

IF ~~ THEN BEGIN 22 
  SAY @8018
  IF ~~ THEN REPLY @6051 GOTO 23
  IF ~PartyGoldGT(5999)~
  THEN REPLY @6052 GOTO 24
END

IF ~~ THEN BEGIN 23
  SAY @8019
  IF ~~ THEN UNSOLVED_JOURNAL @6053 EXIT
END

IF ~~ THEN BEGIN 24 
  SAY @8020 
  IF ~~ THEN REPLY @6056 DO ~TakePartyGold(6000)
TakePartyItem("cdrem")
DestroyItem("cdrem")
SetGlobal("dtkMakeRemoHelm","GLOBAL",1)
SetGlobalTimer("dtkTaeromRemorhelm","GLOBAL",FIVE_DAYS)~
UNSOLVED_JOURNAL @6054 EXIT

  IF~PartyGoldGT(7999)~
THEN REPLY @6055 DO ~TakePartyGold(8000)
TakePartyItem("cdrem")
DestroyItem("cdrem")
SetGlobal("dtkMakeRemoHelm","GLOBAL",1)
SetGlobalTimer("dtkTaeromRemorhelm","GLOBAL",ONE_DAY)~ GOTO 25
END

IF ~~ THEN BEGIN 25
  SAY @8021 
  IF ~~ THEN UNSOLVED_JOURNAL @6057  EXIT
END

IF WEIGHT #-1 ~GlobalTimerExpired("dtkTaeromRemorhelm","GLOBAL")
Global("dtkMakeRemoHelm","GLOBAL",1)~ THEN BEGIN 26  
  SAY @8022 
  IF ~~ THEN DO ~GiveItemCreate("cdrelm",LastTalkedToBy(Myself),1,0,0)
DestroyItem("dtkrnd10")
SetGlobal("dtkMakeRemoHelm","GLOBAL",2)
EraseJournalEntry(@6053)
EraseJournalEntry(@6054)
EraseJournalEntry(@6057)~ SOLVED_JOURNAL @6059 EXIT
END
END

