;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 v.1.1.1                    ;;
;;         ~ How to use this script ~         ;;
;;  1. Open a new ticket, make sure cursor is ;;
;;       in the 'Problem Description' field   ;;
;;  2. Press Ctrl+Alt+p                       ;;
;;  3. Make sure it confirmed the Owner field ;;
;;       (It might miss this due to latency)  ;;
;;  4. Save the ticket, enjoy your day        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Variables
name = "lastname, firstname"

!^p::
    ; Problem Description and Summary
    Send, Password Reset{tab}
    Send, Password Reset{tab}
    ; Set Category to 'Support'
    loop, 7 {
        Send, {tab}
    }
    loop, 8 {
        Send {down}
    }
    Send, {enter}
    ; Set Second part of Category to 'Password Reset'
    Send, {tab}{down}{down}{enter}  
    ; Set Status to 'Closed'
    Send, {tab}{down}{down}{down}{enter}
    ; Set Owner
    Send, {tab}{tab}%name%
    ; Wait a second and a half for the server to find the name
    Sleep, 1500
    Send, {enter}
