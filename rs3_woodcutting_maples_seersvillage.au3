HotKeySet("{f1}", "myExit")

$x = WinActivate("RuneScape")

$travel_time = 14000
$city = ""
$first_teleport = True

while(1)
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

Func Woodcutting_Maples()

While($first_teleport)
;Starting at teleport in Seer's Village
Teleport("seers village")
ViewReset()

;Walk to the Maple Tree
LC(1878, 115)
sleep(15000)
$first_teleport = False
WEnd

$backpack_full = False

while $backpack_full = False
   ;Checking if there is a trunk via LEAF color spotting
   $pixels = PixelSearch(877,519,879,521,0x696A26,1)

	  ;If the trunk is there, LC every 5 seconds//Holds down LC w/out Sleep command
	  If Not(@error) Then
		 LC($pixels[0],$pixels[1])
		 Sleep(Random(1000,5000))
	  EndIf

   ;Possibly find another trunk if current one is not available

   ;Checking inventory slot for log via color spotting
   $pixels = PixelSearch(1891,938,1893,940,0x664B2A,1)
   if Not(@error) Then
	  LC(1053,770)
	  Sleep(8000)
	  $backpack_full = True
   EndIf


WEnd

;Depositing logs into bank
LC(1784,229)
Sleep(3000)
LC(1289,238)
sleep(1500)

;Walking back to Maple Tree
LC(909,298)
Sleep(8500)
EndFunc