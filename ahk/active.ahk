; ---------------------------------------------------------
;!f::
;{
;        DetectHiddenWindows, on
;        ifWinNotExist ahk_class HwndWrapper[Wox.exe;;403e7913-52e8-4a0b-b01c-2d7a22f80162]
;                Run C:\Users\lenovo\AppData\Local\Wox\Update.exe --processStart Wox.exe
;        else
;            ifWinNotActive ahk_class HwndWrapper[Wox.exe;;403e7913-52e8-4a0b-b01c-2d7a22f80162]
;                    WinActivate
;        Return  
;}
; ---------------------------------------------------------
; ----------------------------Alt+Space -> Wox (Run/Activate)-----------------------------
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
; ---------------------------------------------------------
