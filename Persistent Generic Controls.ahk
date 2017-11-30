; Convert text to upper
^!u::
    Send ^x
    StringUpper Clipboard, Clipboard
    Send %Clipboard%
RETURN

; Convert text to upper
^!l::
    Send ^x
    StringLower Clipboard, Clipboard
    Send %Clipboard%
RETURN

; Convert text to capitalized
^!k::
    Send ^x
    StringUpper Clipboard, Clipboard, T
    Send %Clipboard%
RETURN

; Minimize current window
^!m::
    Send !{space}
    Sleep, 10
    Send n
RETURN

; Email Signature
:*:jc@::
(
;REDACTED
)
RETURN

; Volume control when mouse is over task bar
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
MButton::Send {Media_Play_Pause}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
RETURN
