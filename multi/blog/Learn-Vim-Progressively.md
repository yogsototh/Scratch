-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-08-25T19:28:20+02:00
en: title: Learn Vim Progressively
fr: title: Apprenez Vim Progressivement
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - vi
  - vim
  - editor
en:   - tutorial
fr:   - tutoriel
en:   - learn
fr:   - apprendre
-----
blogimage("uber_leet_use_vim.jpg","Über leet use vim!")

begindiv(intro)

en: %tldr You want to teach yourself vim (the best text editor known to human kind) in the fastest way possible. This my way of doing it. You start by learning the minimal to survive, then you integrate all the tricks slowly.

fr: %tlal Vous désirez apprendre vim (le meilleur editeur de texte connu à ce jour) le plus rapidement possible. Voici mes conseils pour vous aider. Commencez à apprendre le minimum vital, puis apprenez doucement de nouvelles commandes.

enddiv

en: [Vim] the Six Billion Dollar editor
fr: [Vim] ou l'éditeur qui vallait 3 milliards :

en: > Better, Stronger, Faster.
fr: > Meilleur, plus fort, plus rapide.

en: Learn [vim] and it will be your last text editor.
en: There isn't any better text editor that I know of.
en: It is hard to learn, but incredible to use.
fr: Apprenez [vim] et ce sera votre dernier éditeur.
fr: Aucun éditeur que je connaisse ne le surpasse.
fr: Sa prise en mais est difficile, mais payante.

en: I suggest you teach yourself Vim in 4 steps:
fr: Je vous conseille de l'apprendre en 4 étapes :

en: 1. Survive
en: 2. Feel comfortable
en: 3. Feel Better, Stronger, Faster
en: 4. Use superpowers of vim
fr: 1. La survie
fr: 2. Se sentir à son aise
fr: 3. Se sentir meilleur, plus fort et plus rapide
fr: 4. Tirer parti des super-pouvoirs de vim

en: By the end of this journey, you'll become a vim superstar. 
fr: À la fin de ces leçons vous serez transformé.

en: But before we start, just a warning.
en: Learning vim will be painful at first.
en: It will take time.
en: It will be a lot like playing a musical instrument.
en: Don't expect to be more efficient with vim than with another editor in less than 3 days.
en: In fact it will certainly take 2 weeks instead of 3 days.
fr: Avant de commencer, un message pour vous prévenir.
fr: Apprendre vim sera difficile au début.
fr: Ça prendra du temps.
fr: Vous devrez vous entraîner.
fr: Apprendre vim ressemble beaucoup à apprendre un instrument de musique.
fr: N'espérez pas être plus efficace avec vim qu'avec un autre éditeur avant au moins trois jours.
fr: En fait ça sera certainement plus 2 semaines que 3 jours.

[Vim]: http://www.vim.org
[vim]: http://www.vim.org



en: ## 1st Level -- Survive
fr: ## 1er Niveau -- Survivre

en: 0. Install [vim]
en: 1. Launch vim
en: 2. DO NOTHING! Read.
fr: 0. Installez [vim]
fr: 1. Lancez vim
fr: 2. NE TOUCHEZ A RIEN! Lisez

en: In a standard editor, typing on the keyboard is enough to write something and see it on the screen.
en: Not this time.
en: Vim is in _Normal_ mode.
en: Let's go to _Insert_ mode.
en: Type the letter `i`.
fr: Dans un éditeur normal, il suffit de taper sur une touche du clavier et la lettre s'affiche à l'écran.
fr: Pas ici.
fr: Vim est en mode _Normal_.
fr: Commençons par placer vim en mode _Insert_.
fr: Tapez sur la touche `i`.

en: You should feel a bit better.
en: You can type letters like in a standard editor.
en: To get back to _Normal_ mode just press the `ESC` key.
fr: Voilà, c'est magique. 
fr: Vous pouvez tapez comme dans un éditeur standard.
fr: Pour repasser en mode Normal tapez sur la touche `Echap`.

en: You now know how to switch between _Insert_ and _Normal_ mode.
en: And now, here are the commands that you need in order to survive in _Normal_ mode:
fr: Maintenant que vous savez passer du mode _Normal_ au mode _Insert_.
fr: Voici les commandes de survie (toutes en mode _Normal_) :

