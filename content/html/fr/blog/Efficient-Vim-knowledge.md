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

    > - `a` : comme `i`, mais après la position du curseur.
    > - `o` : comme `i`, mais à la ligne suivante
    > - `O` : comme `o` mais ajoute la ligne avant.
    > - `cw` : remplacer le mot sous le curseur.

2. Déplacements basiques

    > - `0` : aller à la première colonne
    > - `^` : aller au premier caratère de la ligne
    > - `$` : aller à la fin de la ligne
    > - `/pattern` : rechercher `pattern` dans le fichier.

3. Copier/Coller

    > - `P` : Coller avant, souvenez-vous que `p` collait après la position du curseur.
    > - `yy` : copier la ligne courante. C'est plus simple et équivalent à `ddP`

## Niveau 3 - Meilleur. Plus fort. Plus rapide.

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

