-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-08-25T19:28:20+02:00
title: Learn Vim Progressively
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - vi
  - vim
  - editor
  - tutorial
-----
<%= blogimage("uber_leet_use_vim.jpg","Über leet use vim!") %>

begindiv(intro)

<%= tldr %> Want to learn vim (the best text editor known to human kind) the fastest way possible. I suggest you a way. Start by learning the minimal to survive, then integrate slowly all tricks.


enddiv

[Vim] the Six Billion Dollar editor

> Better, Stronger, Faster.

Learn [vim] and it will be your last text editor.
There isn't any better text editor I know.
Hard to learn, but incredible to use.

I suggest you to learn it in 4 steps:

1. Survive
2. Feel comfortable
3. Feel Better, Stronger, Faster
4. Use vim superpowers

By the end of this journey, you'll become a vim superstar. 

But before we start, just a warning.
Learning vim will be painful at first.
It will take time.
It will be a lot like playing a music instrument.
Don't expect to be more efficient with vim than with another editor in less than 3 days.
In fact it will certainly take 2 weeks instead of 3 days.

[Vim]: http://www.vim.org
[vim]: http://www.vim.org



## 1st Level -- Survive

0. Install [vim]
1. Launch vim
2. DO NOTHING! Read.

In a standard editor, typing on the keyboard is enough to write something and see it on the screen.
Not this time.
Vim is in _Normal_ mode.
Let's get in _Insert_ mode.
Type on the letter `i`.

You should feel a bit better.
You can type letters like in a standard notepad.
To get back in _Normal_ mode just tap the `ESC` key.

You know how to switch between _Insert_ and _Normal_ mode.
And now, the list of command you can use in _Normal_ mode to survive:

> - `i` → _Insert_ mode. Type `ESC` to return to Normal mode.
> - `x` → Delete the char under the cursor
> - `:wq` → Save and Quit (`:w` save, `:q` quit)
> - `dd` → Delete (and copy) current line
> - `p` → Paste
> 
> Recommended:
> 
> - `hjkl` (highly recommended but not mandatory) →  basic cursor move (<-&darr;&uarr;→). Hint: `j` look like a down arrow.
> - `:help <command>` → Show help about `<command>`, you can start using `:help` without anything else.

Only 5 commands. This is very few to start.
Once these command start to become natural (may be after a complete day), you should go on level 2.

But before, just a little remark on _Normal mode_.
In standard editors, to copy you have to use the `Ctrl` key (`Ctrl-c` generally).
In fact, when you press `Ctrl`, it is a bit like if all your key change meaning.
With vim in Normal mode, it is a bit like if your `Ctrl` key is always pushed down.

A last word about notations: 

- instead of writing `Ctrl-λ`, I'll write `<C-λ>`.
- command staring by `:` will must end by `<enter>`. For example, when I write `:q` it means `:q<enter>`.

## 2nd Level -- Feel comfortable

You know the commands required for survival. 
It's time to learn a few more commands.
I suggest:

1. Insert mode variations:

    > - `a`     → insert after the cursor
    > - `o`     → insert a new line after the current one
    > - `O`     → insert a new line before the current one
    > - `cw`    → replace from the cursor to the end the word

2. Basic moves

    > - `0`         → go to first column
    > - `^`         → go to first non-blank character of the line
    > - `$`         → go to the end of line
    > - `g_`         → go to the last non-blank character of line
    > - `/pattern`  → search for `pattern` 

3. Copy/Paste

    > - `P`  → paste before, remember `p` is paste after current position.
    > - `yy` → copy current line, easier but equivalent to `ddP`

4. Undo/Redo

    > - `u` → undo
    > - `<C-r>` → redo

5. Load/Save/Quit/Change File (Buffer)

    > - `:e <path/to/file>` →  open
    > - `:w` → save
    > - `:saveas <path/to/file>` → save to `<path/to/file>`
    > - `:x`, `ZZ` or `:wq` → save and quit (`:x` only save if necessary)
    > - `:q!` → quit without saving, also `:qa!` to even if there are  some modified hidden buffers.
    > - `:bn` (resp. `:bp`) → show next (resp. previous) file (buffer)

Take the time to integrate all of these command.
Once done, you should be able to do every thing you are able to do on other editors.
But until now, it is a bit awkward. But follow me to the next level and you'll see why.

## 3rd Level -- Better. Stronger. Faster.

Congratulation reaching this far!
We can start the interesting stuff.
At level 3, we'll only talk about command which are compatible with the old vi.

### Better

Let's look at how vim could help you to repeat yourself: 

1. `.` → (dot) will repeat the last command,
2. N&lt;command&gt; → will do the command N times.

Some examples, open a file and type:

> - `2dd` → will delete 2 lines
> - `3p` → will paste the text 3 times
> - `100idesu [ESC]` → will write "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
> - `.` → Just after the last command  will write again the 100 "desu ". 
> - `3.` → Will write 3 "desu" (and not 300, how clever).

### Stronger

Knowing how to move efficiently with vim is _very_ important. 
Don't skip this section.

1. N`G` → Go to line N
2. `gg` → shortcut for `1G`, go to the start of the file
3. `G`  → Go to last line
4. Word moves:

    > 1. `w` → go to the start of the following word,
    > 2. `e` → go to the end of this word.
    >
    > By default, word are composed of letter and the underscore character.
    > Let's call a WORD a group of letter separated by blank characters. 
    > If you want to consider WORDS, then just use uppercases:
    >
    > 1. `W` → go to the start of the following WORD,
    > 2. `E` → go to the end of this WORD.
    >
    > <%= blogimage("word_moves.jpg","Word moves example") %>

Now let's talk about very efficient moves:

