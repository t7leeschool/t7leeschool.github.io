SetBatchLines -1  ; Ensures maximum effectiveness of this method.
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

; Acid Rain with regular timing
^j::
DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)
DllCall("QueryPerformanceCounter", "Int64*", t0)

Send {j down}
StepToFrame(t0, 2)
Send {j up}

StepToFrame(t0, 6)
Send {o down}
StepToFrame(t0, 8)
Send {o up}

StepToFrame(t0, 24) ; 24-26
Send {o down}
StepToFrame(t0, 26)
Send {o up}

StepToFrame(t0, 34) ; 34-35
Send {o down}
StepToFrame(t0, 36)
Send {o up}

StepToFrame(t0, 42)
Send {o down}
StepToFrame(t0, 44)
Send {o up}

DllCall("Winmm\timeEndPeriod", "UInt", TimePeriod)
return

; Acid Rain with the first 3 delayed
^k::
DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)
DllCall("QueryPerformanceCounter", "Int64*", t0)

Send {j down}
StepToFrame(t0, 2)
Send {j up}

StepToFrame(t0, 14)
Send {o down}
StepToFrame(t0, 16)
Send {o up}

StepToFrame(t0, 28) ; 28-30
Send {o down}
StepToFrame(t0, 30)
Send {o up}

StepToFrame(t0, 38) ; 38-39
Send {o down}
StepToFrame(t0, 40)
Send {o up}

DllCall("Winmm\timeEndPeriod", "UInt", TimePeriod)
return

