-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-08-18T00:28:20+02:00
en: title: Efficient Vim knowledge
fr: title: Vim efficace avec peu d'efforts
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("uber_leet_use_vim.jpg","Über leet use vim!") %>

begindiv(intro)

en: <%= tldr %> Want to learn vim (the best text editor known to human kind) the fastest way possible. I suggest you a way.

fr: <%= tlal %> Vous désirez apprendre vim (le meilleur editeur de texte connu à ce jour) le plus rapidement possible. Voici mes conseils pour vous aider.

enddiv

en: [Vim] the Six Billion Dollar editor
fr: [Vim] ou l'éditeur qui vallait 3 milliards :

en: > Better, Stronger, Faster.
fr: > Meilleur, plus fort, plus rapide.

en: Learn [vim] and it will be your last text editor.
en: There isn't any better text editor I know.
en: Hard to learn, but it will pay a billion times.
fr: Apprenez [vim] et ce sera votre dernier éditeur.
fr: Aucun éditeur que je connaise ne le surpasse.
fr: Sa prise en mais est difficile, mais payante.

en: I suggest you to learn it in 4 steps:
fr: Je vous conseille de l'apprendre en 4 étapes :

en: 1. Survive
en: 2. Feel comfortable
en: 3. Feel Better, Stronger, Faster
en: 4. Power Overwhelming
fr: 1. La survie
fr: 2. Se sentir à son aise
fr: 3. Se sentir meilleur, plus fort et plus rapide
fr: 4. Les super-pouvoirs

en: By the end of this journey, you'll become a vim superstar. 
fr: Après ces leçons, vous serez une super star de l'édition de texte.

[Vim]: http://www.vim.org
[vim]: http://www.vim.org



en: ## 1st Level: Survive
fr: ## 1er Niveau: survivre

en: 0. Install [vim]
en: 1. Launch vim
en: 2. DO NOTHING! Read.
fr: 0. Installez [vim]
fr: 1. Lancez vim
fr: 2. NE TOUCHEZ A RIEN! Lisez

en: In a standard editor, typing on the keyboard is enough to write something and see it on the screen.
en: Not this time.
en: Vim is in _edition_ mode.
en: Lets get in _insertion_ mode.
en: Type on the letter `i`.
fr: Dans un éditeur normal, il suffit de taper sur une touche du clavier et la lettre s'affiche à l'écran.
fr: Pas ici.
fr: Vim est en mode _edition_.
fr: Commençons par placer vim en mode _insertion_.
fr: Tapez sur la touche `i`.

en: Now you should feel a bit better.
en: You can type letters like in a standard notepad.
en: To get back in _edition_ mode just tap the `ESC` key.
fr: Voilà, c'est magique. 
fr: Vous pouvez tapez comme dans un éditeur standard.
fr: Pour repasser en mode édition tapez sur la touche `Echap`.

en: Now you know how to switch between insertion and edition mode. And now, the list of command you can use in edition mode to survive:
fr: Maintenant que vous savez passer du mode edition au mode insertion. Voici les commandes de survie (toutes en mode edition) :

en: > - `i`: Insertion mode. Type `ESC` to return to edition mode.
en: > - `x`: Delete the char under the cursor
en: > - `:wq`: Save and Quit (`:w` save, `:q` quit)
en: > - `dd`: Delete (and copy) current line
en: > - `p`: Paste current line
en: > - `hjkl` (recommended but not mandatory): basic cursor move (<-&darr;&uarr;->). Hint `j` look like a down arrow.
en: > - `:help <command>`: Show help about <command>, you can start using `:help` without anything else.
fr: > - `i` : Passer en mode insértion. Taper Echap pour repasser en mode edition.
fr: > - `x` : Supprimer le caractère sous le curseur
fr: > - `:wq` : Sauvegarder et quitter (`:w` sauvegarde, `:q` quitter)
fr: > - `dd` : Supprimer (et copier) la ligne courante
fr: > - `p` : Coller
fr: > - `hjkl` (optionnel) : se déplacer (<-&darr;&uarr;->). Souvenez vous `j` ressemble à une flèche vers le bas.

