-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-08-18T00:28:20+02:00
title: Efficient Vim knowledge
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("uber_leet_use_vim.jpg","Über leet use vim!") %>

begindiv(intro)

<%= tldr %> Want to learn vim (the best text editor known to human kind) the fastest way possible. I suggest you a way.


enddiv

[Vim] the Six Billion Dollar editor

> Better, Stronger, Faster.

Learn [vim] and it will be your last text editor.
There isn't any better text editor I know.
Hard to learn, but it will pay a billion times.

I suggest you to learn it in 4 steps:

1. Survive
2. Feel comfortable
3. Feel Better, Stronger, Faster
4. Power Overwhelming

By the end of this journey, you'll become a vim superstar. 

[Vim]: http://www.vim.org
[vim]: http://www.vim.org

## 1st Level: Survive

0. Install [vim]
1. Launch vim
2. DO NOTHING! Read.

In a standard editor, typing on the keyboard is enough to write something and see it on the screen.
Not this time.
Vim is in _edition_ mode.
Lets get in _insertion_ mode.
Type on the letter `i`.

Now you should feel a bit better.
You can type letters like in a standard notepad.
To get back in _edition_ mode just tap the `ESC` key.

Now you know how to switch between insertion and edition mode. And now, the list of command you can use in edition mode to survive:

> - `i`: Insertion mode. Type `ESC` to return to edition mode.
> - `x`: Delete the char under the cursor
> - `:wq`: Save and Quit (`:w` save, `:q` quit)
> - `dd`: Delete (and copy) current line
> - `p`: Paste current line
> - `hjkl` (recommended but not mandatory): basic cursor move (<-&darr;&uarr;->). Hint `j` look like a down arrow.
> - `:help <command>`: Show help about <command>, you can start using `:help` without anything else.

Only 5 commands. This is very few to start.
Once these command start to become natural (may be after a complete day), you should try to confront to level 2.

## 2nd Level - Feel comfortable

You know the survivor commands. 
Now, just a bit more commands to use.
I suggest:

1. Insertion mode variations:

    > - `a`     -> insert _after_ the cursor
    > - `o`     -> insert a new line after the current one
    > - `O`     -> insert a new line before the current one
    > - `cw`    -> replace the word under the cursor

2. Basic moves

    > - `0`         -> go to first column
    > - `^`         -> go to first character of the line
    > - `$`         -> go to the end of line
    > - `/pattern`  -> search for `pattern` 

3. Copy/Paste

    > - `P`  -> copy before, remember `p` is copy after current position.
    > - `yy` -> copy current line, easier but equivalent to `ddP`

4. Undo/Redo

> - `u` -> undo
> - `C-r` -> redo

## Level 3 - Better. Stronger. Faster.

Congratulation! If you managed to go until here, we can start the interresting stuff.
At level 3, we'll only talk about command which are compatible in the old `vi`.

Lets start by the first `vi` super-power. Limit to repeat yourself (basic):

1. `.` -> (dot) will repeat the last command,
2. N&lt;command&gt; -> will do the command N times.

Some examples, open a file and type:

> - `2dd` -> will delete 2 lines
> - `3p` -> will paste the text 3 times
> - `100idesu [ESC]` -> will write "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
> - `.` -> Just after the last command  will write again the 100 "desu ". 
> - `3.` -> Will write 3 "desu" (and not 300, how clever).

Second vi super power, moving (basic):
Knowing how to move efficiently with vim is _very_ important. Do not jump this section.

1. N`G` -> Go to line N
2. `gg` -> shortcut for `1G`, go to the start of the file
3. `G`  -> Go to last line
4. Word moves:

    > 1. `w` -> go to the start of the following word,
    > 2. `e` -> go to the end of this word.
    >
    > By default, word are composed of letter and the underscore character.
    > If you want to use word in the meaning of group of letter separated by spaces, just use uppercases:
    >
    > 1. `W` -> go to the start of the following "extended" word,
    > 2. `E` -> go to the end of this "extended" word.

Now lets talk about very efficient moves:

> - `%` : Go to corresponding `(`, `{`, `[`.
> - `*` (resp. `#`) : go to next (resp. previous) occurrence of the word under the cursor

Believe me, these last three command are gold.

## Level 4 - Power Overwhelming

With all preceding commands you should be comfortable to use vim.
But now, here are the killer features.
Some of these features were the reason I started to use vim.

Move on current line, any of: `0^$fFtT,;`

> - `0` -> go to column 0
> - `^` -> go to first character on the line
> - `$` -> go to the last character on the line
> - `fa` -> go to next occurrence of the letter `a` on the line. `,` will seek next occurrence.
> - `t,` -> go just after the character `,`.
> - `3fa` -> search the 3rd occurrence of `a` on this line.
> - `F` and `T` -> like `f` and `t` but backward.

Select rectangular blocs: `C-V`. 
s
Rectangular blocks are very useful to comment many lines of code.
Typically: `0C-VC-dI// [ESC]`

- `^` -> go to start of the line
- `C-V` -> Start block selection
- `C-d` -> move down (could also be `jjj` or `%`, etc...)
- `I// [ESC]` -> write `// ` to comment each line


<%= blogimage("rectangular-blocks.gif","Rectangular blocks") %>

Completion: `C-n` and `C-p`.

In insertion mode, just type the start of a word, then type `C-p`, magic...

Macros : `qa` do something `qq`, then `@a` (also `@@`, repeat the last `@x`).

`qa` record your actions in the _register_ `a`. Then `@a` will replay the macro saved into the register `a` as if you typed it.

> Example:
> On a line containing only a number type this:
> `qaYpC-aqq` -> `qa` start recording. `Yp` duplicate this line. `C-a` increment the number. `qq` stop recording.
> 
> Now a `10@a` will create a list of increasing numbers.

But also,

Visual selection

We saw an example with `C-V`. 
There is also `v` and `V`.
Once the selection made, you can:

- `=` -> auto indent
- `<` (resp. `>`) -> indent to the left (resp. to the right).
- `J` -> join all lines together.

Add something at the end of all visually selected lignes:

- `S-V` 
- go to desired line (`jjj` or `C-d` or `/pattern` or `%` etc...)
- `$` go to the end of line
- `A`, write texte, `ESC`.

Splits : `:split` and `vsplit`. You should look at `:help split`

## Conclusion

Voilà, je vous ai donné 90% des commandes que j'utilise tous les jours.
N'essayez pas de tout apprendre en une journée. 
Il faut le temps de s'habituer à chaque nouvelle commande. 
Ajouter une ou deux commande par jour tous les jours est un bon exercice.
Dans 1 mois vous en connaitrez au moins autant que moi.
And keep in mind I am not a vim master, just a regular user.

