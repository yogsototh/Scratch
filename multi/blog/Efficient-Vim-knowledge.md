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
en: 4. Super powers
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

Dans un éditeur normal, il suffit de taper sur une touche du clavier et la lettre s'affiche à l'écran.
Pas ici.
Vim est en mode _edition_.
Commençon par placer vim en mode _insertion_.
Tapez sur la touche `i`.

Voilà, c'est magique. 
Vous pouvez tapez comme dans un éditeur standard.
Pour repasser en mode édition tapez sur la touche `Echap`.

Maintenant que vous savez passer du mode edition au mode insertion. Voici les commandes de survie (toutes en mode edition) :

> - `i` : Passer en mode insértion. Taper Echap pour repasser en mode edition.
> - `x` : Supprimer le caractère sous le curseur
> - `:wq` : Sauvegarder et quitter (`:w` sauvegarde, `:q` quitte)
> - `dd` : Supprimer la ligne courante (et la copier)
> - `p` : Coller
> - `hjkl` (optionnel) : se déplacer (<-&darr;&uarr;->). Souvenez vous `j` ressemble à une flèche vers le bas.

Seulement 5 commandes. Voilà, c'est tout pour un début. 
Essayez d'éditer vos fichier comme ça pendant une petite journée. 
Ça va être assez pénible, mais vous pouvez écrire, effacer, copier/coller et sauvegarder.
Lorsque ces commandes vous seront devenues naturelle. 
Vous pouvez passer à l'étape d'après. 
Pour se sentir à son aise avec vim. 
Disons autant qu'avec un éditeur standard.

en: ## 2nd Level - Feel comfortable
fr: ## 2ème Niveau - Se sentir à son aise

Vous connaissez les commandes de survie. Passons à des commandes pour être un peu plus à notre aise. Je vous suggère :

1. Les variantes de l'insertion
    > - `a` : comme `i`, mais après la position du curseur.
    > - `o` : comme `i`, mais à la ligne suivante
    > - `O` : comme `o` mais ajoute la ligne avant.
    > - `cw` : remplacer le mot sous le curseur.

2. Rechercher
    > - `/pattern` : rechercher `pattern` dans le fichier.

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

