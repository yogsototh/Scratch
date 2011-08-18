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
<%= blogimage("main.png","Title image") %>

begindiv(intro)

en: <%= tldr %> Vim is the best editor I know. But lets face it. It feels very hard to learn and master. I'm here to help you start.

fr: <%= tlal %> Vim est le meilleur éditeur que je connaisse. Mais la première fois qu'on s'y confronte il n'est pas moins que difficile d'accès. Mais je suis là pour vous aider. 

enddiv


Tout d'abord: oui, ça ne va pas être super facile comme avec notepad ou un éditeur de texte classique. Mais croyez-moi, le temps que vous passerez à apprendre Vim sera gagné au centuple. Si vous suivez mes conseils vous devriez passer par les étapes suivantes:

1. Au secour ! C'est quoi ce truc ?
2. Ok, je crois que j'ai compris, mais c'est super inefficace !
3. D'accord, je vois, on peut faire quelques trucs, mais, je préfère toujours notepad
4. Ah oui... Je vois que c'est pas mal.
5. Incroyable ! Plus jamais un autre éditeur.

Avant de commencer, je vous conseille de ne pas essayer de brûler les étapes. Si vous arrivez à faire 1 niveau par jour, ce sera déjà exceptionnel. L'idée c'est d'utiliser la liste des commandes que je vous propose jusqu'à ce que ça devienne naturel.
Une fois que c'est le cas, passez au niveau suivant.

## Niveau 1 - Au secour !

Vous n'avez jamais utilisé vi ou vim (ou presque).

Lancez ` vimtutor` et recommencez plusieurs fois jusqu'à ce que le tutoriel ne vous semble plus trop difficile.

Dans le tutoriel, il vous est conseillé de ne pas utiliser les flèches de votre clavier et de les remplacer par les touches: `hjkl`.
Certe au début vous n'êtes pas obligé de vous rajouter cette contrainte. 
Mais si vous aimez vos poignets et que vous aimez gagner du temps, dites-vous que vous devrez vous y mettre dès que possible.

Normallement vous connaissez les commandes suivantes, suffisante pour survivre dans Vim:

- `i` : insérer du texte
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

