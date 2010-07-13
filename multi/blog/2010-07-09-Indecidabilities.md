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
fr: 
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

newcorps

en: # The Undecidabilities
fr: # Les indécidabilités

Si le monde a été fabriqué par un Démiurge, on peut dire que celui-ci devait avoir le sens de l'humour. 
Et le récit que je vais faire va vous en fournir la preuve.
Pour avoir une idée de ce qu'est l'indécidabilité qui nous touche tous, prenons un exemple.
J'écris ce texte et j'ai donc tout pouvoir créatif sur celui-ci.  
Alors tant qu'a avoir du pouvoir autant l'utiliser pour faire les choses en grand.

Tout d'abord, *je crée un Univers* semblable au notre sauf qu'il n'est pas réel, mais simplement une représentation, une vue de l'esprit. Ce monde est peuplé d'êtres intelligents.

Comme je suis un Dieu sympa, je le fabrique avec quelques règles très simples. 
Un monde où les _vrai_ règles sont les règles mathématiques.
Bien entendu les habitant de ce monde se posent des questions.
En particulier, ils se demandent quelles sont les lois qui régissent leur monde. 
Ils pensent que connaître toutes ces règles leur permettrait de connaître l'avenir. Leur naïveté est touchante. Ah, si seulement ils savaient.
Mais je suis là pour les aider à apprendre.

Comme je suis un Dieu un peu facétieux, je vais leur jouer quelques tours.
Le premier est de leur donner des sens imparfaits. 
De plus il leur est impossible d'avoir des mesures parfaites.
Bien entendu, je ne suis pas trop dur, et je leur laisse toutes libertés pour améliorer leur technologie et diminuer ces erreurs de mesures.

Il n'empêche qu'ils vont vite déchanter ces être que je commence à trouver un peu présomptueux de vouloir se mesurer à mon infinie sagesse (du moins concernant le monde dans lequel ils vivent).

Alors commençons par la première leçon, _les erreurs causent de l'indécidabilité_.

en: ## Undecidability due to measure errors
fr: ## Indécidabilité dues aux erreurs de mesures

fr: Je leur présente des tas de triangles.
fr: Assez vite ils font plein de mesures et trouve que la somme des angles des triangles est toujours très proche de 180° (ou π radians).
fr: Mais comment certifier que c'est la formule exacte ?
fr: Certain d'entre eux commencent à formaliser un petit peu le problème
fr: et ils finissent par démontrer que la somme fais toujours 180°.
fr: Magnifique !
fr: Seulement la preuve s'appuie sur des axiomes non démontrables parce que soumis aux mêmes règles d'imperfections de l'observation.
fr: Ils auront beau faire des mesures de plus en plus précises qui viendront toujours conforter leur formule.
fr: Ils n'auront que l'_espoir_ et  _jamais_ la certitude d'avoir la bonne.

fr: Pour prouver que même les très grand triangles obéissent à cette loi,
fr: ils partent en expédition, avec trois bateaux.
fr: Un va très au nord, pendant que l'un va vers l'est et l'autre vers l'ouest.
fr: Ils naviguent tous à la même vitesse et pendant la même durée.
fr: 
fr: D'après leur calcul, les deux bateaux du sud doivent tourner avec un angle de 45° (respectivement -45°) pour rejoindre le bateau du nord.
fr: Après de longues semaines de navigation, les deux bateaux du sud se rejoignent. Mais, il n'y a pas de trace du bateaux nordique.
fr: Que se passe-t-il ? Bien entendu, leur Dieu facétieux leur fait faire des mesures imparfaites et donc ils ne sont pas allé exactement à la même vitesse, ils n'ont pas tourné exactement en même temps, ni d'un angle valant exactement 45°.
fr: Sauf que leur ingénieurs en sont sûr l'erreur ne devait être que de quelques centaines de mètres. 
fr: Alors que là, l'erreur semble vraiment très grande.


