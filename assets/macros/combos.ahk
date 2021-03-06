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

b2fN(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {a down}{i down}
   StepToFrame(t0, c0 + 4)
   Send {a up}{i up}
   StepToFrame(t0, c0 + 6)
   Send {d down}
   StepToFrame(t0, c0 + 10)
   Send {d up}
   return c0 + 34
}

b11fN(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {a down}{j down}
   StepToFrame(t0, c0 + 2)
   Send {a up}{j up}
   StepToFrame(t0, c0 + 12)
   Send {a down}{j down}
   StepToFrame(t0, c0 + 14)
   Send {a up}{j up}
   StepToFrame(t0, c0 + 16)
   Send {d down}
   StepToFrame(t0, c0 + 20)
   Send {d up}
   return c0 + 39
}

bN23(t0, c0 := 0) {
   StepToFrame(t0, c0 - 3)
   Send {a down}
   StepToFrame(t0, c0)
   Send {a up}
   StepToFrame(t0, c0 + 3)
   Send {i down}
   StepToFrame(t0, c0 + 7)
   Send {i up}{o down}
   StepToFrame(t0, c0 + 9)
   Send {o up}
   return c0 + 73
}

bN24(t0, c0 := 0) {
   StepToFrame(t0, c0 - 3)
   Send {a down}
   StepToFrame(t0, c0)
   Send {a up}
   StepToFrame(t0, c0 + 3)
   Send {i down}
   StepToFrame(t0, c0 + 7)
   Send {i up}{p down}
   StepToFrame(t0, c0 + 9)
   Send {p up}
   return c0 + 71
}

fF(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {d down}
   StepToFrame(t0, c0 + 3)
   Send {d up}
   StepToFrame(t0, c0 + 6)
   Send {d down}
   return c0 + 6
}

bN24fF(t0, c0 := 0) {
   c := bN24(t0, c0)
   c := fF(t0, c - 6)
   return c
}

b11fNws24fF(t0, c0 := 0) {
   c := b11fN(t0, c0)
   c := bN24fF(t0, c)
   return c
}

b2fNws24fF(t0, c0 := 0) {
   c := b2fN(t0, c0)
   c := bN24fF(t0, c - 1)
   return c
}

f41(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {d down}{p down}
   StepToFrame(t0, c0 + 2)
   Send {d up}{p up}
   StepToFrame(t0, c0 + 8)
   Send {j down}
   StepToFrame(t0, c0 + 10)
   Send {j up}
   return c0 + 64
}

f41fF(t0, c0 := 0) {
   c0 := f41(t0, c0)
   return fF(t0, c0)
}

N(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {a up}{s up}{d up}{w up}
   StepToFrame(t0, c0 + 1)
   return c0 + 1
}

ssl(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {w down}
   StepToFrame(t0, c0 + 2)
   Send {w up}
   return c0 + 2
}

ki(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {j down}{i down}{o down}{p down}
   StepToFrame(t0, c0 + 2)
   Send {j up}{i up}{o up}{p up}
   return c0 + 60
}

df2(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {d down}{s down}{i down}
   StepToFrame(t0, c0 + 4)
   Send {d up}{s up}{i up}
   return c0 + 41
}

uf4(t0, c0 := 0) {
   return c0 + 46
}

bk(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {s down}
   StepToFrame(t0, c0 + 1)
   Send {a down}
   StepToFrame(t0, c0 + 2)
   Send {p down}
   StepToFrame(t0, c0 + 5)
   Send {s up}{a up}{p up}
   return c0 + 64
}

b4(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {a down}{p down}
   StepToFrame(t0, c0 + 2)
   Send {a up}{p up}
   return c0 + 42
}

4u3(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {p down}
   StepToFrame(t0, c0 + 10)
   Send {p up}{w down}{o down}
   StepToFrame(t0, c0 + 12)
   Send {w up}{o up}
   return c0 + 65
}