en: > - `i` → _Insert_ mode. Type `ESC` to return to Normal mode.
en: > - `x` → Delete the char under the cursor
en: > - `:wq` → Save and Quit (`:w` save, `:q` quit)
en: > - `dd` → Delete (and copy) the current line
en: > - `p` → Paste
en: > 
en: > Recommended:
en: > 
en: > - `hjkl` (highly recommended but not mandatory) →  basic cursor move (<-&darr;&uarr;→). Hint: `j` looks like a down arrow.
en: > - `:help <command>` → Show help about `<command>`. You can use `:help` without a `<command>` to get general help.
fr: > - `i` → Passer en mode insértion. Taper `Echap` pour repasser en mode Normal.
fr: > - `x` → Supprimer le caractère sous le curseur
fr: > - `:wq` → Sauvegarder et quitter (`:w` sauvegarde, `:q<enter>` quitter)
fr: > - `dd` → Supprimer (et copier) la ligne courante
fr: > - `p` → Coller
fr: > 
fr: > Récommandées :
fr: > 
fr: > - `hjkl` (optionnel) → se déplacer (<-&darr;&uarr;→). Souvenez vous `j` ressemble à une flèche vers le bas.
fr: > - `:help <commande>` → Affiche l'aide pour `<commande>`. Vous pouvez aussi écrire `:help` pour atterir sur l'aide générale.

en: Only 5 commands. That is all you need to get started.
en: Once these command start to become natural (maybe after day or so), you should move on to level 2.
fr: Seulement 5 commandes. 
fr: Voilà, c'est tout pour un début. 
fr: Essayez d'éditer vos fichiers comme ça pendant une petite journée. 
fr: Lorsque ces commandes vous sembleront naturelles, 
fr: vous pourrez passer à l'étape d'après. 

en: But first, just a little remark about _Normal mode_.
en: In standard editors, to copy you have to use the `Ctrl` key (`Ctrl-c` generally).
en: In fact, when you press `Ctrl`, it is as if all of your keys change meaning.
en: Using vim in normal mode is a bit like having the editor automatically press the `Ctrl` key for you.
fr: Mais avant un petit mot sur le mode Normal.
fr: Dans un éditeur normal pour copier il faut utiliser une combinaison de touches (`Ctrl-c`). 
fr: En fait, lorsque vous appuyez sur la touche `Ctrl`, c'est un peu comme si toutes les touches du clavier avaient un autre usage.
fr: Dans vim, lorsque vous êtes en mode Normal, c'est comme si vous mainteniez `Ctrl` enfoncé.

en: A last word about notations: 
en: 
en: - instead of writing `Ctrl-λ`, I'll write `<C-λ>`.
en: - commands starting with `:` end with `<enter>`. For example, when I write `:q`, I mean `:q<enter>`.
fr: Quelques mots concernant les notations :
fr: 
fr: - Au lieu d'écrire `Ctrl-λ`, j'écrirai `<C-λ>`. 
fr: - Les commandes qui commencent par `:` ont un retour à la ligne implicite à la fin. Par exemple lorsque que j'écris, `:q` celà signifi qu'il faut taper `:`, suivi de `q`, suivi de `<Return>`.

en: ## 2nd Level -- Feel comfortable
fr: ## 2ème Niveau -- Se sentir à son aise

en: You know the commands required for survival. 
en: It's time to learn a few more commands.
en: These are my suggestions:
fr: Vous connaissez les commandes de survie.
fr: Passons à des commandes pour être un peu plus à notre aise.
fr: Je vous suggère :

en: 1. Insert mode variations:
en: 
en:     > - `a`     → insert after the cursor
en:     > - `o`     → insert a new line after the current one
en:     > - `O`     → insert a new line before the current one
en:     > - `cw`    → replace from the cursor to the end of the word
fr: 1. Les variantes de l'insertion
fr: 
fr:     > - `a`     → Comme `i`, mais après la position du curseur.
fr:     > - `o`     → Comme `i`, mais à la ligne suivante.
fr:     > - `O`     → Comme `o` mais ajoute la ligne avant.
fr:     > - `cw`    → Remplacer la fin du mot.

