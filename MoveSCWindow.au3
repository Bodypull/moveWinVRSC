#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\..\..\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Green.ico
#AutoIt3Wrapper_Outfile=MoveSCWindow.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <Array.au3>
#include <Misc.au3>

$hGUI = GUICreate("Press ALT+Arrow Keys to move SC Window", 400, 100)
$LabelText = "Press ALT + Arrow Keys to move the SC window by 100 pixel" & @CRLF & @CRLF
$LabelText &= "If you can't click buttons at the very bottom you have to move the window up with ALT + UP and so on"
$LabelOne = GUICtrlCreateLabel($LabelText, 10, 10, 380, 200)
GUISetState()

$vDLL = "user32.dll"

While 1
	$iMsg = GUIGetMsg()
	If _IsPressed("12", $vDLL) Then
		$hSC = WinGetHandle("[CLASS:CryENGINE; TITLE:Star Citizen]")
		If Not @error Then
			$aWinPos = WinGetPos($hSC)
			If _IsPressed("25", $vDLL) Then	WinMove($hSC, "", $aWinPos[0]-100, Default)
			If _IsPressed("26", $vDLL) Then	WinMove($hSC, "", Default, $aWinPos[1]-100)
			If _IsPressed("27", $vDLL) Then	WinMove($hSC, "", $aWinPos[0]+100, Default)
			If _IsPressed("28", $vDLL) Then	WinMove($hSC, "", Default, $aWinPos[1]+100)
		EndIf
	EndIf
	Switch $iMsg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd