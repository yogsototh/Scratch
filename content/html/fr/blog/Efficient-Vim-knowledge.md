-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-08-18T00:28:20+02:00
title: Vim efficace avec peu d'efforts
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("uber_leet_use_vim.jpg","Über leet use vim!") %>

begindiv(intro)


<%= tlal %> Vous désirez apprendre vim (le meilleur editeur de texte connu à ce jour) le plus rapidement possible. Voici mes conseils pour vous aider.

enddiv

[Vim] ou l'éditeur qui vallait 3 milliards :

> Meilleur, plus fort, plus rapide.

Apprenez [vim] et ce sera votre dernier éditeur.
Aucun éditeur que je connaise ne le surpasse.
Sa prise en mais est difficile, mais payante.

Je vous conseille de l'apprendre en 4 étapes :

1. La survie
2. Se sentir à son aise
3. Se sentir meilleur, plus fort et plus rapide
4. Les super-pouvoirs

Après ces leçons, vous serez une super star de l'édition de texte.

[Vim]: http://www.vim.org
[vim]: http://www.vim.org



## 1er Niveau: survivre

0. Installez [vim]
1. Lancez vim
2. NE TOUCHEZ A RIEN! Lisez

Dans un éditeur normal, il suffit de taper sur une touche du clavier et la lettre s'affiche à l'écran.
Pas ici.
Vim est en mode _edition_.
Commençons par placer vim en mode _insertion_.
Tapez sur la touche `i`.

Voilà, c'est magique. 
Vous pouvez tapez comme dans un éditeur standard.
Pour repasser en mode édition tapez sur la touche `Echap`.

Maintenant que vous savez passer du mode edition au mode insertion. Voici les commandes de survie (toutes en mode edition) :

> - `i` : Passer en mode insértion. Taper Echap pour repasser en mode edition.
> - `x` : Supprimer le caractère sous le curseur
> - `:wq` : Sauvegarder et quitter (`:w` sauvegarde, `:q` quitter)
> - `dd` : Supprimer (et copier) la ligne courante
> - `p` : Coller
> - `hjkl` (optionnel) : se déplacer (<-&darr;&uarr;->). Souvenez vous `j` ressemble à une flèche vers le bas.

Seulement 5 commandes. Voilà, c'est tout pour un début. 
Essayez d'éditer vos fichier comme ça pendant une petite journée. 
Lorsque ces commandes vous seront devenues naturelle. 
Vous pouvez passer à l'étape d'après. 

## 2ème Niveau - Se sentir à son aise

Vous connaissez les commandes de survie. Passons à des commandes pour être un peu plus à notre aise. Je vous suggère :

1. Les variantes de l'insertion

    > - `a`     -> comme `i`, mais après la position du curseur.
    > - `o`     -> comme `i`, mais à la ligne suivante
    > - `O`     -> comme `o` mais ajoute la ligne avant.
    > - `cw`    -> remplacer le mot sous le curseur.

2. Déplacements basiques

    > - `0`         -> aller à la première colonne
    > - `^`         -> aller au premier caratère de la ligne
    > - `$`         -> aller à la fin de la ligne
    > - `/pattern`  -> rechercher `pattern` dans le fichier.

3. Copier/Coller

    > - `P`  -> Coller avant, souvenez-vous que `p` collait après la position du curseur.
    > - `yy` -> copier la ligne courante. C'est plus simple et équivalent à `ddP`

4. Annuler/Refaire

> - `u` -> Annuler (undo)
> - `C-r` -> Refaire

## Niveau 3 - Meilleur. Plus fort. Plus rapide.

Bravo ! Si vous êtes arrivé jusqu'ici nous allons pouvoir commencer à apprendre les choses vraiment intéressantes.
Pour cette section, je vais seulement parler de choses qui sont aussi disponible dans le vieux vi. 

Commençons par le premier super pouvoir de vi, éviter les répétitions (niveau 1):

1. `.` -> Le caractère point répètera la dernière commande.
2. N&lt;commande&gt; -> répètera la commande N fois. 

Quelques exemples, ouvrez un fichier avec vim et tapez :

> - `2dd` -> Supprimera 2 lignes
> - `3p` -> copiera 3 fois d'affiler le texte copié
> - `100idesu [ESC]` -> écrira "desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu "
> - `.` -> Juste après la dernière commande  réécrira les 100 "desu ". 
> - `3.` -> Écrira 3 "desu" et non pas 300.

Second super pouvoir de vim, les déplacements (niveau 1) :
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

## Niveau 4 - Power Overwhelming

Avec toutes les commandes précédentes vous avez presque toutes les commandes que j'utilise tous les jours. 
Mais voici les killer features de vim. 
Celles que je n'ai retrouvé que dans vim (ou presque).

