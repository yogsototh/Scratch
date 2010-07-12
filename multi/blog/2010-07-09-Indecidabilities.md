-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-09T10:04:31+02:00
fr: title: Indécidabilités
en: title: Undecidabilities
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
en:   - mathematics
fr:   - mathématiques
  - science
  - philosophy
  - indecidability
-----

begindiv(intro)

en: <%= tldr %> The word undecidability can have different meaning. 
en: I give here some each science related.
en: 
en: - _Undecidability_: due to measure errors
en: - _Hope_: small measure error implies small calculus error.
en: - _But_: Undecidability with big error from small measure error
en: - _Hope_: error remain controllable given a final mesure error, retrive the maximal measure error authorized
en: - Also false hope: Undecidability width _discontinuities_
en: - _Hope_: Undecidability is due to error, but without any measure error, all is decidable
en: - Yet another false hope: Undecidability without any measure error
en: 
en: Is the situation so bad we cannot truly believe anything?
en: A theorem in learning theory (in my thesis) prove that under some reasonable conditions, we could learn many true things. 
en: But at no moment we can be absolutely sure this is _the_ truth.
en: But as far as I can see, we cannot do better than that.
fr: <%= tlal %> Le terme "indécidabilité" a été utilisé pour désigner différentes choses. 
fr: Je donnes quelques un de ces sens (orienté science) ici.
fr: Ainsi qu'un piste philosophique sur ce qu'on peut espérer de mieux.
fr: 
fr: 
fr: Est-ce le maximum

enddiv

# The Undecidabilities

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

Jusqu'ici, on a vu que toutes les activité humaines font faces à des problèmes indécidables.
Mais jusqu'ici, cette indécidabilité était due aux *erreurs*.
Mais on pourrait espérer que ça se fasse sans erreur.
Et bien non.
Même dans un monde mathématique complètement contrôlé.
On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

Théorème d'indécidabilité du problème de l'arrêt. La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

> Supposons qu'il existe un programme qui puisse dire si un autre programme s'arrête. Plus précisément :
> 
> Hypothèse: Il existe `P` tel que: 
>
> * `P(x,y)` réponde "s'arrête" en un temps fini si et seulement si `x(y)` s'arrête effectivement en temps fini et 
> * `P(x,y)` réponde "ne s'arrête pas" en un temps fini dans le cas contraire.
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
>
> * si `P(Q,Q)' répond "s'arrête" ça implique que `P(Q,Q)'="ne s'arrête pas"
> * si `P(Q,Q)' répond "ne s'arrête pas" ça implique que `P(Q,Q)'="s'arrête"
> 
> Il y a donc une contradiction que le seul moyen de régler est par la non existence du programme P.

Cette indécidabilité est vraiment la plus gênant de toute. Elle signifie que l'on peut créer un objet duquel on ne peut absolument pas prédire le comportement quelque soit mes possibilité de contrôler cet objet.

newcorps

# What best can we do?