fr: Et oui ! Comme je suis un Dieu terriblement farceur, je me suis débrouillé pour que leur Univers ne soit pas plat (comme l'imaginais leur théoricien).
fr: Mais presque plat. Disons que je les fais vivre sur une sphère qui a un rayon de courbure d'environ 6000km (ça ne vous rappelle rien ?).
fr: Ah ah ah ! Cette blague je la trouve bien bonne. 
fr: De toute évidence, certains ne goûtent pas mon sens de l'humour et certains d'entre eux se font brûler parce qu'il ont trouver la solution. 
fr: Apparemment il y a de mauvais perdant chez ces êtres là.
fr: Et oui sur une sphere on peut très bien dessiner des triangles dont la somme des angles fait 270° au lieu des 180° attendu dans un Univers plat.
fr: Disons que pour tous les triangle moins grand que quelques kilomètres, l'erreur est minime.

fr: Après cette découverte, les questions hantent certains personnage.
fr: On ne peut vraiment être sûr de rien alors ?
fr: Mais certains ont un fol espoir.

fr: Si on fait de très petites erreurs de mesures, on pourra quand même en retirer des prédictions précises.

fr: ## Indécidabilité avec erreurs croissantes

fr: C'est bien espéré, mais malheureusement il existe un problème très ennuyeux qui ne possède pas cette jolie propriété.
fr: Il s'agit du _problème des 3 corps_. 
fr: Prenons les formules de la gravitation Universelle et appliquons la à deux corps celeste. Si on connait la position des deux corps celeste avec un grande précision, on pourra connaître la position future de ces corps aussi avec une grande précision.
fr: Maintenant rajoutons un corps (par exemple, Soleil + Terre + Lune).
fr: L'erreur de mesure initiale va s'amplifier de plus en plus jusqu'à rendre toute prédiction impossible.
fr: 
fr: Là encore un espoir est permis.
fr: Pour une erreur à l'arrivée donnée on peut trouver l'erreur de depart maximale autorisée. 
fr: On sait que l'on pourra prévoir quelques temps en avance, mais pas autant qu'on le voudrait.
fr: Par exemple, si on souhaite une precision à 1km dans 3 mois, il faut une précision des mesures de 300m aujourd'hui.

fr: Sauf que là aussi, ce n'est pas aussi simple.

fr: ## Indécidabilité avec erreurs discontinues

fr: Considération la question suivante. Etant donné les coordonnées GPS d'un point à la surface de la Terre proche des cotes bretonnes (avec une certaine imprecision comme toujours). Est-ce que si je pose mon doigt au lieu de ces coordonnées GPS, celui-ci va toucher la mer ou la Terre ?
fr: Et bien, il est impossible de le savoir, même si je réduis l'erreur à une valeur infinitésimale. Simplement parce que si je prends ce qu'il y a autour de mon point, il y aura toujours des zones avec et sans eau.

fr: Fractales et Mandelbrot. 
fr: Position à 1cm près sur une cote de Bretagne.
fr: Si une erreur très faible de mesure, impossible de savoir si on est dans l'eau ou pas.
fr: On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur. (Imaginer R\Q)

fr: Mais qu'entends-je ? Un petit malin essaye de trouver la vérité en s'extrayant de mon Monde ?
fr: > Jusqu'ici, faire des prédiction à partir des données observées semble être une quête vouée à l'échec. Mais je suis persuadé que l'on peut aller au delà.
fr: > Au diable ce Dieu qui nous embête, et qui nous empêche de mesurer avec précision !
fr: > Inventons notre propre Univers mathématique avec des axiomes connus, clairs et précis. Un monde qui se suffit à lui-même, un monde _self-contained_.
fr: > Un monde dans lequel il n'y aura plus d'erreur de mesure. 
fr: > Un monde entièrement contrôlé par des règles claires et précises.
fr: > Un monde où tout pourra être prédis.


fr: Et mais attends mon petit gars, tu ne crois pas que ça va se passer comme ça.
fr: Je te ferai remarquer, que s'il y a certaines choses que même moi, le Démiurge de ton Univers, je ne puis décider. Il est absolument hors de question que tu le puisses aussi.
fr: Et tien rien que pour t'embêter, je vous mets sur la voix d'un problème indécidable très, mais alors vraiment très embêtant.

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

