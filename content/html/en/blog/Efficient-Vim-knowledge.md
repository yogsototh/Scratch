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

    > - `a`: insert _after_ the cursor
    > - `o`: insert a new line after the current one
    > - `O`: insert a new line before the current one
    > - `cw`: replace the word under the cursor

2. Basic moves

    > - `0` : go to first column
    > - `^` : go to first character of the line
    > - `$` : go to the end of line
    > - `/pattern` : search for `pattern` 

3. Copy/Paste

    > - `P`: copy before, remember `p` is copy after current position.
    > - `yy`: copy current line, easier but equivalent to `ddP`

## Level 3 - Better. Stronger. Faster.

À partir de maintenant nous allons commencer à faire des choses difficile à faire dans les autres éditeurs. 
N'oubliez pas qu'à la fin de cet article vous n'aurez touché du doigt que la partie émerger du continent iceberg qu'est vim. 
Pour l'instant la seule commande qui vous donne un avant goût de ce qu'est la puissance de vim était `cw`. Qui permet de remplacer un mot.
Nous allons maintenant nous intéresser à des commandes qui vont vous donner plus de pouvoir et d'efficacité.
Pour cette section, je vais seulement parler de choses qui était aussi disponible dans `vi`. Vim peut faire beaucoup d'autres choses.

Commençons par le premier super pouvoir de `vi`, éviter les répétitions (niveau 1):

1. `.` : Le caractère point répètera la dernière commande.
2. N<commande> : répètera la commande N fois. 

Quelques examples, ouvrez un fichier avec vim et tapez:

> - `2dd` -> Supprimera 2 lignes
> - `3p` -> copiera 3 fois d'affiler le texte copié
> - `100idesu [ESC]` -> écrira "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
> - `.` -> Juste après la dernière commande  réécrira les 100 "desu ". 
> - `3.` -> Écrira 3 "desu".

Second super pouvoir de vim, les déplacements (niveau 1):
Savoir se déplacer efficacement avec vim est _très_ important, ne sautez pas cette section.

1. N`G` -> Aller à la ligne N
2. `gg` -> raccourci pour `1G`, retourner au début du fichier
3. `G`  -> Aller à la dernière ligne.
4. Déplacement autour des mots:

    > 1. `w` -> aller au début du mot suivant
    > 2. `e` -> aller à la fin du mot courant
    >
    > Par défaut les mots sont seulement composés de lettres (et du caractère souligné `_`).
    > Si vous voulez considérer les mots au sens "jusqu'au prochain espace", alors il suffit d'utiliser les majuscules.
    >
    > 1. `W` -> aller au début du mot "étendu" suivant
    > 2. `E` -> aller à la fin du mot "étendu" courant

Maintenant passons aux déplacement qui vont vous faire sentir vraiment meilleur :

> - `%` : Aller à la parenthèse, accolade, crochet correspondante.
> - `*` (resp. `#`) : Aller à la prochaine (resp. précédente) occurrence du mot sous le curseur

Croyez moi, ces trois dernières commandes valent de l'or.
Retenez les, et vous gagnerez beaucoup de temps.

## Niveau 3 - Intermédiaire 

À partir de maintenant, je vais vous donner les commandes que j'utilise le plus souvent et qui vont vous faire gagner beaucoup de temps.

`S-V` : Sélectionner des lignes
    -> d les supprimer + copier
    -> 

`C-t` : Ajoute une tabulation
`C-d` : Supprime une tabulation

`C-v I` : Ajoute du texte à toutes les lignes sélectionnées
`C-v c` : Remplace le bloc et répètera le contenu sur toutes les lignes.

`*` : Chercher la prochaine occurence du mot sous le curseur
`#` : comme `*` mais dans le sens contraire