en: 2. Basic moves
en: 
en:     > - `0`         → go to the first column
en:     > - `^`         → go to the first non-blank character of the line
en:     > - `$`         → go to the end of line
en:     > - `g_`         → go to the last non-blank character of line
en:     > - `/pattern`  → search for `pattern` 
fr: 2. Déplacements basiques
fr: 
fr:     > - `0`         → Aller à la première colonne.
fr:     > - `^`         → Aller au premier caractère de la ligne.
fr:     > - `$`         → Aller à la fin de la ligne.
fr:     > - `g_`         → Aller au dernier caractère de la ligne.
fr:     > - `/pattern`  → Rechercher `pattern` dans le fichier.

en: 3. Copy/Paste
en: 
en:     > - `P`  → paste before, remember `p` is paste after current position.
en:     > - `yy` → copy the current line, easier but equivalent to `ddP`
fr: 3. Copier/Coller
fr: 
fr:     > - `P`  → Coller avant. Souvenez vous, `p` colle après la position du curseur.
fr:     > - `yy` → Copier la ligne courante. C'est plus simple et équivalent à `ddP`

en: 4. Undo/Redo
en: 
en:     > - `u` → undo
en:     > - `<C-r>` → redo
fr: 4. Annuler/Refaire
fr: 
fr:     > - `u` → Annuler (undo)
fr:     > - `<C-r>` → Refaire

en: 5. Load/Save/Quit/Change File (Buffer)
en: 
en:     > - `:e <path/to/file>` →  open
en:     > - `:w` → save
en:     > - `:saveas <path/to/file>` → save to `<path/to/file>`
en:     > - `:x`, `ZZ` or `:wq` → save and quit (`:x` only save if necessary)
en:     > - `:q!` → quit without saving, also: `:qa!` to quit even if there are modified hidden buffers.
en:     > - `:bn` (resp. `:bp`) → show next (resp. previous) file (buffer)
fr: 5. Ouvrir/Sauvegarder/Quitter/Changer de fichier (buffer)
fr: 
fr:     > - `:e <path/to/file>` → Ouvrir.
fr:     > - `:w` → Sauvegarder.
fr:     > - `:saveas <path/to/file>` → Sauvegarder sous ...
fr:     > - `:x`, `ZZ` ou `:wq` → Sauvegarder et quitter (`:x` sauvegarde seulement si nécessaire).
fr:     > - `:q!` → Quitter sans sauvegarder. De même `:qa!` quitte même si d'autres fichiers (buffers) ont des modifications non sauvegardées.
fr:     > - `:bn` (resp. `:bp`) → Affiche le fichier suivant (resp. précédent).

en: Take the time to learn all of these command.
en: Once done, you should be able to do every thing you are able to do in other editors.
en: You may still feel a bit awkward. But follow me to the next level and you'll see why vim is worth the extra work.
fr: Prenez le temps de bien intégrer ces commandes.
fr: Une fois fait, vous devriez être capable de faire tout ce qu'on peut attendre d'un éditeur de texte classique.

en: ## 3rd Level -- Better. Stronger. Faster.
fr: ## 3ième Niveau -- Meilleur. Plus fort. Plus rapide.

en: Congratulation for reaching this far!
en: Now we can start with the interesting stuff.
en: At level 3, we'll only talk about commands which are compatible with the old vi editor.
fr: Bravo ! Si vous êtes arrivé jusqu'ici nous allons pouvoir commencer à apprendre les choses vraiment intéressantes.
fr: Pour cette section, je vais seulement parler de commandes disponible dans vi et vim. 
fr: Vim est la contraction de "vi improved", ou en Français, "vi amélioré".

en: ### Better
fr: ### Meilleur

en: Let's look at how vim could help you to repeat yourself: 
fr: Voyons comment nous pouvons éviter les répétitions avec vi :

en: 1. `.` → (dot) will repeat the last command,
en: 2. N&lt;command&gt; → will repeat the command N times.
fr: 1. `.` → Le caractère point répètera la dernière commande. Très utile.
fr: 2. N`<commande>` → répètera la commande N fois. 

en: Some examples, open a file and type:
fr: Quelques exemples, ouvrez un fichier (non vide) avec vim et tapez :

