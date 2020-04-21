HotKeySet("{f1}", "myExit")

$x = WinActivate("RuneScape")

$city = ""
$first_teleport = True

while(1)
   $orebox = 0

For $orebox = 0 To 5 Step +1
	  $pixels = PixelSearch(1891,937,1893,939,0xE69310,1)
   If Not(@error) Then
	  LC(1757,725)
	  Sleep(2000)
	  $oreBox += 1

   ElseIf Not(Not(@error)) Then
		 $oreColor = PixelSearch(994,534,1023,564,0x3A2B2E,1) ;Ore deposit color
		 LC($oreColor[0],$oreColor[1])
		 Sleep(1000)
		 MouseMove(1036,488,1)
		 sleep(Random(5000,20000))

	  If Not(Not(@error)) Then
		 LC(1010,543)
		 Sleep(0500)
	  EndIf



   EndIf
Next
MsgBox(0,"","I have sucessfully filled your inventory.")


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
   MsgBox(0,"","I am mining ore for you.")
   Sleep(2000)
   MsgBox(0,"","You are full of ore. I am placing it in your Ore Box.", 1)
   Sleep(1500)
   $BackpackInventory += 27
EndFunc

Func PutOreInBox()
   $OreBoxInventory += 1
   MsgBox(0,"","I have succesfully found room in your OreBox",2)
   Sleep(1000)
   $BackpackInventory = 0
EndFunc

Func DepositIntoBank()
   ;Code here
EndFunc

Func ReturnToMine()
   ;Code here
EndFunc