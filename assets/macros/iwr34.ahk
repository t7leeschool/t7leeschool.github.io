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

^r::Reload

^i::
t0 := StartTimer()
Send {d down}
; second f must be no more than 20 frames after first
c := StepToFrame(t0, 8)
Send {d up}
c := StepToFrame(t0, c + 12)
Send {d down}
; final F+3 must be no more than 11 frames after second f
c := StepToFrame(t0, c + 5)
Send {d up}
c := StepToFrame(t0, c + 5)
Send {d down}
c := StepToFrame(t0, c + 1)
Send {o down}
c := StepToFrame(t0, c + 5)
Send {d up}{o up}
EndTimer()
return
