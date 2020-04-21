HotKeySet("{f1}", "myExit")

$x = WinActivate("RuneScape")

$city = ""
$first_teleport = True

while(1)
   ViewReset()
;mine gold
   LC(1281,650)
   Sleep(5000)

   $backpackfull = False
   While $backpackfull = False
	  ;Checking last inv color. If background color, continue mining.
	  $pixel = PixelSearch(1891,939,1893,941,0x3E3529,1)

		 ;If it IS the background color
		 If Not(@error) Then
			;keep clicking rock
		  	LC(1020,511)
			Sleep(Random(1000,3000))

		 ;If it contains the gold ore color
		 ElseIf (Not(Not(@error))) Then
			;go to furnace
			LC(420,382)
			Sleep(5000)
			$backpackfull = True
		 EndIf
   WEnd

;smelt to bars
   LC(596,524)
   Sleep(0250)
   LC(925,321)
   Sleep(0250)
   LC(1161,596)
   Sleep(35000)
;make rings
   LC(884,490)
   Sleep(1000)
   MouseMove(785,577,1)
   Sleep(0200)
   MouseDown("primary")
   Sleep(0200)
   MouseClick("primary",650,555,3)
   Sleep(1000)
   LC(823,323)
   sleep(0250)
   LC(1158,596)
   Sleep(35000)
;deposit and Return
   LC(1278,536)
   Sleep(4000)
   LC(1124,599)
   Sleep(0500)
   LC(1286,239)
   Sleep(0250)


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
   sleep(1750)
   Send("{PGDN up}")
   Send("{UP up}")

EndFunc