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

fr: Problème: Démontrer que le théorème de Pythagore est vrai
en: Problem: Prove the Pythagoras Theorem is true

fr: Tout d'abord, ne nous plaçons pas dans notre Univers réel, mais
fr: plutôt dans un Univers imaginaire que je fabrique. Youpi! 
fr: Je suis le Dieu tout puissant, hahaha !!!!
fr: Bon, je me calme...
fr: Donc je crée l'Univers avec les axiomes mathématiques de nos mathématiques.
fr: Et je fais habiter ce monde à des êtres imaginaire.
fr: Sauf que comme je suis un Dieu bon je leur donne des sens qui leur permette
fr: d'observer le monde.  Mais comme je suis aussi un Dieu facétieux, 
fr: je rend leur possibilités d'observations imparfaites.
fr: Je leur interdit d'avoir des mesures exactes.
fr: En y réfléchissant la position de ces être est très proche de la notre.
fr: Un Univers existe, mais nous ne pouvons pas être certain de nos observations.

fr: Je leur présente des tas de triangles rectangles.
fr: Assez vite ils trouvent la bonne formule: $h^2=a^2 + b^2$
fr: Mais comment certifier que c'est la formule exacte ?
fr: Ils peuvent essayer de démontrer que c'est vrai comme nous.
fr: Mais la preuve s'appuie sur des axiomes non démontrables parce que soumis aux mêmes règles d'imperfections de l'observation.
fr: On peut placer le théorème de Pythagore au niveau des axiomes de l'Univers que je leur donne.
fr: En effet on peut remplacer certains Axiomes par des théorèmes qui en découlent.
fr: Ils auront beau faire des mesures de plus en plus précises qui viendront toujours conforter leur formule.
fr: Ils n'auront que l'_espoir_ et  _jamais_ la certitude d'avoir la bonne.
fr: À la fin de l'article nous reprendrons cet exemple de façon plus formelle.

fr: Imaginons que je sois _vraiment_ un Dieu terriblement farceur. 
fr: Je me débrouille pour que leur Univers ne soit pas plat. 
fr: Mais presque plat. 
fr: La formule réelle que je choisis pouvant être $h^2=a^2+b^2$ à
fr: $h^(2+\varepsilon)=a^2+b^2$ où $\varepsilon$ est vraiment une valeur minuscule.

fr: On peut quand même espérer quelque chose :

fr: De petites erreurs de mesures devraient nous assurer d'avoir de petites erreurs sur les formules prédictives.
fr: Si je trace un triangle rectangle alors les mesures que j'en ferai rendront compte de ma loi.

fr: Cotés de longueur 3 et 4 et on prévoit 5 pour l'hypoténuse et on ne tombera pas loin.
fr: Cependant cet espoir est vain.

fr: ## Indécidabilité avec erreurs croissantes

fr: Problème des 3 corps. 
fr: Une petite erreur de départ va provoquer de grandes erreurs à l'arrivée.
fr: Mais pour une erreur à l'arrivée donnée on peut trouver l'erreur de depart minimale. 
fr: Exemple: Si on veut une precision à 10m dans 3 mois, il faut une précision des mesures de 1m aujourd'hui.

fr: ## Indécidabilité avec erreurs discontinues

fr: Fractales et Mandelbrot. 
fr: Position à 1cm près sur une cote de Bretagne.
fr: Si une erreur très faible de mesure, impossible de savoir si on est dans l'eau ou pas.
fr: On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur. (Imaginer R\Q)

fr: ## Indécidabilité sans erreur

fr: Jusqu'ici, on a vu que toutes les activité humaines font faces à des problèmes indécidables.
fr: Mais jusqu'ici, cette indécidabilité était due aux *erreurs*.
fr: Mais on pourrait espérer que ça se fasse sans erreur.
fr: Et bien non.
fr: Même dans un monde mathématique complètement contrôlé.
fr: On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

fr: Théorème d'indécidabilité du problème de l'arrêt. La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

fr: > Supposons qu'il existe un programme qui puisse dire si un autre programme s'arrête. Plus précisément :
fr: > 
fr: > Hypothèse: Il existe `P` tel que: 
fr: >
fr: > * `P(x,y)` réponde "s'arrête" en un temps fini si et seulement si `x(y)` s'arrête effectivement en temps fini et 
fr: > * `P(x,y)` réponde "ne s'arrête pas" en un temps fini dans le cas contraire.
fr: >
fr: > Remarque: Tout code de programme est une chaîne de caractère qui peut être utilisée aussi comme entrée d'un autre programme. 
fr: Ainsi écrire `P(x,x)` est autorisé.
fr: > 
fr: > Soit le programme Q que j'écris comme suit :
fr: > <pre class="twilight">
fr: > Q(x) :
fr: >     si P(x,x)="s'arrête" alors je fais une boucle infinie.
fr: >     si P(x,x)="ne s'arrête pas" alors je m'arrête.
fr: > </pre>
fr: > 
fr: > Maintenant que répond `P(Q,Q)'?
fr: >
fr: > * si `P(Q,Q)' répond "s'arrête" ça implique que `P(Q,Q)'="ne s'arrête pas"
fr: > * si `P(Q,Q)' répond "ne s'arrête pas" ça implique que `P(Q,Q)'="s'arrête"
fr: > 
fr: > Il y a donc une contradiction que le seul moyen de régler est par la non existence du programme P.

fr: Cette indécidabilité est vraiment la plus gênant de toute. Elle signifie que l'on peut créer un objet duquel on ne peut absolument pas prédire le comportement quelque soit mes possibilité de contrôler cet objet.

fr: newcorps

fr: # What best can we do?

fr: Expérience monde mathématique et théorème de Pythagore.
fr: Utilisation des fractions rationnelles pour retrouver la formule exacte.
fr: Problème, on sait qu'on converge mais on ne sait pas quand.

