HotKeySet("{f1}", "myExit")

$x = WinActivate("RuneScape")

$travel_time = 14000
$city = ""
$first_teleport = True

while(1)
;Fishing_Taverley()
Woodcutting_Maples()


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
	  sleep(17000)
   ElseIf $city = "lumbridge" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("l", 1)
	  sleep(17000)
   ElseIf $city = "burthorpe" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("b", 1)
	  sleep(17000)
   ElseIf $city = "al kharid" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("a", 1)
	  sleep(17000)
   ElseIf $city = "varrok" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("v", 1)
	  sleep(17000)
   ElseIf $city = "edgeville" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("e", 1)
	  sleep(17000)
   ElseIf $city = "falador" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("f", 1)
	  sleep(17000)
   ElseIf $city = "port sarim" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("p", 1)
	  sleep(17000)
   ElseIf $city = "draynor village" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("d", 1)
	  sleep(17000)
   ElseIf $city = "catherby" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("c", 1)
	  sleep(17000)
   ElseIf $city = "seers village" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("s", 1)
	  sleep(17000)
   ElseIf $city = "karamja" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("k", 1)
	  sleep(17000)
   ElseIf $city = "wilderness" Then
	  LC(1597,312)
	  Sleep(2000)
	  Send("w", 1)
	  sleep(17000)
   EndIf
EndFunc


Func Fishing_Taverley()
;~ ;starting at teleport in Taverley
Teleport("taverley")
ViewReset()

;~ ;Start Travel to fishing spot ***ADD RANDOMIZERS TO CLICKING LOCATIONS***
LC(1836,79)
Sleep($travel_time)

;Fishing loop
$fishing_full = False

while(Not($fishing_full))
   $pixels = PixelSearch(926,535,1027,640,0x8BB6C1,1)

   If Not(@error) Then
	  LC($pixels[0],$pixels[1])
	  sleep(30000)
   EndIf

   $pixels = PixelSearch(1886,938,1888,940,0x6F3A17,1)
   if Not(@error) Then
	  LC(966,864)
	  Sleep(2000)
	  $fishing_full = True
	  Teleport_Taverley()
   EndIf

WEnd
;End fishing loop

;~ ;Travel to a cooking range
LC(1818,194)
Sleep(10000)

;~ ;Cook le seafood
LC(1002,535)
Sleep(2000)
LC(1071,681)
Sleep(69000)

;Go to le bank and deposit my inventory
LC(1658,275)
Sleep(17000)
LC(916,525)
Sleep(2000)
LC(1126,596)
Sleep(3000)
LC(1289,238)


EndFunc


