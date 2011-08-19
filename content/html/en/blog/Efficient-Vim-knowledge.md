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

I suggest you to learn it in 5 steps:

1. Survive
2. Start to feel comfortable
3. Feel Better, Stronger, Faster
4. Super powers

[Vim]: http://www.vim.org
[vim]: http://www.vim.org

## 1st Level: Survive
## 1er Niveau: survivre


Lorsque vous lancez vim pour la première fois, cela peut sembler très déconcertant. Il y a plusieurs modes dans vim. Un mode d'insertion qui correspond au mode normal dans la plupart des autres éditeurs et un mode d'édition ou le fait d'appuyer sur une touche va lancer des fonctions et ne rien écrire du tout.
Evidemment vous commencez dans le mode édition totalement contre intuitif.


1. Installez vim (normallement votre système d'exploitation doit l'avoir).
2. Lancez vim.
3. NE TOUCHEZ A RIEN! Lisez

Dans un éditeur normal, il suffit de taper sur une touche du clavier et la lettre s'affiche à l'écran.
Pas ici.
Vim est en mode _edition_.
Commençon par placer vim en mode _insertion_.
Tapez sur la touche `i`.

Voilà, c'est magique. 
Vous pouvez tapez comme dans un éditeur standard.
Mais attention, il y a une touche interdite ; Echap.

Si vous tapez sur Echap, vim repasse en mode _edition_.

Maintenant que vous savez passer du mode edition au mode insertion. Voici les commandes de survie (toutes en mode edition) :

- `i` : Passer en mode insértion. Taper Echap pour repasser en mode edition.
- `x` : Supprimer le caractère sous le curseur
- `dd` : Supprimer la ligne courante (et la copier)
- `p` : Coller
- `:wq` : Sauvegarder et quitter
- `hjkl` (optionnel) : se déplacer (<-&darr;&uarr;->). Souvenez vous `j` ressemble à une flèche vers le bas.

## Niveau 2 - Débutant

Vous connaissez les commandes de survie. Passons à des commandes pour être un peu plus à notre aise. Je vous suggère :

- `a` : comme `i`, mais après la position du curseur.
- `o` : comme `i`, mais à la ligne suivante
- `O` : comme `o` mais ajoute la ligne avant.
- `/pattern` : rechercher `pattern` dans le fichier.

## Niveau 3 - Débutant supérieur

Vous savez utiliser `i`, `a`, `o` et `O`. Mais vous n'êtes toujours pas à l'aise. Vous avez lancé vimtutor plusieurs fois. Il est temps de gagner un peu de vitesse.
Voici les nouvelles commandes à apprendre. Une par jour sera déjà bien.

1. `gg`  -> Aller en début de page
2. N`g` -> Aller à la ligne N

`cw` : remplacer le mot sous le curseur
`dw` : supprimer le mot sous le curseur
`%` : Aller à la parenthèse opposée.

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

