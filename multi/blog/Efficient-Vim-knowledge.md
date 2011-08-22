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
en:     > - `a`: insert _after_ the cursor
en:     > - `o`: insert a new line after the current one
en:     > - `O`: insert a new line before the current one
en:     > - `cw`: replace the word under the cursor
fr: 1. Les variantes de l'insertion
fr: 
fr:     > - `a` : comme `i`, mais après la position du curseur.
fr:     > - `o` : comme `i`, mais à la ligne suivante
fr:     > - `O` : comme `o` mais ajoute la ligne avant.
fr:     > - `cw` : remplacer le mot sous le curseur.

en: 2. Basic moves
en: 
en:     > - `0` : go to first column
en:     > - `^` : go to first character of the line
en:     > - `$` : go to the end of line
en:     > - `/pattern` : search for `pattern` 
fr: 2. Déplacements basiques
fr: 
fr:     > - `0` : aller à la première colonne
fr:     > - `^` : aller au premier caratère de la ligne
fr:     > - `$` : aller à la fin de la ligne
fr:     > - `/pattern` : rechercher `pattern` dans le fichier.

en: 3. Copy/Paste
en: 
en:     > - `P`: copy before, remember `p` is copy after current position.
en:     > - `yy`: copy current line, easier but equivalent to `ddP`
fr: 3. Copier/Coller
fr: 
fr:     > - `P` : Coller avant, souvenez-vous que `p` collait après la position du curseur.
fr:     > - `yy` : copier la ligne courante. C'est plus simple et équivalent à `ddP`

en: ## Level 3 - Better. Stronger. Faster.
fr: ## Niveau 3 - Meilleur. Plus fort. Plus rapide.

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
> - `3.` -> Écrira 3 "desu" et non pas 300.

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

## Level 4 - Power Overwhelming
## Niveau 4 - Power Overwhelming

Avec toutes les commandes précédentes vous avez presque toutes les commandes que j'utilise tous les jours. Mais voici les killer features de vim. Celles que je n'ai retrouvé que dans vim (ou presque).

Sélection de blocs rectangulaires : `C-V`.
Déplacement sur la ligne : `fFtT,;`

> - `fa`: vous amène à la prochaine occurence de a sur la ligne courante. `,` recherche l'occurence suivante.
> - `t,`: vous amène juste après le `,`.
> - `3fa`: recherche la 3ième occurence de `a`.
> - `F` et `T`, comme `f` et `t` mais en arrière.

Splits : `:split` et `vsplit`. Pour en savoir plus faite un `:help split`
Macros : `qa` faire quelque chose `qq`. `@a`, puis `@@`.

`qa` enregistre tout ce que vous faite et enregistre le tout dans le _registre_ `a`. Ensuite `@a` va rejouer la macro dans `a` comme si c'est vous qui tapiez au clavier.

> Exemple:
> On a line with a number type this.
> `qaYpC-aqq` -> `qa` start recording. `Yp` duplicate this line. `C-a` increment the number. `qq` stop recording.
> 
> Now a `10@a` will create a list of increasing numbers.

Ajouter quelque chose à la fin de toutes les lignes sélectionnées visuellement : `S-V` aller jusqu'à la ligne désirée (`jjj` ou `/pattern` ou `%` etc...) `$` aller à la fin puis `A`, écrire le texte.

## Conclusion

Voici la liste quasi-exhaustive de la petite partie de vim que j'utilise tous les jours. Il s'agit de simplement une trentaines de commandes. Mais c'est déjà très suffisant pour être très efficace dans l'édition de fichiers.

Voici une "cheat-sheet" :

- Insertions : `i`, `a`, `o`, `O`, `r`, `cw`
- Moves : `w`,`%`,`/<pattern>`, `*`, `#`
- Search &amp; Replace : `:%s/<pattern>/<replace>/gc` (more info, `:help :s`)
- Delete : `dd`
- Copy/Paste : `dd`, `p`, `P`.

