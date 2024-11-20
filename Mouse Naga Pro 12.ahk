;// Razer Naga Pro 12 Layers Programmable Control with AHK
;// By ahmadsodikin-the3rd
;//

;// 1: Global Tab Layer
;// 2, 3, Add, Sub: Custom App Layer
;// 4, 7: Global Window Layer
;// 5, 6: Global Operational Layer
;// 8, 9: Home & End
;// 10, 11, 12, Add, Sub: Temp Single Use

SetNumLockState, On

; Default Layer
;================================================
NumpadMult::Send ^#{Left} ;// Prev Virtual Desktop
NumpadDiv::Send ^#{Right} ;// Next Virtual Desktop
!WheelUp::Send {WheelLeft}{WheelLeft}{WheelLeft}
!WheelDown::Send {WheelRight}{WheelRight}{WheelRight}

;// Num1: Global Tab Layer
Numpad1::Send ^{Tab}
Numpad1 & LButton::Send ^t
Numpad1 & MButton::Send ^+t
Numpad1 & RButton::Send ^w
Numpad1 & WheelUp::Send {WheelLeft}
Numpad1 & WheelDown::Send {WheelRight}
Numpad1 & NumpadMult::Send ^{Tab}
Numpad1 & NumpadDiv::Send ^+{Tab}

;// Num 4: Window Layer
Numpad4::Send !{Tab} ;// Switch App
Numpad4 & LButton::Send {LWin} ;//Window Button
;Numpad4 & MButton::
Numpad4 & RButton:: ;// Close App
	MsgBox, 4,, Would you like to close window? (press Yes or No)
	IfMsgBox Yes 
		Send !{F4} 
return
Numpad4 & WheelUp::Send #{Up} ;//Maximise
Numpad4 & WheelDown::Send #{Down} ;// Minimise
Numpad4 & NumpadMult::Send #t ;// Select taskbar app
Numpad4 & NumpadDiv::Send #t ;// Select taskbar app

;// Num 7: Window Layer
;//Numpad7::Send !{Esc} ;// Cycle App
Numpad7::Send #t ;// Select taskbar app
Numpad7 & LButton::Send #{Tab} ;// Task view
;Numpad7 & MButton::
Numpad7 & RButton::Send #d ;//Hide/Show Desktop
Numpad7 & WheelUp::Send {WheelRight}
Numpad7 & WheelDown::Send {WheelLeft}
;Numpad7 & NumpadMult::
;Numpad7 & NumpadDiv::

;// Num 5: Operational Layer
Numpad5::Send {Enter}
Numpad5 & LButton::Send ^c
Numpad5 & MButton::Send #+s ;//Screenshoot
Numpad5 & RButton::Send ^v
Numpad5 & WheelUp::Send {Home}
Numpad5 & WheelDown::Send {End}
Numpad5 & NumpadMult:: ;// Block Line
	Send {Home}{Home}
	Send +{End}
return
Numpad5 & NumpadDiv:: ;// Block Line
	Send {Home}{Home}
	Send +{End}
return

;// Num 6: Operational Layer
Numpad6::Send {Tab}
Numpad6 & LButton:: ;// Line Copy
	Send {Home}{Home}
	Send +{End}
	Send ^c
return
;Numpad6 & MButton:: 
Numpad6 & RButton:: ;// Line paste
	Send {Home}{Home}
	Send +{End}
	Send ^v
return
Numpad6 & WheelUp::
	Send ^a
	Send ^c
return
Numpad6 & WheelDown::
	Send ^a
	Send ^c
return
Numpad6 & NumpadMult::Send {Right}
Numpad6 & NumpadDiv::Send {Left}

;// Home & End
Numpad8::Send {End}
Numpad8 & LButton::Send ^{End}
;Numpad8 & MButton::
Numpad8 & RButton::Send +{End} ;//Shift End
Numpad8 & WheelUp::Send ^+{End}
Numpad8 & WheelDown::Send ^+{End}
;Numpad8 & NumpadMult::
;Numpad8 & NumpadDiv::
^Numpad8::Send ^{End} ;//Ctrl End
NumpadUp::Send +{End} ;//Shift End
^NumpadUp::Send ^+{End} ;//Ctrl Shift End

Numpad9::Send {Home}
Numpad9 & LButton::Send ^{Home}
;Numpad9 & MButton::
Numpad9 & RButton::Send +{Home} ;//Shift Home
Numpad9 & WheelUp::Send ^+{Home}
Numpad9 & WheelDown::Send ^+{Home}
;Numpad9 & NumpadMult::
;Numpad9 & NumpadDiv::
^Numpad9::Send ^{Home} ;//Ctrl Home 
NumpadPgUp::Send +{Home} ;//Shift Home
^NumpadPgUp::Send ^+{Home} ;//Ctrl Shift Home