> - `%` : Go to corresponding `(`, `{`, `[`.
> - `*` (resp. `#`) : go to next (resp. previous) occurrence of the word under the cursor

Believe me, the last three commands are gold.

### Faster

Remember about the importance of vi moves?
Here is the reason.
Most commands can be used using the following general format:

`<start position><command><end position>`

For example : `0y$` means

- `0` → go to the beginning of this line
- `y` → yank from here
- `$` → up to the end of this line

We also can do things like `ye`, yank from here to the end of the word.
But also `y2/foo` yank up to the second occurrence of "foo".

But what was true for `y` (yank), 
is also true for `d` (delete), `v` (visual select), `gU` (uppercase), `gu` (lowercase), etc...

## 4th Level -- Vim Superpowers

With all preceding commands you should be comfortable to use vim.
But now, here are the killer features.
Some of these features were the reason I started to use vim.

### Move on current line: `0` `^` `$` `f` `F` `t` `T` `,` `;`

> - `0` → go to column 0
> - `^` → go to first character on the line
> - `$` → go to the last character on the line
> - `fa` → go to next occurrence of the letter `a` on the line. `,` (resp. `;`) will seek for the next (resp. previous) occurrence.
> - `t,` → go just before the character `,`.
> - `3fa` → search the 3rd occurrence of `a` on this line.
> - `F` and `T` → like `f` and `t` but backward.
> <%= blogimage("line_moves.jpg","Line moves") %>

A useful tip is: `dt"` → remove everything until the `"`.

### Zone selection `<action>a<object>` or `<action>i<object>`

These command can only be used after an operator of in visual mode.
But they are very powerful. Their main pattern is:

`<action>a<object>` and `<action>i<object>`

Where action can be any action, for example, `d` (delete), `y` (yank), `v` (select in visual mode).
And object can be: `w` a word, `W` a WORD (extended word), `s` a sentence, `p` a paragraph. But also, natural character such as `"`, `'`, `)`, `}`, `]`.

Suppose the cursor is on the first `o` of `(map (+) ("foo"))`.

> - `vi"` → will select `foo`.
> - `va"` → will select `"foo"`.
> - `vi)` → will select `"foo"`.
> - `va)` → will select `("foo")`.
> - `v2i)` → will select `map (+) ("foo")`
> - `v2a)` → will select `(map (+) ("foo"))`

<%= blogimage("textobjects.png","Text objects selection") %>

### Select rectangular blocks: `<C-v>`. 

Rectangular blocks are very useful to comment many lines of code.
Typically: `0<C-v><C-d>I-- [ESC]`

- `^` → go to start of the line
- `<C-v>` → Start block selection
- `<C-d>` → move down (could also be `jjj` or `%`, etc...)
- `I-- [ESC]` → write `-- ` to comment each line


<%= blogimage("rectangular-blocks.gif","Rectangular blocks") %>

Not on windows you might have to use `<C-q>` instead of `<C-v>` if your clipboard is not empty.

### Completion: `<C-n>` and `<C-p>`.

In Insert mode, just type the start of a word, then type `<C-p>`, magic...
<%= blogimage("completion.gif","Completion") %> 

### Macros : `qa` do something `q`, `@a`, `@@`

`qa` record your actions in the _register_ `a`. 
Then `@a` will replay the macro saved into the register `a` as if you typed it.
`@@` is a shortcut to replay the last executed macro.

> *Example*
>
> On a line containing only the number 1, type this:
>
> - `qaYp<C-a>q` → 
>   
>   - `qa` start recording. 
>   - `Yp` duplicate this line.
>   - `<C-a>` increment the number.
>   - `q` stop recording.
> 
> - `@a` → write 2 under the 1
> - `@@` → write 3 under the 2
> - Now do `100@@` will create a list of increasing numbers until 103.

<%= blogimage("macros.gif","Macros") %>

### Visual selection: `v`,`V`,`<C-v>`

We saw an example with `<C-v>`. 
There is also `v` and `V`.
Once the selection made, you can:

- `J` → join all lines together.
- `<` (resp. `>`) → indent to the left (resp. to the right).
- `=` → auto indent

<%= blogimage("autoindent.gif","Autoindent") %>

Add something at the end of all visually selected lines:

- `<C-v>` 
- go to desired line (`jjj` or `<C-d>` or `/pattern` or `%` etc...)
- `$` go to the end of line
- `A`, write text, `ESC`.

<%= blogimage("append-to-many-lines.gif","Append to many lines") %>

### Splits: `:split` and `vsplit`.

Here are the main commands, but you should look at `:help split`.

> - `:split` → create a split (`:vsplit` create a vertical split)
> - `<C-w><dir>` : where dir is any of `hjkl` or <-&darr;&uarr;→ to change split.
> - `<C-w>_` (resp. `<C-w>|`) : maximise size of split (resp. vertical split)
> - `<C-w>+` (resp. `<C-w>-`) : Grow (resp. shrink) split

<%= blogimage("split.gif","Split") %>

## Conclusion

That was 90% of commands I use every day.
I suggest you to learn no more than one or two new command per day.
After two to three weeks you'll start to feel the power of vim in your hands.

Learning Vim is more a matter of training than plain memorization.
Fortunately vim comes with some very good tools and an excellent documentation.
Run vimtutor until you are familiar with most basic commands.
Also, you should read carefully this page: `:help usr_02.txt`.

Then, you will learn about `!`, folds, registers, the plugins and many other features.
Learn vim like you'd learn piano and all should be fine.




<script>
// Style the keywords
$(document).ready(function() {
    $('code').css({ 'border': 'solid 1px #CCC', 'padding':'3px'});
});
</script>