en: Only 5 commands. This is very few to start.
en: Once these command start to become natural (may be after a complete day), you should try to confront to level 2.
fr: Seulement 5 commandes. Voilà, c'est tout pour un début. 
fr: Essayez d'éditer vos fichier comme ça pendant une petite journée. 
fr: Lorsque ces commandes vous seront devenues naturelle. 
fr: Vous pouvez passer à l'étape d'après. 

en: ## 2nd Level - Feel comfortable
fr: ## 2ème Niveau - Se sentir à son aise

en: You know the survivor commands. 
en: Now, just a bit more commands to use.
en: I suggest:
fr: Vous connaissez les commandes de survie. Passons à des commandes pour être un peu plus à notre aise. Je vous suggère :

en: 1. Insertion mode variations:
en: 
en:     > - `a`     -> insert _after_ the cursor
en:     > - `o`     -> insert a new line after the current one
en:     > - `O`     -> insert a new line before the current one
en:     > - `cw`    -> replace the word under the cursor
fr: 1. Les variantes de l'insertion
fr: 
fr:     > - `a`     -> comme `i`, mais après la position du curseur.
fr:     > - `o`     -> comme `i`, mais à la ligne suivante
fr:     > - `O`     -> comme `o` mais ajoute la ligne avant.
fr:     > - `cw`    -> remplacer le mot sous le curseur.

en: 2. Basic moves
en: 
en:     > - `0`         -> go to first column
en:     > - `^`         -> go to first character of the line
en:     > - `$`         -> go to the end of line
en:     > - `/pattern`  -> search for `pattern` 
fr: 2. Déplacements basiques
fr: 
fr:     > - `0`         -> aller à la première colonne
fr:     > - `^`         -> aller au premier caratère de la ligne
fr:     > - `$`         -> aller à la fin de la ligne
fr:     > - `/pattern`  -> rechercher `pattern` dans le fichier.

en: 3. Copy/Paste
en: 
en:     > - `P`  -> copy before, remember `p` is copy after current position.
en:     > - `yy` -> copy current line, easier but equivalent to `ddP`
fr: 3. Copier/Coller
fr: 
fr:     > - `P`  -> Coller avant, souvenez-vous que `p` collait après la position du curseur.
fr:     > - `yy` -> copier la ligne courante. C'est plus simple et équivalent à `ddP`

en: 4. Undo/Redo
en: 
en: > - `u` -> undo
en: > - `C-r` -> redo
fr: 4. Annuler/Refaire
fr: 
fr: > - `u` -> Annuler (undo)
fr: > - `C-r` -> Refaire

en: ## Level 3 - Better. Stronger. Faster.
fr: ## Niveau 3 - Meilleur. Plus fort. Plus rapide.

en: Congratulation! If you managed to go until here, we can start the interresting stuff.
en: At level 3, we'll only talk about command which are compatible in the old vi.
fr: Bravo ! Si vous êtes arrivé jusqu'ici nous allons pouvoir commencer à apprendre les choses vraiment intéressantes.
fr: Pour cette section, je vais seulement parler de choses qui sont aussi disponible dans le vieux vi. 

en: Lets start by the first vi super-power. Limit to repeat yourself (basic):
fr: Commençons par le premier super pouvoir de vi, éviter les répétitions (niveau 1):

en: 1. `.` -> (dot) will repeat the last command,
en: 2. N&lt;command&gt; -> will do the command N times.
fr: 1. `.` -> Le caractère point répètera la dernière commande.
fr: 2. N&lt;commande&gt; -> répètera la commande N fois. 

en: Some examples, open a file and type:
fr: Quelques exemples, ouvrez un fichier avec vim et tapez :

en: > - `2dd` -> will delete 2 lines
en: > - `3p` -> will paste the text 3 times
en: > - `100idesu [ESC]` -> will write "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
en: > - `.` -> Just after the last command  will write again the 100 "desu ". 
en: > - `3.` -> Will write 3 "desu" (and not 300, how clever).
fr: > - `2dd` -> Supprimera 2 lignes
fr: > - `3p` -> copiera 3 fois d'affiler le texte copié
fr: > - `100idesu [ESC]` -> écrira "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
fr: > - `.` -> Juste après la dernière commande  réécrira les 100 "desu ". 
fr: > - `3.` -> Écrira 3 "desu" et non pas 300.

