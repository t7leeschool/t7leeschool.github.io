SetBatchLines -1  ; Ensures maximum effectiveness of this method.
SendMode Input
TimePeriod := 3
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)

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
}

B2(t0, offset) {
   StepToFrame(t0, offset)
   Send {a down}{i down}
   StepToFrame(t0, offset + 4)
   Send {a up}{i up}
   StepToFrame(t0, offset + 6)
   Send {d down}
   StepToFrame(t0, offset + 10)
   Send {d up}
}

; d/f+2 b+2,f~N(x5) b+1:1,f~N
^i::
DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)
DllCall("QueryPerformanceCounter", "Int64*", t0)

Send {d down}{s down}{i down}
StepToFrame(t0, 4)
Send {d up}{s up}{i up}

B2(t0, 42)
B2(t0, 42 + 34)
B2(t0, 42 + 34 * 2)
B2(t0, 42 + 34 * 3)
B2(t0, 42 + 34 * 4)

buffer := 0 ; can be 0--8
c1 := 42 + 34 * 5
StepToFrame(t0, c1 - buffer)
Send {a down}{j down}
StepToFrame(t0, c1 + 20)
Send {a up}{j up}

DllCall("Winmm\timeEndPeriod", "UInt", TimePeriod)
return

