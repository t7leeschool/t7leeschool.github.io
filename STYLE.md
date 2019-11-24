# Style guide

This guide helps us write articles with consistent language, notation, and
formatting, giving our readers a much better experience.

## Language

Text should be as short as possible, and no shorter. Be precise. Avoid complex
words when simpler ones will do. Authoritative language is preferred,
but must be backed up by accuracy. Be as comprehensive as possible.

Use plain English. Tekken jargon is fine if there are no suitable plain English
words, or if avoiding jargon would be too verbose.

## Notation

Unless stated otherwise, use the [Tekken Zaibatsu
legend](http://www.tekkenzaibatsu.com/legend.php).

Use precise inputs and notation whenever possible, e.g. write "f,F" instead of
"dash" or "microdash", and write "&lt;f+2,1" instead of "delay f+2,1".

Exceptions are for ws moves after a mist step, e.g. b+2,f\~N ws2,4 is preferred over b+2,f\~N b,N,2,4. 

Don't write "f,F" when the dash is obvious, e.g. after S!.

### Spaces and commas

Spaces should only separate strings of inputs.

Exceptions are when a stance comes before an input, e.g. HMS 4, and for
indicating counter-hits, e.g. CH 4. The following are considered stances for
this purpose: FC, HMS, MS, Sway, BT, FUFT, FUFA, FDFT, FDFA.

Commas should only separate inputs within a string.

✔️ CH HMS 4 ws2,3 b+2,f\~N ws2,4 S! f+2,1\
❌ CH HMS 4, WS 2,3, b+2,f\~N, WS 2,4, S! f+2,1

### Mist step

Mist step's input is f\~N. All transitions are notated similarly, e.g.
b+2,f\~N for b+2 into mist step.

In combos with b2 loops, write e.g. b+2,f\~N(x2) instead of b+2,f\~N b+2,f\~N.

### Held directional inputs

For Lee, the relevant moves are:

- b,B+4(,3)
- f,F+3
- f,F+4
- f,f,F+3,4(,3)
- d,D/B+4
- FC d/f,d,D/F+4

This notation is important for precision. For moves like these, the directional input has to be held for at least 1 frame before the paired attack input. This is unlike a regular paired input such as b+4 where they both can be pressed on the same frame.

### Grounded states

| ✔️ | ❌ | State |
| -- | -- | -- |
| FUFT | KND | Face up, Feet towards |
| FUFA | PLD | Face up, Feet away |
| FDFT | FCD | Face down, Feet towards |
| FDFA | SLD | Face down, Feet away |

## Formatting

See [kramdown quick reference](https://kramdown.gettalong.org/quickref.html).

Don't use level 1 headings. Start articles at level 2 headings:

~~~ html
## First heading in the article
~~~

Use whatever formatting you think is appropriate for the text you're writing.
Look at how other pages are formatted to get an idea of what's possible.

Be careful with tables that have a lot of columns. If they're too long or wrap
poorly, they won't look good on small displays. In these cases, consider
rewriting or restructuring the text.

If a section is very long, consider putting it in a drop down box:

~~~ html
<details>
<summary markdown="0">Section heading</summary>
...
</details>
~~~

If you know how to make it work, the full power of HTML/CSS/JS is at your
disposal. Embedded media, interactive elements, and complex layouts are all
possible.