en: Second vi super power, moving (basic):
en: Knowing how to move efficiently with vim is _very_ important. Do not jump this section.
fr: Second super pouvoir de vim, les déplacements (niveau 1) :
fr: Savoir se déplacer efficacement avec vim est _très_ important, ne sautez pas cette section.

en: 1. N`G` -> Go to line N
en: 2. `gg` -> shortcut for `1G`, go to the start of the file
en: 3. `G`  -> Go to last line
en: 4. Word moves:
en: 
en:     > 1. `w` -> go to the start of the following word,
en:     > 2. `e` -> go to the end of this word.
en:     >
en:     > By default, word are composed of letter and the underscore character.
en:     > If you want to use word in the meaning of group of letter separated by spaces, just use uppercases:
en:     >
en:     > 1. `W` -> go to the start of the following "extended" word,
en:     > 2. `E` -> go to the end of this "extended" word.
fr: 1. N`G` -> Aller à la ligne N
fr: 2. `gg` -> raccourci pour `1G`, retourner au début du fichier
fr: 3. `G`  -> Aller à la dernière ligne.
fr: 4. Déplacement autour des mots:
fr: 
fr:     > 1. `w` -> aller au début du mot suivant
fr:     > 2. `e` -> aller à la fin du mot courant
fr:     >
fr:     > Par défaut les mots sont seulement composés de lettres (et du caractère souligné `_`).
fr:     > Si vous voulez considérer les mots au sens "jusqu'au prochain espace", alors il suffit d'utiliser les majuscules.
fr:     >
fr:     > 1. `W` -> aller au début du mot "étendu" suivant
fr:     > 2. `E` -> aller à la fin du mot "étendu" courant

en: Now lets talk about very efficient moves:
fr: Maintenant passons aux déplacement qui vont vous faire sentir vraiment meilleur :

en: > - `%` : Go to corresponding `(`, `{`, `[`.
en: > - `*` (resp. `#`) : go to next (resp. previous) occurrence of the word under the cursor
fr: > - `%` : Aller à la parenthèse, accolade, crochet correspondante.
fr: > - `*` (resp. `#`) : Aller à la prochaine (resp. précédente) occurrence du mot sous le curseur

fr: Croyez moi, ces trois dernières commandes valent de l'or.
fr: Retenez les, et vous gagnerez beaucoup de temps.
en: Believe me, these last three command are gold.

en: ## Level 4 - Power Overwhelming
fr: ## Niveau 4 - Power Overwhelming

fr: Avec toutes les commandes précédentes vous avez presque toutes les commandes que j'utilise tous les jours. 
fr: Mais voici les killer features de vim. 
fr: Celles que je n'ai retrouvé que dans vim (ou presque).
en: With all preceding commands you should be comfortable to use vim.
en: But now, here are the killer features.
en: Some of these features were the reason I started to use vim.

en: Move on current line, any of: `0^$fFtT,;`
fr: Déplacement sur la ligne : `0^$fFtT,;`

en: > - `0` -> go to column 0
en: > - `^` -> go to first character on the line
en: > - `$` -> go to the last character on the line
en: > - `fa` -> go to next occurrence of the letter `a` on the line. `,` will seek next occurrence.
en: > - `t,` -> go just after the character `,`.
en: > - `3fa` -> search the 3rd occurrence of `a` on this line.
en: > - `F` and `T` -> like `f` and `t` but backward.
fr: > - `0` -> aller à la colonne 0,
fr: > - `^` -> aller au premier caractère de la ligne
fr: > - `$` -> aller au dernier caractère de la ligne
fr: > - `fa` -> vous amène à la prochaine occurrence de a sur la ligne courante. `,` recherche l'occurrence suivante.
fr: > - `t,` -> vous amène juste après le `,`.
fr: > - `3fa` -> recherche la 3ième occurrence de `a`.
fr: > - `F` et `T` -> comme `f` et `t` mais en arrière.

en: Select rectangular blocs: `C-V`. 
fr: Sélection de blocs rectangulaires : `C-V`.
s
en: Rectangular blocks are very useful to comment many lines of code.
en: Typically: `0C-VC-dI// [ESC]`
en: 
en: - `^` -> go to start of the line
en: - `C-V` -> Start block selection
en: - `C-d` -> move down (could also be `jjj` or `%`, etc...)
en: - `I// [ESC]` -> write `// ` to comment each line