Déplacement sur la ligne : `0^$fFtT,;`

> - `0` -> aller à la colonne 0,
> - `^` -> aller au premier caractère de la ligne
> - `$` -> aller au dernier caractère de la ligne
> - `fa` -> vous amène à la prochaine occurrence de a sur la ligne courante. `,` (resp. `;`) recherche l'occurrence suivante (resp. précédente).
> - `t,` -> vous amène juste après le `,`.
> - `3fa` -> recherche la 3ième occurrence de `a`.
> - `F` et `T` -> comme `f` et `t` mais en arrière.

_Quelques trucs utiles_
>
> - `dt"` -> supprime tout jusqu'au `"`.
> - `vi"` -> selectionne tout ce qui se trouve entre les deux `"`.

Sélection de blocs rectangulaires : `C-V`.
s

Les blocs rectangulaires sont très commodes pour commenter plusieurs lignes de codes.
Typiquement: `^C-VC-dI// [ESC]`

- `^` -> aller en début de ligne
- `C-V` -> Commencer la sélection du bloc
- `C-d` -> se déplacer vers le bas (pourrait être `jjj` ou `%` etc...)
- `I// [ESC]` -> écrit `// ` pour commenter le reste de la ligne.

<%= blogimage("rectangular-blocks.gif","Rectangular blocks") %>

Complétion : `C-n` et `C-p`.

En mode insertion, commencez à écrire le début d'un mot déjà présent dans l'un des buffers (fichers) ouvert et tapes `C-p`. Magique.
<%= blogimage("completion.gif","Completion") %> en: Macros : `qa` do something `q`, then `@a` (also `@@`, repeat the last `@x`).
Macros : `qa` faire quelque chose `q`. `@a`, puis `@@`.

`qa` enregistre tout ce que vous faite et enregistre le tout dans le _registre_ `a`. Ensuite `@a` va rejouer la macro enregistrée dans le registre `a` comme si c'est vous qui tapiez au clavier.

> Exemple :
> Sur une ligne contenant seulement un 1 tapez :
> `qaYpC-aq` -> `qa` début de l'enregistrement. `Yp` copier cette ligne. `C-a` incrémente le nombre. `q` arrête d'enregistrer.
> 
> `@a` -> écrit un 2 sous le 1.
> `@@` -> écrit un 3 sous le 2.
> Écrivez `100@a`. Cela va créer une liste de nombre croissants.

<%= blogimage("macros.gif","Macros") %>

Mais aussi,

Sélection visuelle.

On a déjà vu un exemple avec `C-V`. 
Mais il y a aussi, `v` et `V`.
Et une fois la sélection visuelle faite vous pouvez par exemple:

- `J` -> joindre toutes les lignes pour en faire une seule
- `<` (resp. `>`) -> indenter à gauche (resp. à droite).
- `=` -> auto indenter

<%= blogimage("autoindent.gif","Autoindent") %>

Ajouter quelque chose à la fin de toutes les lignes sélectionnées visuellement : 

- `S-V` 
- aller jusqu'à la ligne désirée (`jjj` ou `C-d` ou `/pattern` ou `%` etc...)
- `$` aller à la fin 
- `A`, écrire le texte, `Echap`.

<%= blogimage("append-to-many-lines.gif","Ajouter à la fin de plusieurs lignes") %>

Splits : `:split` et `vsplit`. Je vous conseille de faire un `:help split`. Celà permet de manipuler plusieurs buffer sur la même fenêtre.
Voici les commandes principales :

> - `:split` -> crée un split (`:vsplit` crée un split vertical)
> - `C-w&lt;dir&gt;` : où dir est l'un de `hjkl` ou <-&darr;&uarr;-> permet de changer de split.
> - `C-w_` (resp. `C-w|`) : Maximise la taille du split (resp. split vertical)
> - `C-w+` (resp. `C-w-`) : Agrandi (resp. diminue) le split

<%= blogimage("split.gif","Split") %>

## Conclusion

Voilà, je vous ai donné 90% des commandes que j'utilise tous les jours.
N'essayez pas de tout apprendre en une journée. 
Il faut le temps de s'habituer à chaque nouvelle commande. 
Ajouter une ou deux commande par jour tous les jours est un bon exercice.
Dans 1 mois vous en connaitrez au moins autant que moi.
Vous apprendrez à utiliser NERDTree, les folds et tout un tas d'autres choses.
Souvenez-vous que je ne suis pas un "vim master", seulement un utilisateur régulier.


<script>
// Style the keywords
$(document).ready(function() {
    $('code').css({ 'border': 'solid 1px #CCC', 'padding':'3px'});
});
</script>