Numpad0::Send {Media_Play_Pause}
Numpad0 & LButton::Send #{PrintScreen} ;// Capture & Save screen 
Numpad0 & RButton::Send #{PrintScreen} ;// Capture & Save screen 

NumpadEnter::Send {Backspace} ;//11
NumpadDot::Send {Delete} ;//12
NumpadSub::
	CoordMode Mouse, Screen
	MouseGetPos, xpos, ypos 
	MsgBox, The cursor is at X%xpos% Y%ypos%.
return

; Chrome & Firefox
;================================================
#If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")
	MButton::Send {Home}{F5}
	Numpad1 & RButton::
		Send ^w
		Sleep, 100
		Send {Escape}
	return
	
	Numpad2::Send {MButton}
	Numpad2 & LButton:: ;// Search udin
		Send udin`%
		Send {Enter}
	return
	Numpad2 & MButton::Send {Home}{F5}
	;Numpad2 & RButton::^+j ;// Dev Console
	Numpad2 & RButton:: ;// Type OK
		SendInput {Raw}ok
		Send {Tab}
		;//Send muhammad.ss
	return
	Numpad2 & WheelUp::Send ^{+}
	Numpad2 & WheelDown::Send ^{-}
	Numpad2 & NumpadMult::Send {Browser_Forward}
	Numpad2 & NumpadDiv::Send {Browser_Back}

	Numpad3::Send {Right}
	Numpad3 & LButton::Send {Space} ;// Pause for video
	;Numpad3 & MButton::
	Numpad3 & RButton::Send f ;// Fullscreen for video
	Numpad3 & WheelUp::Send {Up} ;// For video
	Numpad3 & WheelDown::Send {Down} ;// For video
	Numpad3 & NumpadMult::Send {Right} ;// For video
	Numpad3 & NumpadDiv::Send {Left} ;// For video
	
	NumpadSub::
		Send {Home}{F5}
	return
	
#If


; Notepad++
;================================================
#IfWinActive ahk_exe notepad++.exe
	Numpad1 & LButton::Send ^n
#If


; Visual Studio 2019
;================================================
#IfWinActive ahk_exe devenv.exe
	
	MButton::Send ^k^n ;// Goto Next Bookmark
	Numpad1 & RButton::Send ^{F4} ;// Close Tab	

	Numpad2::Send ^!l ;// Goto Solution explorer 
	Numpad2 & LButton::Send {F5}
	Numpad2 & MButton:: ;//Get Latest Solution
		Send !g
		Send u
	;	Send ^!l
	;	Send {Home}
	;	Send {AppsKey}
	;	Send {Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}
	return
	Numpad2 & RButton::Send +{F5}
	;Numpad2 & WheelUp::
	;Numpad2 & WheelDown::
	;Numpad2 & NumpadMult:: 
	Numpad2 & NumpadDiv:: ;//Merging
		Send {AppsKey}
		Send bm
	return

	Numpad3::Send ^m^o
	Numpad3 & LButton::Send {LButton}^{F12} ;// Goto Implementation
	Numpad3 & MButton::Send {LButton}+{F12} ;// Find All Referencen
	Numpad3 & RButton::Send {LButton}{F12} ;// Goto Definition
	;//Numpad3 & WheelUp::Send ^+{F8} ;// Prev Diff
	;//Numpad3 & WheelDown::Send ^{F8} ;// Next Diff
	Numpad3 & WheelUp::Send +{F8} ;// Prev Diff
	Numpad3 & WheelDown::Send {F8} ;// Next Diff
	Numpad3 & NumpadMult:: Send ^+- ;//Foward
	Numpad3 & NumpadDiv::	Send ^- ;//Back
	
	;Numpad8:: 
	
	;Numpad9:: ;// Open Team Explorer
	;	CoordMode Mouse, Screen
	;	MouseGetPos, xpos, ypos 
	;	MouseMove, 1600, 290
	;	Send {LButton}
	;	MouseMove, %xpos%, %ypos%
	;return
	;Numpad9 & LButton:: ;//Get Specifix > Latest > Overwrite
	;	Send !f
	;	Send r
	;	Send n
	;	Send g
	;	Sleep, 1000
	;	Send {LShift down}{Tab}{Tab}{Tab}{LShift up}
	;	Send {Space}
	;	Send {LShift down}{Tab}{LShift up}
	;	Send {Space}
	;	Send {Tab}{Tab}
	;return
	;Numpad9 & MButton:: ;//Undo Pending Change / Checkout
	;	Send !f
	;	Send r
	;	Send u
	;return
	;Numpad9 & RButton:: ;//Compare
	;	Send !f
	;	Send r
	;	Send c
	;return
	
	NumpadAdd:: ;//Open Source Control
		Send !v
		Send e
		Send s		
	return
	
	NumpadSub:: ;//Open Pending Changes
		Send ^0^g
	;	Send !v
	;	Send e
	;	Send h
	return

#If

; Visual Code 
;================================================
#IfWinActive ahk_exe Code.exe
	Numpad2::Send ^+e ;// Solution explorer
	Numpad2 & LButton::Send ^e ;// Find file
	Numpad2 & MButton::Send ^f ;// Find
	Numpad2 & RButton::Send ^+f ;// Find in all file
	;Numpad2 & WheelUp::
	;Numpad2 & WheelDown::
	Numpad2 & NumpadMult:: ;// Find File with paste
		Send ^e
		Sleep 500
		Send ^v
		Sleep 500
		Send {Enter}		
	return
	;Numpad2 & NumpadDiv::

	Numpad3:: ;// Collapse line
		Send ^k^8 
		Send ^k^7 
		Send ^k^6 
		Send ^k^5 
		Send ^k^4 
		Send ^k^3 
		Send ^k^2 
	return
	Numpad3 & LButton::Send  {LButton}^{F12} ;// Goto Impl
	Numpad3 & MButton::Send  {LButton}+!{F12} ;// Find All Ref
	Numpad3 & RButton::Send  {LButton}{F12} ;// Goto Definition
	;Numpad3 & WheelUp::
	;Numpad3 & WheelDown::
	;Numpad3 & NumpadMult::
	;Numpad3 & NumpadDiv::
#If

; Navicat
;================================================
#IfWinActive ahk_exe navicat.exe
	Numpad2::Send {F5}
	Numpad2 & LButton::Send ^f
	;Numpad2 & MButton::
	Numpad2 & RButton:: ;// Filter
		Send {RButton}
		Sleep 100
		Send {Up}{Up}{Up}{Up} {Right}
		Sleep 100
		Send {Enter}
	return
	Numpad2 & WheelUp::Send ^{Home}
	Numpad2 & WheelDown::Send ^{End}
	;Numpad2 & NumpadMult::
	;Numpad2 & NumpadDiv::

	Numpad3::Send ^r ;// Run Query
	Numpad3 & LButton::Send ^q ;// New Query
	;Numpad3 & MButton::
	;Numpad3 & RButton::
	;Numpad3 & WheelUp::
	;Numpad3 & WheelDown::
	;Numpad3 & NumpadMult::
	;Numpad3 & NumpadDiv::	
#If

; SmartGIT
;================================================
#IfWinActive ahk_exe smartgit.exe
	Numpad2::Send ^k
	Numpad3::Send ^+k
	NumpadAdd::Send ^+m ;//Cherry Pick
	NumpadSub::Send ^+m ;//Cherry Pick
#If

; Postman
;================================================
#IfWinActive ahk_exe Postman.exe
	
	MButton::Send ^{Enter}
	NumpadSub::Send ^{Enter}
	
	Numpad2:: ;// Line Delete
		Send {Home}{Home}
		Send +{End}
		Send {Delete}
	return
	
	Numpad3:: ;// Double Click paste
		Send {LButton 2}
		Send ^v
	return
	
	
#If

; Win Merge
;================================================
#IfWinActive ahk_exe WinMergeU.exe
	Numpad2::Send !{Down}
	Numpad3::Send !{Up}
	NumpadSub::Send {F5}
	MButton::Send {F5}
#If

 ;MS Team
;================================================
#IfWinActive ahk_exe ms-teams.exe
	Numpad2::Send ^+m ;// Mute Toggle 
	Numpad2 & LButton::Send ^2; // Open Chat
	;Numpad2 & MButton::
	Numpad2 & RButton::Send ^3; // Open Team
	;Numpad2 & WheelUp::
	;Numpad2 & WheelDown::
	;Numpad2 & NumpadMult::
	;Numpad2 & NumpadDiv::

	Numpad3::Send #{PrintScreen} ;// Capture & Save screen 
	Numpad3 & LButton::Send #{Up} ;// Maximize
	;Numpad3 & MButton::
	Numpad3 & RButton::Send #{Down} ;// Restore or Minimize
	;Numpad3 & WheelUp::
	;Numpad3 & WheelDown::
	;Numpad3 & NumpadMult::
	;Numpad3 & NumpadDiv::
#If

; GOM Player
;================================================
#IfWinActive ahk_exe GOM.exe
	MButton::Send !h
	NumpadSub::Send !h
	
	Numpad2::Send {Left}
	Numpad2 & LButton::Send {Space}
	;Numpad2 & MButton::
	Numpad2 & RButton::Send {Space}
	Numpad2 & WheelUp::Send r ;// Brigthness +
	Numpad2 & WheelDown::Send e ;// Brigthness -
	;Numpad2 & NumpadMult::
	;Numpad2 & NumpadDiv::

	Numpad3::Send {Right}
	;Numpad3 & LButton::
	;Numpad3 & MButton::
	;Numpad3 & RButton::Send {Enter}
	Numpad3 & WheelUp::Send y ;// Contrast +
	Numpad3 & WheelDown::Send t ;// Contrast -
	;Numpad3 & NumpadMult::
	;Numpad3 & NumpadDiv::
	
#If

; Microsoft Excel
;================================================
#IfWinActive ahk_exe EXCEL.EXE
	
	Numpad2::Send ^{PgUp}
	Numpad2 & LButton:: ;// Insert New Row
		Send ^+{=}
		Sleep 100
		Send r
		Sleep 100
		Send {Enter}
	return	
	;Numpad2 & MButton::
	Numpad2 & RButton::  ;// Delete Row
		Send ^{-}
		Sleep 100
		Send r
		Sleep 100
		Send {Enter}
	return	
	;Numpad2 & WheelUp::
	;Numpad2 & WheelDown::
	;Numpad2 & NumpadMult::
	;Numpad2 & NumpadDiv::

	Numpad3::Send ^{PgDn}
	Numpad3 & LButton:: ;// Insert New Row Alt
		Send {AppsKey}
		Sleep 100
		Send i
		Sleep 100
		Send {Enter}
		Sleep 100
		Send {Down}
		Send {Enter}
	return	
	;Numpad3 & MButton::
	;Numpad3 & RButton::Send {Enter}
	;Numpad3 & WheelUp::Send y ;// Contrast +
	;Numpad3 & WheelDown::Send t ;// Contrast -
	;Numpad3 & NumpadMult::
	;Numpad3 & NumpadDiv::
	
#If


;Template Custom App
;================================================
;#IfWinActive ahk_exe Template.exe
	;// Num 2: Custom App
	;Numpad2::
	;Numpad2 & LButton::
	;Numpad2 & MButton::
	;Numpad2 & RButton::
	;Numpad2 & WheelUp::
	;Numpad2 & WheelDown::
	;Numpad2 & NumpadMult::
	;Numpad2 & NumpadDiv::

	;// Num 3: Custom App
	;Numpad3::
	;Numpad3 & LButton::
	;Numpad3 & MButton::
	;Numpas3 & RButton::
	;Numpad3 & WheelUp::
	;Numpad3 & WheelDown::
	;Numpad3 & NumpadMult::
	;Numpad3 & NumpadDiv::

	;// Numm Add & Sub: Custom App
	;NumpadAdd::
	;NumpadSub::
;#If


;Full Template
;================================================
;#IfWinActive ahk_exe Template.exe
	;// Num 1: Layer 1
	;Numpad1::
	;Numpad1 & LButton::
	;Numpad1 & MButton::
	;Numpad1 & RButton::
	;Numpad1 & WheelUp::
	;Numpad1 & WheelDown::
	;Numpad1 & NumpadMult::
	;Numpad1 & NumpadDiv::
	;Numpad1 & NumpadAdd::
	;Numpad1 & NumpadSub::

	;// Num 2: Layer 2
	;Numpad2::
	;Numpad2 & LButton::
	;Numpad2 & MButton::
	;Numpad2 & RButton::
	;Numpad2 & WheelUp::
	;Numpad2 & WheelDown::
	;Numpad2 & NumpadMult::
	;Numpad2 & NumpadDiv::
	;Numpad2 & NumpadAdd::
	;Numpad2 & NumpadSub::

	;// Repeat until Num 0

	;// Num Enter: Layer 11
	;NumpadEnter::
	;NumpadEnter & LButton::
	;NumpadEnter & MButton::
	;NumpadEnter & RButton::
	;NumpadEnter & WheelUp::
	;NumpadEnter & WheelDown::
	;NumpadEnter & NumpadMult::
	;NumpadEnter & NumpadDiv::
	;NumpadEnter & NumpadAdd::
	;NumpadEnter & NumpadSub::
	
	;// Num Dot: Layer 12
	;NumpadDot::
	;NumpadDot & LButton::
	;NumpadDot & MButton::
	;NumpadDot & RButton::
	;NumpadDot & WheelUp::
	;NumpadDot & WheelDown::
	;NumpadDot & NumpadMult::
	;NumpadDot & NumpadDiv::
	;NumpadDot & NumpadAdd::
	;NumpadDot & NumpadSub::
;#If