en: > - `2dd` → will delete 2 lines
en: > - `3p` → will paste the text 3 times
en: > - `100idesu [ESC]` → will write "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
en: > - `.` → Just after the last command  will write again the 100 "desu ". 
en: > - `3.` → Will write 3 "desu" (and not 300, how clever).
fr: > - `2dd` → Supprimera 2 lignes
fr: > - `3p` → copiera 3 fois d'affiler le texte copié
fr: > - `100idesu [ESC]` → écrira "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
fr: > - `.` → Juste après la dernière commande  réécrira les 100 "desu ". 
fr: > - `3.` → Écrira 3 "desu" et non pas 300. Bien vu n'est-ce pas ?

en: ### Stronger
fr: ### Plus fort

en: Knowing how to move efficiently with vim is _very_ important. 
en: Don't skip this section.
fr: Savoir se déplacer efficacement avec vim est _très_ important. 
fr: Ne sautez pas cette section.

en: 1. N`G` → Go to line N
en: 2. `gg` → shortcut for `1G` - go to the start of the file
en: 3. `G`  → Go to last line
en: 4. Word moves:
en: 
en:     > 1. `w` → go to the start of the following word,
en:     > 2. `e` → go to the end of this word.
en:     >
en:     > By default, words are composed of letters and the underscore character.
en:     > Let's call a WORD a group of letter separated by blank characters. 
en:     > If you want to consider WORDS, then just use uppercase characters:
en:     >
en:     > 1. `W` → go to the start of the following WORD,
en:     > 2. `E` → go to the end of this WORD.
fr: 1. N`G` → Aller à la ligne N
fr: 2. `gg` → raccourci pour `1G`, retourner au début du fichier
fr: 3. `G`  → Aller à la dernière ligne.
fr: 4. Déplacement autour des mots:
fr: 
fr:     > 1. `w` → aller au début du mot suivant
fr:     > 2. `e` → aller à la fin du mot courant
fr:     >
fr:     > Par défaut les mots sont seulement composés de lettres (et du caractère souligné `_`).
fr:     > Appelons un MOT un ensemble de lettre séparé par des caractères blancs (espaces, tabulation).
fr:     > Si vous voulez considérer des MOTS alors il suffit d'utiliser les majuscules.
fr:     >
fr:     > 1. `W` → aller au début du MOT suivant
fr:     > 2. `E` → aller à la fin du MOT courant
    >
    > blogimage("word_moves.jpg","Word moves example")

en: Now let's talk about very efficient moves:
fr: Passons aux commandes de déplacement les plus efficaces :

en: > - `%` : Go to the corresponding `(`, `{`, `[`.
en: > - `*` (resp. `#`) : go to next (resp. previous) occurrence of the word under the cursor
fr: > - `%` : Aller à la parenthèse, accolade, crochet correspondante.
fr: > - `*` (resp. `#`) : Aller à la prochaine (resp. précédente) occurrence du mot sous le curseur

en: Believe me, the last three commands are gold.
fr: Croyez moi, ces trois dernières commandes valent de l'or.
fr: Retenez les et vous gagnerez beaucoup de temps.

en: ### Faster
fr: ### Plus rapide

en: Remember about the importance of vi moves?
en: Here is the reason.
en: Most commands can be used using the following general format:
fr: Vous vous souvenez que j'ai dit que les déplacements étaient très importants en vi. 
fr: Voilà pourquoi.
fr: Une façon de travailler avec vim est de se dire que l'on fait des "phrases". 
fr: Le verbe étant la commande et les compléments définissent la zone d'action.
fr: De façon générale :

en: `<start position><command><end position>`
fr: `<position de depart><commande><position d'arrivee>`

en: For example : `0y$` means
en: 
en: - `0` → go to the beginning of this line
en: - `y` → yank from here
en: - `$` → up to the end of this line
fr: Par exemple : `0y$` signifie :
fr: 
fr: - `0` → Aller au début de la ligne,
fr: - `y` → copie à partir d'ici,
fr: - `$` → jusqu'à la fin de cette ligne.

en: We also can do things like `ye`, yank from here to the end of the word.
en: But also `y2/foo` yank up to the second occurrence of "foo".
fr: On peut donc faire des choses comme `ye`, copie à partir de la position courante du curseur jusqu'à là fin du mot.
fr: Mais aussi: `y2/toto` copie jusqu'à la seconde prochaine occurrence de "toto".