fr: Les blocs rectangulaires sont très commodes pour commenter plusieurs lignes de codes.
fr: Typiquement: `^C-VC-dI// [ESC]`
fr: 
fr: - `^` -> aller en début de ligne
fr: - `C-V` -> Commencer la sélection du bloc
fr: - `C-d` -> se déplacer vers le bas (pourrait être `jjj` ou `%` etc...)
fr: - `I// [ESC]` -> écrit `// ` pour commenter le reste de la ligne.

<%= blogimage("rectangular-blocks.gif","Rectangular blocks") %>

en: Completion: `C-n` and `C-p`.
fr: Complétion : `C-n` et `C-p`.

en: In insertion mode, just type the start of a word, then type `C-p`, magic...
fr: En mode insertion, commencez à écrire le début d'un mot déjà présent dans l'un des buffers (fichers) ouvert et tapes `C-p`. Magique.

<%= blogimage("completion.gif","Rectangular blocks") %>

en: Macros : `qa` do something `q`, then `@a` (also `@@`, repeat the last `@x`).
fr: Macros : `qa` faire quelque chose `q`. `@a`, puis `@@`.

en: `qa` record your actions in the _register_ `a`. Then `@a` will replay the macro saved into the register `a` as if you typed it.
fr: `qa` enregistre tout ce que vous faite et enregistre le tout dans le _registre_ `a`. Ensuite `@a` va rejouer la macro enregistrée dans le registre `a` comme si c'est vous qui tapiez au clavier.

en: > Example:
en: > On a line containing only a number type this:
en: > `qaYpC-aq` -> `qa` start recording. `Yp` duplicate this line. `C-a` increment the number. `q` stop recording.
en: > 
en: > Now a `100@a` will create a list of increasing numbers.
fr: > Exemple :
fr: > Sur une ligne contenant seulement un nombre tapez :
fr: > `qaYpC-aq` -> `qa` début de l'enregistrement. `Yp` copier cette ligne. `C-a` incrémente le nombre. `q` arrête d'enregistrer.
fr: > 
fr: > Maintenant essayez `100@a`. Cela va créer une liste de nombre croissants.

fr: Mais aussi,
en: But also,

fr: Sélection visuelle.
en: Visual selection

en: We saw an example with `C-V`. 
en: There is also `v` and `V`.
en: Once the selection made, you can:
en: 
en: - `=` -> auto indent
en: - `<` (resp. `>`) -> indent to the left (resp. to the right).
en: - `J` -> join all lines together.
fr: On a déjà vu un exemple avec `C-V`. 
fr: Mais il y a aussi, `v` et `V`.
fr: Et une fois la sélection visuelle faite vous pouvez par exemple:
fr: 
fr: - `=` -> auto indenter
fr: - `<` (resp. `>`) -> indenter à gauche (resp. à droite).
fr: - `J` -> joindre toutes les lignes pour en faire une seule

en: Add something at the end of all visually selected lignes:
en: 
en: - `S-V` 
en: - go to desired line (`jjj` or `C-d` or `/pattern` or `%` etc...)
en: - `$` go to the end of line
en: - `A`, write texte, `ESC`.
fr: Ajouter quelque chose à la fin de toutes les lignes sélectionnées visuellement : 
fr: 
fr: - `S-V` 
fr: - aller jusqu'à la ligne désirée (`jjj` ou `C-d` ou `/pattern` ou `%` etc...)
fr: - `$` aller à la fin 
fr: - `A`, écrire le texte, `Echap`.

en: Splits : `:split` and `vsplit`. You should look at `:help split`
fr: Splits : `:split` et `vsplit`. Pour en savoir plus faite un `:help split`

## Conclusion

en: Voilà, je vous ai donné 90% des commandes que j'utilise tous les jours.
en: N'essayez pas de tout apprendre en une journée. 
en: Il faut le temps de s'habituer à chaque nouvelle commande. 
en: Ajouter une ou deux commande par jour tous les jours est un bon exercice.
en: Dans 1 mois vous en connaitrez au moins autant que moi.
en: And keep in mind I am not a vim master, just a regular user.

<script>
// Style the keywords
$(document).ready(function() {
    $('code').css({ 'border': 'solid 1px #CCC', 'padding':'3px'});
});
</script>
