# Style guide

This guide helps us write articles with consistent language, notation, and
formatting, giving our readers a much better experience.

## Language

Text should be as short as possible, and no shorter. Be precise. Avoid complex
words when simpler ones will do. Formal, authoritative language is preffered,
but must be backed up by accuracy. Be as comprehensive as possible.

## Notation

Unless stated otherwise, use the [Tekken Zaibatsu
legend](http://www.tekkenzaibatsu.com/legend.php).

Use precise inputs and notation whenever possible, e.g. write "f,F" instead of
"dash" or "microdash", and write "&lt;f+2,1" instead of "delay f+2,1".

Exception is for b+2,f\~N ws2,4 which is preferred over b+2,f\~N b,N,2,4.

Don't write "f,F" when the dash is obvious, e.g. after S!.

### Spaces and commas

Spaces should only separate strings of inputs.

Exceptions are when a stance comes before an input, e.g. HMS 4, and for
indicating counter-hits, e.g. CH 4. The following are considered stances for
this purpose: FC, HMS, MS, Sway, BT, FUFT, FUFA, FDFT, FDFA.

Commas should only separate inputs within a string.

| Good | CH HMS 4 ws2,3 b+2,f\~N ws2,4 S! f+2,1
| Bad  | CH HMS 4, WS 2,3, b+2,f\~N, WS 2,4, S! f+2,1

### Mist step

Mist step's input is f\~N. All transitions are notated similarly, e.g.
b+2,f\~N for b+2 into mist step.

In combos with b2 loops, write e.g. b+2,f\~N(x2) instead of b+2,f\~N b+2,f\~N.

### Grounded states

| FUFT | Face up, Feet towards
| FUFA | Face up, Feet away
| FDFT | Face down, Feet towards
| FDFA | Face down, Feet away

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