en: But what was true for `y` (yank), 
en: is also true for `d` (delete), `v` (visual select), `gU` (uppercase), `gu` (lowercase), etc...
fr: Ce qui est vrai pour `y` (yank → copier),
fr: est aussi vrai pour `d` (delete → supprimer), `v` (sélection visuelle), `gU` (uppercase → majuscule),`gu` (lowercase → minuscule), etc...

en: ## 4th Level -- Vim Superpowers
fr: ## 4ième Niveau -- Les super pouvoirs de Vim

en: With all preceding commands you should be comfortable using vim.
en: But now, here are the killer features.
en: Some of these features were the reason I started to use vim.
fr: Jusqu'ici vous avez appris les commandes les plus courantes.
fr: Mais voici les killer features de vim. 
fr: Celles que je n'ai retrouvé que dans vim (ou presque).

en: ### Move on current line: `0` `^` `$` `g_` `f` `F` `t` `T` `,` `;`
fr: ### Déplacement sur la ligne : `0` `^` `$` `g_` `f` `F` `t` `T` `,` `;`

en: > - `0` → go to column 0
en: > - `^` → go to first character on the line
en: > - `$` → go to the last column
en: > - `g_` → go to the last character on the line
en: > - `fa` → go to next occurrence of the letter `a` on the line. `,` (resp. `;`) will find the next (resp. previous) occurrence.
en: > - `t,` → go to just before the character `,`.
en: > - `3fa` → find the 3rd occurrence of `a` on this line.
en: > - `F` and `T` → like `f` and `t` but backward.
fr: > - `0` → aller à la colonne 0,
fr: > - `^` → aller au premier caractère de la ligne
fr: > - `$` → aller à la dernière colonne de la ligne
fr: > - `g_` → aller au dernier caractère de la ligne
fr: > - `fa` → vous amène à la prochaine occurrence de a sur la ligne courante. `,` (resp. `;`) recherche l'occurrence suivante (resp. précédente).
fr: > - `t,` → vous amène juste avant le `,`.
fr: > - `3fa` → recherche la 3ième occurrence de `a`.
fr: > - `F` et `T` → comme `f` et `t` mais en arrière.
> blogimage("line_moves.jpg","Line moves")

en: A useful tip is: `dt"` → remove everything until the `"`.
fr: Un truc pratique : `dt"` → supprime tout jusqu'au prochain `"`.

en: ### Zone selection `<action>a<object>` or `<action>i<object>`
fr: ### Selection de zone `<action>a<object>` ou `<action>i<object>`

en: These command can only be used after an operator in visual mode.
en: But they are very powerful. Their main pattern is:
fr: Ces commandes sont utilisable seulement en mode visuel ou après un "opérateur".
fr: Mais elles sont très puissantes. Leur forme générale est:

en: `<action>a<object>` and `<action>i<object>`
fr: `<action>a<objet>` et `<action>i<objet>`

en: Where action can be any action, for example, `d` (delete), `y` (yank), `v` (select in visual mode).
en: The object can be: `w` a word, `W` a WORD (extended word), `s` a sentence, `p` a paragraph. But also, natural character such as `"`, `'`, `)`, `}`, `]`.
fr: Où action peut être par exemple `d` (delete), `y` (yank), `v` (select in visual mode), etc...
fr: Un objet peut être: `w` un mot, `W` un MOT (mot étendu), `s` une phrase, `p` un paragraphe. Mais aussi des caractère plus naturels comme `"`, `'`, `)`, `}`, `]`.

en: Suppose the cursor is on the first `o` of `(map (+) ("foo"))`.
fr: Supposons que le curseur soit positionné sur le premier `o` dans `(map (+) ("foo"))`.

