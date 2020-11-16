SendMode Input

; KeyHistory

; Convert text to upper
^!u::
    Send ^x
    StringUpper Clipboard, Clipboard
    Send %Clipboard%
RETURN

; Convert text to lower
^!l::
    Send ^x
    StringLower Clipboard, Clipboard
    Send %Clipboard%
RETURN

; Convert text to title case
^!k::
    Send ^x
    StringUpper Clipboard, Clipboard, T
    Send %Clipboard%
RETURN

; Shrug emote
:*:@shrug::
    send, ¯\_(ツ)_/¯
RETURN

; Keyboard shortcut to set a window to be always on top
^!t::  ;Ctrl+Alt+Space - it will append " - AlwaysOnTop" to windows when they are AlwaysOnTop
    WinGetActiveTitle, t
    WinGet, ExStyle, ExStyle, %t%
    if (ExStyle & 0x8)
    {
        WinSet, AlwaysOnTop, Off, %t%
        TrayTip, Window Unpinned, %t% , 3
        WinSetTitle, %t%,, % RegexReplace(t, " - AlwaysOnTop")
    }
    else
    {
        WinSet, AlwaysOnTop, On, %t%
        TrayTip, Window Pinned, %t% , 3
        WinSetTitle, %t%,, %t% - AlwaysOnTop
    }
RETURN

; Volume control when mouse is over task bar
MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

#If MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
    MButton::Send {Media_Play_Pause}
#if
RETURN


#MaxThreadsPerHotkey 2

; Triggers Autoclicker
F13::
    Toggle := !Toggle
    While Toggle{
       click
       sleep 30
    }
RETURN