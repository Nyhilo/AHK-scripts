; Version 1.3.3

; To run this script you will need to copy it to your machine and either,
; 1) Have the program AutoHotKey installed or,
; 2) can contact Jacob at jcloward@yc.edu to compile a stand-alone it for you. 
; Right now this is configured to Jacob's schedule, so you can either edit it 
; for your schedule or ask Jacob nicely to configure one with your schedule.

; To properly use this script, click on Monday and don't change where the cursor
; is, then press the hotkey (ctrl+alt+t by default). The script will fill out
; the times for two weeks. Make sure to give it enough time to go between pages.
; The script will then exit itself after running. Don't forget yo click save on
; your timesheet afterwards.

; NOTE: The program can cause some... sporadic effects if there is a typo in the
; source or if the server takes more than the alloted time to load the next
; page. If this happens, you can press the escape key to immediately cancel the
; script from running. At this point, go back to the timesheet page, click the
; button to reset the timesheet to blank, then click on Monday and try again. 

; Editing this script
; Please only edit this script if you think you know what you're doing. It can
; take at least 30 seconds to navigate your browser and will be taking over your
; keyboard during that time. Because of this, any mistakes will usually cause it
; to click on links you never clicked on before or google things that don't make
; any sense. If you have any doubts in your ability to configure this file, feel
; free to send an email to Jacob at jcloward@yc.edu and he would be happy to do
; it for you.

FullWeek() {
    ; Loop this because Monday/Wednesday, Tuesday/Thursday are the same
    loop, 2 {
        ; Monday/Wednesday
        loop, 10 {              ; Scroll from top of page to first field
            Send, {tab}
        }
        Send, 2:00              ; Monday/Wednesday Clock In
        Send, {tab}{down}{tab}  ; PM 
        Send, 7:00              ; Monday/Wednesday Clock Out
        Send, {tab}{down}       ; PM
        loop, 23 {              ; Scroll to Next Day button
            Send, {tab}
        }
        Send, {enter}           ; Go to the next day
        Sleep, 1750      ; Wait for the page to load   
        ; Tuesday/Thursday
        loop, 10 {              ; Scroll from top of page to first field
            Send, {tab}
        }
        Send, 5:30             ; Tuesday/Thursday Clock In
        Send, {tab}{down}{tab}  ; PM
        Send, 9:00              ; Tuesday/Thursday Clock Out
        Send, {tab}{down}       ; PM
        loop, 23 {              ; Scroll to Next Day button
            Send, {tab}
        }
        Send, {enter}           ; Go to the next day
        Sleep, 1750      ; Wait for the page to load
    }
    ; Friday
    loop, 10 {              ; Scroll from top of page to first field
        Send, {tab}
    }
    Send, 12:00             ; Friday Clock In
    Send, {tab}{down}{tab}  ; PM
    Send, 3:00              ; Clock out for Lunch
    Send, {tab}{down}{tab}  ; PM
    Send, {tab}4:00         ; Clock in after Lunch
    Send, {tab}{down}{tab}  ; PM 
    Send, 9:00              ; Friday Clock Out
    Send, {tab}{down}  
    loop, 18 {              ; Scroll to Next Day button
        Send, {tab}
    }
    Send, {enter}           ; Go to the next day
    Sleep, 1750      ; Wait for the page to load
}


!^t::
    ; Variables
    SetKeyDelay, 20
    Sleep, 500              ; Avoids sending the hotkey twice
    FullWeek()              ; Set the schedule for the current week
    loop, 2 {               ; Skip Saturday and Sunday
        loop, 36 {          ; Scroll through whole page to Next Day button
            Send, {tab}
        }
        Send, {enter}       ; Go to the next page
        Sleep, 1750  ; Wait for page to load
    }
    FullWeek()              ; Set the schedule for the next week
    ExitApp                 ; Close the program      
    return

Esc::ExitApp                ; Emergency stop in case things go wrong