;===========================================================================
;======================================实用命令=========================================================

!p::Run, D:\python_learn\powershell.exe.lnk ptpython
!f::Run,d:\python_learn
CapsLock & a::Run, d:\python_learn\spider
#a::Run, firefox.exe,  
;=============================Alt+Space -> Wox (Run/Activate)======================================================
!Space::
{
        DetectHiddenWindows, on
        ifWinNotExist ahk_class HwndWrapper
                Run C:\Users\lenovo\AppData\Local\Wox\Update.exe --processStart Wox.exe
        else
            ifWinNotActive ahk_class HwndWrapper
                    WinActivate
        Return  
}
;=====================改掉大写键（CapsLk）为Enter====================================
;replace CapsLock to LeftEnter; CapsLock = Alt CapsLock
$CapsLock::Enter
LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
;=====================使用Alt+JKLI实现上下左右=====================
;!l::Send, {Left}
;!h::Send, {Right}
!j::Send, {Down}
!k::Send, {Up}
;=====================虚拟桌面 - Ahk  ======================================================
;Autohotkey的脚本，实现虚拟桌面的功能，快捷键Alt+1，2，3，4  
SetBatchLines, -1 ; maximize script speed!  
SetWinDelay, -1  
OnExit, CleanUp ; clean up in case of error (otherwise some windows will get lost)  
numDesktops := 4 ; maximum number of desktops  
curDesktop := 1 ; index number of current desktop  
WinGet, windows1, List ; get list of all currently visible windows  
; ***** hotkeys *****  
!1::SwitchToDesktop(1)  
!2::SwitchToDesktop(2)  
!3::SwitchToDesktop(3)  
!4::SwitchToDesktop(4)  
^!1::SendActiveToDesktop(1)  
^!2::SendActiveToDesktop(2)  
^!3::SendActiveToDesktop(3)  
^!4::SendActiveToDesktop(4)  
!0::ExitApp  
; ***** functions *****  
; switch to the desktop with the given index number  
SwitchToDesktop(newDesktop)  
{  
global  
if (curDesktop <> newDesktop)  
{  
GetCurrentWindows(curDesktop)  
;WinGet, windows%curDesktop%, List,,, Program Manager ; get list of all visible windows  
ShowHideWindows(curDesktop, false)  
ShowHideWindows(newDesktop, true)  
curDesktop := newDesktop  
Send, {ALT DOWN}{TAB}{ALT UP} ; activate the right window  
}  
return  
}  
; sends the given window from the current desktop to the given desktop  
SendToDesktop(windowID, newDesktop)  
{  
global  
RemoveWindowID(curDesktop, windowID)  
; add window to destination desktop  
windows%newDesktop% += 1  
i := windows%newDesktop%  
windows%newDesktop%%i% := windowID  
WinHide, ahk_id %windowID%  
Send, {ALT DOWN}{TAB}{ALT UP} ; activate the right window  
}  
; sends the currently active window to the given desktop  
SendActiveToDesktop(newDesktop)  
{  
WinGet, id, ID, A  
SendToDesktop(id, newDesktop)  
}  
; removes the given window id from the desktop  
RemoveWindowID(desktopIdx, ID)  
{  
global  
Loop, % windows%desktopIdx%  
{  
if (windows%desktopIdx%%A_Index% = ID)  
{  
RemoveWindowID_byIndex(desktopIdx, A_Index)  
Break  
}  
}  
}  
; this removes the window id at index from desktop number  
RemoveWindowID_byIndex(desktopIdx, ID_idx)  
{  
global  
Loop, % windows%desktopIdx% - ID_idx  
{  
idx1 := % A_Index + ID_idx - 1  
idx2 := % A_Index + ID_idx  
windows%desktopIdx%%idx1% := windows%desktopIdx%%idx2%  
}  
windows%desktopIdx% -= 1  
}  
; this builds a list of all currently visible windows in stores it in desktop  
GetCurrentWindows(index)  
{  
global  
WinGet, windows%index%, List,,, Program Manager ; get list of all visible windows  
; now remove task bar “window” (is there a simpler way?)  
Loop, % windows%index%  
{  
id := % windows%index%%A_Index%  
WinGetClass, windowClass, ahk_id %id%  
if windowClass = Shell_TrayWnd ; remove task bar window id  
{  
RemoveWindowID_byIndex(index, A_Index)  
Break  
}  
}  
}  
; if show=true then shows windows of desktop %index%, otherwise hides them  
ShowHideWindows(index, show)  
{  
global  
Loop, % windows%index%  
{  
id := % windows%index%%A_Index%  
if show  
WinShow, ahk_id %id%  
else  
WinHide, ahk_id %id%  
}  
}  
; show all windows from all desktops on exit  
CleanUp:  
Loop, %numDesktops%  
ShowHideWindows(A_Index, true)  
ExitApp  
;===========================================================================
;=============================>>>>>>>>>>>>>>>>>>>>=======================================================



#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.




;Run, Notepad.exe, ,Max
;Run, cmd.exe, ,Max

;Run, firefox.exe, ,WinMinmize
;Run, C:\Users\lenovo\AppData\Roaming\360se6\Application\360se.exe, ,Max
;Run, C:\Users\lenovo\AppData\Roaming\360se6\Application\360se.exe, ,Min


;Run, cmd.exe, ,Hide
;Run, %ComSpec% /k dir c:\windows\system32 
;Run, %ComSpec% /k dir c:\windows\system32
;Run, %ComSpec% /k d: &&cd python_learn &&ptpython
;Run, PowerShell  (d:) -and (cd .\python_learn) -and (ptpython)
;!u::Send ^c !{tab} ^v 
 