4u3fN(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {p down}
   StepToFrame(t0, c0 + 10)
   Send {p up}{w down}{o down}
   StepToFrame(t0, c0 + 12)
   Send {w up}{o up}
   StepToFrame(t0, c0 + 50)
   Send {d down}
   StepToFrame(t0, c0 + 54)
   Send {d up}
   return c0 + 73
}

f21(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {d down}{i down}
   StepToFrame(t0, c0 + 10)
   Send {j down}
   StepToFrame(t0, c0 + 12)
   Send {d up}{i up}{j up}
   return c0 ; fixme
}

iws23(t0, c0 := 0, d := 0) {
   StepToFrame(t0, c0)
   Send {s down}
   StepToFrame(t0, c0 + d + 6)
   Send {s up}{i down}
   StepToFrame(t0, c0 + d + 11)
   Send {i up}{o down}
   StepToFrame(t0, c0 + d + 13)
   Send {o up}
   return c0 + d ; fixme
}

iwsuf4(t0, c0 := 0) {
   StepToFrame(t0, c0)
   Send {s down}
   StepToFrame(t0, c0 + 11)
   Send {s up}{w down}{d down}
   StepToFrame(t0, c0 + 12)
   Send {p down}
   StepToFrame(t0, c0 + 30)
   Send {w up}{d up}{p up}
   return c0 + 66
}

^r::Reload

^p::
t0 := StartTimer()
c := 0
c := bk(t0)
c := iwsuf4(t0, c + 1)
Send {s down}
c := StepToFrame(t0, c)
Send {s up}{p down}
c := StepToFrame(t0, c + 1)
Send {p up}
EndTimer()
return

^i::
t0 := StartTimer()
c := df2(t0)
c := ssl(t0, c) + 5
c := 4u3(t0, c)
c := b2fN(t0, c)
c := b2fN(t0, c)
c := b2fN(t0, c)
c := b11fNws24fF(t0, c)
c := f21(t0, c + 31)
EndTimer()
return

^o::
t0 := StartTimer()
c := ki(t0)
c := b4(t0, c)
c := fF(t0, c - 5)
c := StepToFrame(t0, c + 10)
Send {d up}
c := 4u3fN(t0, c + 1)
c := bN23(t0, c + 3)
c := fF(t0, c - 9)
c := StepToFrame(t0, c + 4)
Send {d up}
c := f41(t0, c + 3)

EndTimer()
return

^c::
t0 := StartTimer()
Send {s down}{a down}{i down}
c := StepToFrame(t0, 2)
Send {s up}{a up}{i up}
c := StepToFrame(t0, 31)
Send {d down}
c := StepToFrame(t0, c + 2)
Send {d up}
c := StepToFrame(t0, c + 2)
Send {d down}
c := StepToFrame(t0, c + 1)
Send {o down}
c := StepToFrame(t0, c + 5)
Send {d up}{o up}
EndTimer()
return

^v::
t0 := StartTimer()
Send {o down}{p down}
c := StepToFrame(t0, 2)
Send {o up}{p up}
c := StepToFrame(t0, c + 8)
Send {o down}
c := StepToFrame(t0, c + 2)
Send {o up}
c := StepToFrame(t0, c + 128)
Send {s down}{d down}{p down}
c := StepToFrame(t0, c + 2)
Send {s up}{d up}{p up}
EndTimer()
return

^b::
t0 := StartTimer()
c := uf4(t0)
c := 4u3(t0, c)
c := b2fN(t0, c)
c := b2fN(t0, c)
c := b2fNws24fF(t0, c)
c := f21(t0, c + 27)
EndTimer()
return

^n::
t0 := StartTimer()
c := uf4(t0)
c := 4u3(t0, c)
c := b2fN(t0, c)
c := b2fN(t0, c)
c := b2fNws24fF(t0, c)
c := iws23(t0, c + 28)
Send {d up}
EndTimer()
return

^m::
t0 := StartTimer()
c := uf4(t0)
c := 4u3(t0, c)
c := b2fN(t0, c) + 2
c := b2fN(t0, c) + 2
c := b2fN(t0, c) + 5
c := f41fF(t0, c)
c := iws23(t0, c + 19, 4)
Send {d up}
EndTimer()
return
