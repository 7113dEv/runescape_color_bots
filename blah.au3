HotKeySet("{f1}", "myExit")

$x = WinActivate("MozillaCompositorWindowClass")


Func myExit()
   MsgBox(0,"Exiting", "You are finally going to file this thing.")
   exit
EndFunc


Func LC($x, $y)
   MouseClick("left", $x, $y, 1, 1)
EndFunc

Func search_for($color)
   $x = PixelSearch(0,95,1902,1077,$color,1)

   If Not(@error) Then
		 MouseClick("left",$x[0],$x[1],1)
		 Sleep(0500)
   EndIf
EndFunc


$keep_clicking = True

While($keep_clicking = True)

search_for(0x76BC43)

$reason_to_back = PixelSearch(0,95,1902,1077,0x002276,1)
If Not(@error) Then
   LC(20,52)
Else
   $keep_clicking = False
EndIf

WEnd