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

backdash(t0, c0 := 0, d := 10, i := 1) {
   StepToFrame(t0, c0)
   Send {a down}
   StepToFrame(t0, c0 + 1)
   Send {a up}
   StepToFrame(t0, c0 + 2)
   Send {a down}
   StepToFrame(t0, c0 + 3 + d)
   if (i == 5) {
      Send {s down}
   }
   else {
      Send {s down}{a up}
   }
   StepToFrame(t0, c0 + 4 + d)
   if (i == 5) {
      Send {a up}{s up}
   }
   else {
      Send {s up}
   }
   return c0 + 4 + d
}

^r::Reload

^b::
InputBox n, "Enter backdash length"
if n is not integer
   n := 0
t0 := StartTimer()
c := StepToFrame(t0, 15)
Send {s up}{a up}{e down}{o down}
c := StepToFrame(t0, c + 2)
Send {e up}{o up}
c := StepToFrame(t0, c + 18)
Loop 5 {
   c := backdash(t0, c, n, A_Index)
}
; Send {s down}
EndTimer()
return