en: > - `vi"` → will select `foo`.
en: > - `va"` → will select `"foo"`.
en: > - `vi)` → will select `"foo"`.
en: > - `va)` → will select `("foo")`.
en: > - `v2i)` → will select `map (+) ("foo")`
en: > - `v2a)` → will select `(map (+) ("foo"))`
fr: > - `vi"` → sélectionnera `foo`.
fr: > - `va"` → sélectionnera `"foo"`.
fr: > - `vi)` → sélectionnera `"foo"`.
fr: > - `va)` → sélectionnera `("foo")`.
fr: > - `v2i)` → sélectionnera `map (+) ("foo")`
fr: > - `v2a)` → sélectionnera `(map (+) ("foo"))`

blogimage("textobjects.png","Text objects selection")

en: ### Select rectangular blocks: `<C-v>`. 
fr: ### Sélection de blocs rectangulaires : `<C-V>`.

en: Rectangular blocks are very useful for commenting many lines of code.
en: Typically: `0<C-v><C-d>I-- [ESC]`
en: 
en: - `^` → go to start of the line
en: - `<C-v>` → Start block selection
en: - `<C-d>` → move down (could also be `jjj` or `%`, etc...)
en: - `I-- [ESC]` → write `-- ` to comment each line

fr: Les blocs rectangulaires sont très commodes pour commenter plusieurs lignes de codes.
fr: Typiquement: `^<C-V><C-d>I-- [ESC]`
fr: 
fr: - `^` → aller en début de ligne
fr: - `<C-V>` → Commencer la sélection du bloc
fr: - `<C-d>` → se déplacer vers le bas (pourrait être `jjj` ou `%` etc...)
fr: - `I-- [ESC]` → écrit `-- ` pour commenter le reste de la ligne.

blogimage("rectangular-blocks.gif","Rectangular blocks")

en: Note: in Windows you might have to use `<C-q>` instead of `<C-v>` if your clipboard is not empty.
fr: Remarquez que sous windows, vous devez utiliser `<C-q>` plutôt que `<C-v>` si votre "presse papier" n'est pas vide.

en: ### Completion: `<C-n>` and `<C-p>`.
fr: ### Complétion : `<C-n>` et `<C-p>`.

en: In Insert mode, just type the start of a word, then type `<C-p>`, magic...
fr: En mode Insert, commencez à écrire le début d'un mot déjà présent dans l'un des buffers (fichers) ouvert et tapes `<C-p>`. Magique.
blogimage("completion.gif","Completion") 

en: ### Macros : `qa` do something `q`, `@a`, `@@`
fr: ### Macros : `qa` faire quelque chose `q`, `@a`, `@@`

en: `qa` record your actions in the _register_ `a`. 
en: Then `@a` will replay the macro saved into the register `a` as if you typed it.
en: `@@` is a shortcut to replay the last executed macro.
fr: `qa` enregistre tout ce que vous faite et enregistre le tout dans le _registre_ `a`. 
fr: Ensuite `@a` va rejouer la macro enregistrée dans le registre `a` comme si c'est vous qui tapiez au clavier.
fr: `@@` est un raccourci pour rejouer la dernière macro exécutée.

en: > *Example*
en: >
en: > On a line containing only the number 1, type this:
en: >
en: > - `qaYp<C-a>q` → 
en: >   
en: >   - `qa` start recording. 
en: >   - `Yp` duplicate this line.
en: >   - `<C-a>` increment the number.
en: >   - `q` stop recording.
en: > 
en: > - `@a` → write 2 under the 1
en: > - `@@` → write 3 under the 2
en: > - Now do `100@@` will create a list of increasing numbers until 103.
fr: > Exemple :
fr: > Sur une ligne contenant seulement un 1 tapez :
fr: >
fr: > - `qaYp<C-a>q` → 
fr: > 
fr: >   - `qa` → début de l'enregistrement.
fr: >   - `Yp` → copier cette ligne.
fr: >   - `<C-a>` → incrémente le nombre.
fr: >   - `q` → arrête d'enregistrer.
fr: > 
fr: > - `@a` → écrit un 2 sous le 1.
fr: > - Écrivez `100@@`. Cela va créer une liste de nombre croissants jusqu'à 103.

blogimage("macros.gif","Macros")

en: ### Visual selection: `v`,`V`,`<C-v>`
fr: ### Sélection visuelle : `v`,`V`,`<C-v>`

