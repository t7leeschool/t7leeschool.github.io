SetBatchLines -1  ; Ensures maximum effectiveness of this method.
SendMode Input
TimePeriod := 3
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)

StartTimer() {
   DllCall("Winmm\timeBeginPeriod", "UInt", global TimePeriod)
   DllCall("QueryPerformanceCounter", "Int64*", t0)
   return t0
}

EndTimer() {
   DllCall("Winmm\timeEndPeriod", "UInt", global TimePeriod)
}

StepTo(t0, delta) {
   global Frequency
   DllCall("QueryPerformanceCounter", "Int64*", t1)
   while ((t1 - t0) * 1000 / Frequency) < delta {
      DllCall("Sleep", "UInt", 1)
      DllCall("QueryPerformanceCounter", "Int64*", t1)
   }
}

StepToFrame(t0, frame) {
   StepTo(t0, frame * 1000 / 60)
   return frame
}

backdash(t0, c0 := 0, d := 10) {
   StepToFrame(t0, c0)
   Send {a down}
   StepToFrame(t0, c0 + 1)
   Send {a up}
   StepToFrame(t0, c0 + 2)
   Send {a down}
   StepToFrame(t0, c0 + 3)
   Send {a up}
   StepToFrame(t0, c0 + 3 + d)
   Send {s down}{a down}
   StepToFrame(t0, c0 + 4 + d)
   Send {s up}{a up}
   return c0 + 4 + d
}

^r::Reload

^i::
t0 := StartTimer()
Send {s up}{a up}{e down}{o down}
StepToFrame(t0, 2)
Send {e up}{o up}
c := StepToFrame(t0, 30)
Loop 5 {
   ; c := backdash(t0, c - 5, 0) ; no backdashes, just sync breathe cycle
   c := backdash(t0, c, 18) ; last number is length of backdashes
}
Send {s down}{a down}
c := StepToFrame( t0, c + (59 - Mod(c + 5, 60)) )
Send {s up}{a up}
StepToFrame(t0, c + 1)
Send {s down}{a down}
EndTimer()
return
