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

en: <%= tldr %> Four different _undecidabilities_:
en: 
en: - _Undecidability_ due to measure errors 
en: - _Hope_: small measure error implies small predictive errors.
en: - _Undecidability_ with big error from small measure error
en: - _Hope_: error remain controllable given a final mesure error
en: - _Undecidability_ with _discontinuities_
en: - _Hope_: Undecidability is due to error, but without any measure error, all is decidable
en: - _Undecidability_ without any measure error
en: 
en: Is the situation so bad we cannot truly believe anything?
en: A theorem in learning theory (in my thesis) prove that under some reasonable conditions, we could learn many true things. 
en: But at no moment we can be absolutely sure this is _the_ truth.
en: But as far as I can see, we cannot do better than that.
fr: <%= tlal %> Cinq indécidabilités différentes :
fr: - Indécidabilité due aux erreurs de mesures ;
fr: - Espoir : de petites erreurs de mesures impliquent de petites erreurs prédictives ;
fr: - Indécidabilités avec de petites erreurs de mesures ;
fr: - Espoir : l'erreur est contrôlable, i.e. on peut trouver l'erreur maximale de mesure à partir de l'erreur maximale que l'on peut se permettre ;
fr: - Indécidabilités avec discontinuités ;
fr: - Espoir : l'indécidabilité est due aux erreurs de mesure. Sans erreur on peut tout prévoir ;
fr: - Indécidabilité sans erreur de mesure
fr: 
fr: Est-ce que la situation est perdue ?
fr: Un théorème d'apprentissage automatique (qui est dans ma thèse) démontre que sous certaines circonstances raisonnables, on peut découvrir la vérité. 
fr: Par contre il est impossible d'être sûr que nous l'ayons atteinte.
fr: Je ne pense pas que l'on puisse faire mieux.


enddiv

en: # The Undecidabilities
fr: # Les indécidabilités

en: ## Undecidability due to measure errors
fr: ## Indécidabilité dues aux erreurs de mesures

Problème: trouver la formule de la taille de l'hypoténuse en fonction
de la longueur des deux autres cotés.

Supposons que nous soyons dans _notre_ système mathématique.
Et que des habitants y habitent.
Ils ont a disposition des tas de triangles.
Mais ils font des erreurs de mesure à chaque fois.
Comment certifier la formule exacte alors ?
Ils peuvent essayer de démontrer que c'est vrai comme nous.
Mais la preuve s'appuie sur des axiomes non démontrés.
Supposons que la célèbre formule de Pythagore soit un des axiomes de leur systèmes mathématique.
Ils auront beau faire des mesures de plus en plus précises qui viendront toujours conforter leur formule.
Ils n'auront _jamais_ la certitude d'avoir la bonne.

Les habitants de ce monde ne peuvent qu'espérer (comme nous)
que leur représentation des triangles qui sont proche de leur mesure est vraie. 
Mais il leur est impossible de savoir quel leur formule est exacte.

À la fin de l'article nous reprendrons cet exemple de façon plus formelle.

On peut quand même espérer quelque chose :

De petites erreurs de mesures devraient nous assurer d'avoir de petites erreurs sur les formules prédictives.
Si je trace un triangle rectangle alors les mesures que j'en ferai rendront compte de ma loi.

Cotés de longueur 3 et 4 et on prévoit 5 pour l'hypoténuse et on ne tombera pas loin.
Cependant cet espoir est vain.

## Indécidabilité avec erreurs croissantes

Problème des 3 corps. 
Une petite erreur de départ va provoquer de grandes erreurs à l'arrivée.
Mais pour une erreur à l'arrivée donnée on peut trouver l'erreur de depart minimale. 
Exemple: Si on veut une precision à 10m dans 3 mois, il faut une précision des mesures de 1m aujourd'hui.

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

Expérience monde mathématique et théorème de Pythagore.
Utilisation des fractions rationnelles pour retrouver la formule exacte.
Problème, on sait qu'on converge mais on ne sait pas quand.

