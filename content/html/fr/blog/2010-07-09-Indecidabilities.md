-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-09T10:04:31+02:00
title: Indécidabilités
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - math
  - science
  - philosophy
  - indecidability
-----
begindiv(intro)
<%= tlal %> Le terme "indécidabilité" a été utilisé par

- _Undecidability_: due to measure errors
- _Hope_: small measure error implies small calculus error.
- But: _Undecidability_ with big error from small measure error
- _Hope_: error remain controllable given a final mesure error, retrive the maximal measure error authorized
- Also false hope: _Undecidability_ width discontinuities
- Hope: _Undecidability_ is due to error, but without any measure error, all is decidable
- Yet another false hope: _Undecidability_ without any measure error

enddiv

## Indécidabilité dues aux erreurs de mesures

expérience monde mathématique et théorème de pythagore.
Utilisation des fractions rationnelles pour retrouver la formule exacte.
Problème, on sait qu'on converge mais on ne sait pas quand.

## Indécidabilité avec erreurs croissantes

Problème des 3 corps. Une petite erreur de départ va provoquer de grandes erreurs à l'arrivée.
Mais pour une erreur à l'arrivée donnée on peut trouver l'erreur de depart minimale. Exemple: Si on veut une precision à 10m dans 3 mois, il faut une précision des mesures de 1m aujourd'hui.

## Indécidabilité avec erreurs discontinues

Fractales et Mandelbrot. 
Position à 1cm près sur une cote de Bretagne.
Si une erreur très faible de mesure, impossible de savoir si on est dans l'eau ou pas.
    On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur. (Imaginer R\Q)

## Indécidabilité sans erreur

Jusqu'ici, on a vu que toutes les activité humaines font faces à des problèmes indécidables. Mais jusqu'ici, cette indécidabilité était due aux *erreurs*. Mais on pourrait espérer que ça se fasse sans erreur.
Et bien non. Même dans un monde mathématique complètement contrôlé. On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

Théorème d'indécidabilité du problème de l'arrêt. La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

> Supposons qu'il existe un programme qui puisse dire si un autre programme s'arrête. Plus précisément :
> 
>Hypothèse: Il existe `P` tel que: 
>
>* - `P(x,y)` réponde "s'arrête" en un temps fini si et seulement si `x(y)` s'arrête effectivement en temps fini et 
>* - `P(x,y)` réponde "ne s'arrête pas" en un temps fini dans le cas contraire.
>
> Remarque: Tout code de programme est une chaîne de caractère qui peut être utilisée aussi comme entrée d'un autre programme. 
Ainsi écrire `P(x,x)` est autorisé.
> 
> Soit le programme Q que j'écris comme suit :
> <pre class="twilight">
> Q(x) :
>     si P(x,x)="s'arrête" alors je fais une boucle infinie.
>     si P(x,x)="ne s'arrête pas" alors je m'arrête.
> </pre>
> 
> Maintenant que répond `P(Q,Q)'?
> si `P(Q,Q)' répond "s'arrête" ça implique que `P(Q,Q)'="ne s'arrête pas"
> si `P(Q,Q)' répond "ne s'arrête pas" ça implique que `P(Q,Q)'="s'arrête"
> 
> Il y a donc une contradiction que le seul moyen de régler est par la non existence du programme P.

Cette indécidabilité est vraiment la plus gênant de toute. Elle signifie que l'on peut créer un objet duquel on ne peut absolument pas prédire le comportement quelque soit mes possibilité de contrôler cet objet.
