; Adds navigational keys, etc. to my colemak layout the way I like it.

SetCapsLockState, AlwaysOff

#If GetKeyState("CapsLock", "P")
n::Left
e::Down
u::Up
i::Right
l::PgUp
y::PgDn
space::Shift
c::Ctrl
b::Send, {U+60}
Space & b::~
a::Home
o::End
'::End
z::AppsKey
#If

*CapsLock::
KeyWait, CapsLock
IF A_ThisHotkey = *CapsLock
    Send, {Escape}
Return