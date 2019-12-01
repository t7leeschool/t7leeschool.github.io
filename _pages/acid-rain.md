---
title: Acid Rain
---

There's a bug in Chrome that [audio loops aren't
seamless.](https://bugs.chromium.org/p/chromium/issues/detail?id=353072) Use
Firefox or Edge for practise.
{: .chrome .flash }

The timing for the best method is:

<audio controls loop src="/assets/sounds/acid-14-14-10-metronome.ogg">
  Your browser does not support the audio element.
</audio>

Acid Rain is one of Lee's best moves. It's an i10 punisher that does 47
damage. The catch is that it's not one, but *two* just frames. On top of that,
because it's a punisher, you need to just frame the block stun or your tempo
will be off.

Unlike b2 loops, the difference between Acid Rain and the alternatives (in
particular 1,2,4 and 4,3) is significant. Not only do the easy i11 and below
punishers do much less damage, they are all minus on hit, whereas Acid
Rain gives good oki. So learning Acid Rain is a higher priority than learning
b2 loops.

However, like b2 loops, this optimization is still nowhere near the highest
priority, so you should only start practising it once you feel confident you
want to play Lee.

## Details

The inputs and their windows are:

Input | Frame
:-: | :-: | :-: | :-:
1 | 0
3 | 1--14
3 | 24--26
3 | 34--35

The first 3 can be done pretty much whenever. The second 3 has a three frame
window, and the third 3 has a two frame window.

Notice that the first 3 can be input after the 1 jab's active frame. This
actually delays the first 3, which delays the input windows of the just frames
as well.

## Common methods

[As Imyourfather shows](https://www.youtube.com/watch?v=dd9gHRheRvQ), there
are two common methods: Adding a filler input ("wa-da-da-da-da"), and doing
only the required inputs ("boo-doop boop boop").

The first method uses a simple rhythm with a tempo of 8.5 frames, so notes are
on frames 0--8.5--17--25.5--34. For a lot of people this is easiest, since all
you have to do is drill that tempo in and then bang out the notes:

<audio controls loop src="/assets/sounds/acid-wa-da-da-da-da-metronome.ogg">
  Your browser does not support the audio element.
</audio>

The second method uses a more complex rhythm:

<audio controls loop src="/assets/sounds/acid-4-20-10-metronome.ogg">
  Your browser does not support the audio element.
</audio>

This is Imyourfather's "boo-doop boop boop".[^1] The notes are on frames
0--4--24--34.

You could also use 0--10--24--34. For some people this rhythm is easier, since
the first and last intervals are the same:

<audio controls loop src="/assets/sounds/acid-10-14-10-metronome.ogg">
  Your browser does not support the audio element.
</audio>

You could even make a *slight* alteration to that by doing 0--10--25--35. This
way, the second interval is exactly one half longer than the other intervals,
which should be a bit easier:

<audio controls loop src="/assets/sounds/acid-10-15-10-metronome.ogg">
  Your browser does not support the audio element.
</audio>

The point of this method is to do fewer inputs. It does also happen to change
the tempo, but a 10 frame tempo is no easier than a 8.5 frame one.

Of course, you *could* stick with a 8.5 frame tempo anyway:

<audio controls loop src="/assets/sounds/acid-wa-da-da-da-metronome.ogg">
  Your browser does not support the audio element.
</audio>

## The problem of block stun

Punishers rely on a mechanic called the input buffer. This allows you to do an
input slightly before your character is ready to attack, and have it behave
like you pressed it exactly at the right time. With this you can pretty easily
connect, say, a 10 frame punisher after a &minus;10 move, because even if you
input your punisher during the block stun, when you can't actually attack,
it'll still work. Without the input buffer, you'd need to time it
perfectly---too early and you get nothing, too late and they can block.

For Acid Rain, however, there's a problem. If you've drilled a rhythm for the
input, and then you start the rhythm in the input buffer, the just frame
windows will be off tempo:

<figure markdown="0"><img src="/assets/images/acid-regular-buffer.png" height="86"></figure>

The above recording was timed right (0--6--24--34), but because it started in
the input buffer it didn't work.

So to actually use Acid Rain as a punisher, which is its main purpose, not
only do you need to time the 3's perfectly, but you need to time the 1
perfectly after the block stun as well.

This is a big problem, because different moves have different block stuns, and
there's no way you can drill perfect timing for all of them. (That's why the
game has an input buffer.)

One potential solution is to visually confirm the input---that is, press the
second 3 when you see the first 3 connecting, then use a 10 frame tempo for
the third 3.

For this to work, however, you need a fixed input delay. If you only
ever play offline, and with the same setup, this might be a viable solution. But
even then it's probably not advisable, since visual confirms are a lot harder
to train to perfection than rhythms.

## The solution for block stun

Remember how the first 3 can be delayed? This is the key. If we use the rhythm
0--14--28--38, then it works both with an input buffer:

<figure markdown="0"><img src="/assets/images/acid-delay-buffer.png" height="86"></figure>

And without an input buffer:

<figure markdown="0"><img src="/assets/images/acid-delay.png" height="86"></figure>

Why does this work? If there *is* an input buffer, the JF window *doesn't* get
delayed, and your inputs are on frames &minus;4--10--24--34, which works.

If there *isn't* an input buffer, the JF window *does* get delayed, and your
inputs are on frames 0--14--28--38, which works.

This is, fortunately, not a difficult rhythm: (same audio as top of the page)

<audio controls loop src="/assets/sounds/acid-14-14-10-metronome.ogg">
  Your browser does not support the audio element.
</audio>

This method allows the input to be done up to 4 frames into the input buffer,
making it a lot easier to use as a punisher.

[^1]:
    Or at least it should be. But he's *wildly* off rhythm with his voice.
    The first "boop" is played too early, making the rhythm closer to
    0--4--21--34:

    <audio controls loop src="/assets/sounds/acid-boo-doop.ogg">
      Your browser does not support the audio element.
    </audio>

    That timing doesn't work, but his *voice* isn't the one making the inputs.
    If you listen to his button clicks, they're on a 0--5--25--35 rhythm,
    which is why it still works.

    (It's interesting that his muscle memory is so strong that it totally
    ignores the off-timed cue he's giving himself.)
