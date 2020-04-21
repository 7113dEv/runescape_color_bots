HotKeySet("{f1}", "myExit")

$x = WinActivate("RuneScape")

$city = ""
$first_teleport = True

while(1)
Mining_FallyOres()


WEnd



;------FUNCTIONS------

Func myExit()
   MsgBox(0,"Exiting", "You are no longer skilling with your bot.")
   exit
EndFunc


Func LC($x, $y)
   MouseClick("left", $x, $y, 1, 1)
EndFunc


Func ViewReset()
   MouseClick("left",1595,54,1,1)
   Send("{PGDN down}")
   Send("{UP down}")
   sleep(2000)
   Send("{PGDN up}")
   Send("{UP up}")

EndFunc


;------CITY TELEPORTS------
Func Teleport($city)
   If $city = "taverley" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("t", 1)

   ElseIf $city = "lumbridge" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("l", 1)

   ElseIf $city = "burthorpe" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("b", 1)

   ElseIf $city = "al kharid" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("a", 1)

   ElseIf $city = "varrok" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("v", 1)

   ElseIf $city = "edgeville" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("e", 1)

   ElseIf $city = "falador" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("f", 1)

   ElseIf $city = "port sarim" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("p", 1)

   ElseIf $city = "draynor village" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("d", 1)

   ElseIf $city = "catherby" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("c", 1)

   ElseIf $city = "seers village" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("s", 1)

   ElseIf $city = "karamja" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("k", 1)

   ElseIf $city = "wilderness" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("w", 1)

   EndIf
   Sleep(17000)

EndFunc

Func Mining_FallyOres()

;Get to mines from Home Tele in Fally
While($first_teleport = True)
   Teleport("falador")
   ViewReset()

   ;Walking to the Miners Guild mine entrance
   LC(1861,328)
   Sleep(15000)
   LC(1843,303)
   Sleep(17500)
   LC(901,545)
   Sleep(5000)
   ;Entering mine and falsifying $first_teleport variable

   $first_teleport = False

WEnd

;WHILE mining keepStaminaBarFull()
$orebox_orchalcite_full = False
$orebox_runite_full = True
$orebox_luminite_full = True
$orebox_drakolith_full = True
$backpack_full = True
;ViewReset()
;Mining each ore in mining guild and filling it up in the ore box

;Mining Orchalcite
While($orebox_orchalcite_full = False)

   ;Walking from the Entrance to first ore deposit
   ViewReset()
   LC(1837,188)
   Sleep(8000)
   ViewReset()
   LC(885,642)

while(Not($orebox_orchalcite_full))
   $oreBox = 0

   ;Check for unwanted GEODES and remove from inventory
   $geode = PixelSearch(1729,706,1913,959,0x554D4D,1)
   If Not(@error) Then
	  MouseClickDrag("primary",$geode[0],$geode[1],1401,576,10)
	  Sleep(1500)
	  MouseUp("primary")
	  Sleep(0500)
   EndIf


   ;Check if inventory is full, If TRUE deposit into OREBOX and add to counter
   $pixels = PixelSearch(1892,939,1894,941,0x841700,1)
   If Not(@error) Then
	  LC(1757,725)
	  Sleep(2000)
	  $oreBox += 27
		 If $oreBox = 120 Then
			$orebox_orchalcite_full = True
			$orebox_runite_full = False
		 ElseIf $oreBox = 108 Then ;Trying to put perfect amount into orebox // NOT WORKING
			$inventoryOre = PixelSearch(1754,829,1756,831,0x821700,1)
			If Not(@error) Then
			   LC(1757,725)
			   Sleep(2000)
			EndIf

		 EndIf

	  ;If inventory NOT full, search nearby for deposit and click on it to fill stamina bar
	  ElseIf Not(Not(@error)) Then
		 $oreColor = PixelSearch(861,481,1074,642,0x92221D,1) ;Ore deposit color
		 LC($oreColor[0],$oreColor[1])
		 sleep(Random(5000,20000))
   EndIf

WEnd
WEnd

;~ ;Mining Runite
;~ While($orebox__full = False)
   WalkToOreDeposit()
   MineOre()
   ;Remove Geodes from inventory
   FillOreBox()
   ;When ore box is full, go onto the next ore

;~ WEnd


;~ ;Mining Luminite
;~ While($orebox__full = False)
   WalkToOreDeposit()
   MineOre()
   ;Remove Geodes from inventory
   FillOreBox()
   ;When ore box is full, go onto the next ore

;~ WEnd


;~ ;Mining Drakolith
;~ While($orebox__full = False)
   WalkToOreDeposit()
   MineOre()
   ;Remove Geodes from inventory
   FillOreBox()
   ;When ore box is full, fill remaining inventory with ore

;~ WEnd

DepositIntoBank()
ReturnToMine()
EndFunc