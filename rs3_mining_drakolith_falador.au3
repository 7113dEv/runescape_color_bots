HotKeySet("{f1}", "myExit")

$x = WinActivate("RuneScape")

$city = ""
$first_teleport = True

while(1)
miningDrakolith()


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

Func MineOre()

   ;Filling the ore box leaves 16 open inventory slots
   ;Think of way to fill inventory completely

   $OreBox = 0

   While $OreBox < 5

	  ;Check for unwanted GEODES and remove from inventory. SAVE $metamorphic_geode
	  $igneous_geode = PixelSearch(1729,706,1913,959,0x554D4D,1)
	  If Not(@error) Then
		 MouseClickDrag("primary",$igneous_geode[0],$igneous_geode[1],1401,576,10)
		 Sleep(1500)
		 MouseUp("primary")
		 Sleep(0500)
	  EndIf

	  ;Check if inventory is full, If TRUE deposit into OREBOX and add to counter
	  $pixels = PixelSearch(1891,937,1893,939,0x28221E)
	  If (Not(@error)) Then
		 ;LC rock next to user. Must find gold sparkles
		 LC(1011,549)
		 Sleep(1000)
		 MouseMove(1036,488,1)
		 sleep(Random(5000,20000))
	  ElseIf Not(Not(@error)) Then
		 ;Put inventory into Ore Box
		 LC(1757,725)
		 Sleep(2000)
		 $OreBox += 1
		 MsgBox(0,"","I have succesfully found room in your OreBox this many times: " &$OreBox,2)
	  EndIf



   WEnd

EndFunc




Func DepositIntoBank()
   ;Leave mine and go to bank chest
   LC(684,291)
   Sleep(4500)
   ;Climb up Ladder // Extend sleep period for load times
   LC(865,620)
   Sleep(8000)
   ;Run to bank Chest
   LC(1902,186)
   Sleep(14500)

   ;Open Bank chest
   LC(993,556)
   sleep(2000)
   ;Deposit ores in inventory
   MouseClick("secondary",1271,522,1)
   Sleep(0500)
   LC(1256,628)
   sleep(1000)
   ;Deposit ores in orebox
   MouseClick("secondary",1125,307,1)
   Sleep(0500)
   LC(1116,353)
   Sleep(0500)
   ;Exit bank screen
   LC(1289,238)
   Sleep(0500)

EndFunc




Func ReturnToMine()
   ;Run to ladder entrance
   LC(1590,185)
   Sleep(15000)
   ;Enter via ladder // Extend sleep period for load times
   LC(903,543)
   Sleep(8000)
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




; ------___Main Function___------




Func miningDrakolith()

;~    ;Get to mines from Home Tele in Fally
;~    While($first_teleport = True)
;~ 	  Teleport("falador")
;~ 	  ViewReset()

;~ 	  ;Walking to the Miners Guild mine entrance
;~ 	  LC(1861,328)
;~ 	  Sleep(15000)
;~ 	  LC(1843,303)
;~ 	  Sleep(17500)
;~ 	  LC(901,545)
;~ 	  Sleep(5000)
;~ 	  ;Entering mine and falsifying $first_teleport variable

;~ 	  $first_teleport = False

;~    WEnd

	  ;Walking from the Entrance to first ore deposit
	  ViewReset()
	  LC(1002,425)
	  Sleep(8000)
	  ;Clicking rock after entering mine location
	  LC(1348,823)
	  Sleep(3000)


	  MineOre()

	  MsgBox(0,"","You have a full ore box!",1)
	  DepositIntoBank()
	  ReturnToMine()

EndFunc