en: We saw an example with `<C-v>`. 
en: There is also `v` and `V`.
en: Once the selection has been made, you can:
en: 
en: - `J` → join all the lines together.
en: - `<` (resp. `>`) → indent to the left (resp. to the right).
en: - `=` → auto indent
fr: On a déjà vu un exemple avec `<C-V>`. 
fr: Mais il y a aussi, `v` et `V`.
fr: Et une fois la sélection visuelle faite vous pouvez par exemple:
fr: 
fr: - `J` → joindre toutes les lignes pour en faire une seule
fr: - `<` (resp. `>`) → indenter à gauche (resp. à droite).
fr: - `=` → auto indenter

blogimage("autoindent.gif","Autoindent")

en: Add something at the end of all visually selected lines:
en: 
en: - `<C-v>` 
en: - go to desired line (`jjj` or `<C-d>` or `/pattern` or `%` etc...)
en: - `$` go to the end of the line
en: - `A`, write text, `ESC`.
fr: Ajouter quelque chose à la fin de toutes les lignes sélectionnées visuellement : 
fr: 
fr: - `<C-v>` 
fr: - aller jusqu'à la ligne désirée (`jjj` ou `<C-d>` ou `/pattern` ou `%` etc...)
fr: - `$` aller à la fin 
fr: - `A`, écrire le texte, `Echap`.

en: blogimage("append-to-many-lines.gif","Append to many lines")
fr: blogimage("append-to-many-lines.gif","Ajouter à la fin de plusieurs lignes")

en: ### Splits: `:split` and `vsplit`.
fr: ### Splits : `:split` et `vsplit`.

en: These are the most important commands, but you should look at `:help split`.
en: 
en: > - `:split` → create a split (`:vsplit` create a vertical split)
en: > - `<C-w><dir>` : where dir is any of `hjkl` or <-&darr;&uarr;→ to change the split.
en: > - `<C-w>_` (resp. `<C-w>|`) : maximise the size of the split (resp. vertical split)
en: > - `<C-w>+` (resp. `<C-w>-`) : Grow (resp. shrink) split
fr: Je vous conseille de faire un `:help split`. 
fr: Celà permet de manipuler plusieurs buffer sur la même fenêtre.
fr: Voici les commandes principales :
fr: 
fr: > - `:split` →  crée un split (`:vsplit` crée un split vertical)
fr: > - `<C-w><dir>` →  où dir est l'un de `hjkl` ou <-&darr;&uarr;→ permet de changer de split.
fr: > - `<C-w>_` (resp. `<C-w>|`) →  Maximise la taille du split (resp. split vertical)
fr: > - `<C-w>+` (resp. `<C-w>-`) →  Agrandi (resp. diminue) le split

blogimage("split.gif","Split")

## Conclusion

en: That was 90% of the commands I use every day.
en: I suggest that you learn no more than one or two new commands per day.
en: After two to three weeks you'll start to feel the power of vim in your hands.
fr: Voilà, je vous ai donné 90% des commandes que j'utilise tous les jours.
fr: N'essayez pas de toutes les apprendre en une journée. 
fr: Il faut le temps de s'habituer à chaque nouvelle commande. 
fr: Je vous conseille de ne pas apprendre plus d'une ou deux commandes par jour.

en: Learning Vim is more a matter of training than plain memorization.
en: Fortunately vim comes with some very good tools and excellent documentation.
en: Run vimtutor until you are familiar with most basic commands.
en: Also, you should read this page carefully: `:help usr_02.txt`.
fr: Apprendre Vim est plus une question d'entraînement que de mémorisation.
fr: Heureusement vim est founi avec un très bon tutoriel et une excellente documentation.
fr: Lancez vimtutor jusqu'à ce que vous vous sentiez à l'aise avec les commandes basiques.
fr: De plus, vous devriez aussi lire en détail la page suivate : `:help usr_02.txt`.

en: Then, you will learn about `!`, folds, registers, plugins and many other features.
en: Learn vim like you'd learn piano and all should be fine.
fr: Ensuite vous découvrirez `!`, les folds, les registres, les plugins et tout un tas d'autres choses.
fr: Apprenez vim comme vous apprendriez le piano et vous devriez très bien vous en sortir.




<script>
// Style the keywords
$(document).ready(function() {
    $('code').css({ 'border': 'solid 1px #CCC', 'padding':'3px'});
});
</script>
