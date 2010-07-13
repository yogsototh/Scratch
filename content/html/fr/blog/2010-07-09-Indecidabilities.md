-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-09T10:04:31+02:00
title: Indécidabilités
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - mathématiques
  - science
  - philosophy
  - indecidability
-----

begindiv(intro)

<%= tlal %> Différentes indécidabilités :

- Indécidabilité due aux erreurs de mesures ;
- Espoir : de petites erreurs de mesures impliquent de petites erreurs prédictives ;
- Indécidabilités avec de petites erreurs de mesures ;
- Espoir : l'erreur est contrôlable, i.e. on peut trouver l'erreur maximale de mesure à partir de l'erreur maximale que l'on peut se permettre ;
- Indécidabilités avec discontinuités ;
- Espoir : l'indécidabilité est due aux erreurs de mesure. Sans erreur on peut tout prévoir ;
- Indécidabilité sans erreur de mesure.

Est-ce que la situation est perdue ?
Un théorème d'apprentissage automatique (qui est dans ma thèse) démontre que sous certaines circonstances raisonnables, on peut découvrir la vérité. 
Par contre il est impossible d'être sûr que nous l'ayons atteinte.
Je ne pense pas que l'on puisse faire mieux.


enddiv

newcorps

# Les indécidabilités

begindiv(intro)

Si le monde a été fabriqué par un Démiurge, on peut dire que celui-ci devait avoir le sens de l'humour. 
Et le récit que je vais faire va vous en fournir la preuve.
Je vais me mettre à sa place. 
Je vais créer un monde simplifié.
Un monde régi par des règles mathématiques très simples.
Puis je vais vous parler du mal qui touche cet Univers semblable au notre.
L'*indécidabilité*. 
L'incapacité de savoir si nous avons trouvé la vérité, ou seulement une approximation de celle-ci.
L'incapacité de prédire certaines choses qui semblent pourtant aller de soi.
Voilà comment tout aurait pu commencer.

enddiv

<%= leftblogimage("genese.png") %>

Au début, il n'y avait rien. 
Puis un article de blog commença à prendre forme.
J'inspire profondément pour sentir la pesanteur de ce que je vais accomplir.
Attention, une dernier moment de tension et je crée l'_Univers_.
Un *Univers* qui n'existera que le temps de la lecture de cet article.

Me voici le _Démiurge_ de cet Univers et te voilà son observateur privilégié.

Comme j'aime bien tout contrôler, je fabrique ce monde avec quelques règles simples.
Je décide que les _vrais_ règles de ce monde sont celles que nous pensons qui régissent notre monde.
Notez qu'il y a une grande différence. 
Pour leur monde, ce que l'on _croit_ vrai aujourd'hui, est vraiment vrai pour eux.
Leur monde est donc plus _simple_ à priori que le notre. 
En particulier, on peut le décrire avec des axiomes et des règles mathématiques.
Alors qu'il est possible que ce ne soit pas le cas de notre Univers. 
Mais nous reviendront là-dessus plus tard.

Bon au travail maintenant, je crée une *Terre*.
J'y ajoute des habitants intelligents.
Bien entendu ils se posent des questions.
En particulier, ils se demandent quelles sont les lois qui régissent leur monde. 
Ils pensent que connaître toutes ces règles leur permettrait de connaître l'avenir. 
Leur naïveté est touchante. 
Ah, si seulement ils savaient.
Mais je suis là pour les aider à apprendre.

Comme je suis un Dieu un peu facétieux, je vais leur jouer quelques tours.
Sinon on s'ennuierai à mourir.
Le premier est de leur donner des sens imparfaits. 
De plus il leur est impossible d'avoir des mesures parfaites.
Je leur laisse cependant toutes libertés pour améliorer leur technologie et diminuer ces erreurs de mesures.

Les habitants n'ont pas eu notre évolution historique.
En particulier, il pensent que le monde est plat avec ou sans bord (ça dépend) et le ciel repose dessus.
Une vision proche de celle de nos ancêtres.
Certains d'entre eux pensent qu'il est possible de découvrir les règles du monde que j'ai créé.
Et bien que le jeu commence.
Le but des habitants est de retrouver les règles de mon monde.
Et moi, je vais les aider à découvrir qu'ils vont avoir du mal à y parvenir.
Je vais intervenir le moins possible. 
Mais je vais prendre un malin plaisir à voir ces présomptueux se ramasser.
Je suis le Dieu de ce monde après tout.
Je ne voudrais pas que mes secrets de fabrication soit dévoilés trop facilement.

Commençons par leur première leçon, _les erreurs causent de l'indécidabilité_.

## Indécidabilité dues aux erreurs de mesures

> Incroyable voix de Dieu
>
> Voici des triangles. Vous pouvez en fabriquer vous même.
> Serez vous capable de savoir quelle est la somme de leurs angles ?

<%= leftblogimage('triangles_plats.png') %>

En prenant des mesures, ils découvrent rapidement que la somme des angles des triangles est toujours très proche de 180° (ou π radians).
Mais comment certifier que c'est la formule exacte ?
Pourquoi ne serait-ce pas 179,999995 ou 180,000003 ?
Certain d'entre eux commencent à formaliser un petit peu le problème
et ils finissent par démontrer que la somme fais toujours 180°.
Magnifique !
Seulement la preuve s'appuie sur des axiomes non démontrables parce que soumis aux mêmes règles d'imperfections de l'observation.
Ils auront beau faire des mesures de plus en plus précises qui viendront toujours conforter leur formule.
Ils n'auront que l'_espoir_ et  _jamais_ la certitude d'avoir la bonne.

Bien entendu, ils prient, ils m'appellent à l'aide.
Et comme tout Dieu qui se respecte, je ne réponds pas.
Ah ah ah ! J'ai toujours aimé faire ce genre de chose.
Et oui, j'aime bien rigoler.

Quand certain se rendent compte du problème des axiomes, ça les accable. 
Mais heureusement un espoir transparait :

> _Espoir_
>
> Si Dieu nous empêche de mesurer avec une infinie précision.
> Il nous est quand même possible de trouver des lois avec des erreurs minimes.
> Et comme l'erreur que nous faisons est faible, nos prédictions auront elles aussi de faibles erreurs.

## Indécidabilité avec erreurs croissantes


<%= leftblogimage('trois_corps.png') %>

C'est bien espéré, mais malheureusement il existe un problème très ennuyeux qui ne possède pas cette jolie propriété.
Il s'agit du _problème des 3 corps_. 
Prenons les formules de la gravitation Universelle et appliquons la à deux corps célestes. 
Si on connait la position de ces corps avec un grande précision, on pourra aussi connaître la position future de ces corps avec une grande précision.
L'hypothèse selon laquelle de petite erreurs de mesures impliquent de petites erreurs prédictive est confortée.
Cependant, il y a un problème.

Reprenons le même problème mais avec trois corps. Par exemple, avec le Soleil, la Terre et la Lune.
Dans ce cas, les erreurs de mesures initiales vont s'amplifier. 
S'amplifier au point de rendre toute prédiction inutilisable.

Là encore une voix d'espoir s'élève :
> Certes les erreurs prédictives augmentent. Mais plus le temps passe, plus notre technologie s'améliore.
> Plus les erreurs de mesures diminuent.
> Et plus les prédictions seront précises sur du long terme.
> Ainsi, on peut toujours espérer progresser dans nos prédictions.

Mais je vous l'ai dit. Je suis un Dieu facétieux.

## Indécidabilité avec erreurs discontinues

Considérons la question suivante :

Soit des coordonnées GPS précises à quelques centimètres près.
Les coordonnées sont proches des côtes de la Bretagne.
Ce point va-t-il tomber dans la mer ou sur la terre ferme ?

Et bien, pour certaines coordonnées, c'est impossible de le savoir. 
Même si je réduis l'erreur à une valeur infinitésimale. 
Simplement parce que certains voisinages autour d'un point contiennent toujours à la fois de l'eau et de la terre.
Et ce quelque soit la taille du voisinage.

<%= leftblogimage('fractale.png') %>

Fractales et Mandelbrot. 
On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur. (Imaginer R\Q)

Mais que vois-je ? 
Un petit malin essaye de trouver la vérité en s'extrayant de mon Monde et en faisant un article sur un blog ?
Ça ne va pas se passer comme ça ! Croyez moi !
> Jusqu'ici, faire des prédictions à partir des données observées semble être une quête vouée à l'échec. 
> Mais je suis persuadé que l'on peut aller au delà.
> Au diable ce Dieu qui nous empêche d'avoir des mesures précises !
> Inventons notre propre Univers mathématique avec des axiomes connus, clairs et précis. 
> Un monde qui se suffit à lui-même, un monde _self-contained_.
> Un monde dans lequel il n'y aura plus d'erreur de mesure. 
> Un monde entièrement contrôlé par des règles que nous aurons choisi.
> Un monde où enfin tout pourra être prédis.

Alors là je me fâche !
J'apparais devant ce petit importun dans un flot de lumière aveuglante.

> << C'est ton créateur qui te parle !
> Certaines choses sont interdites !
> Mais comme je suis sympa, je te mets sur la voie.
> Vous avez des ordinateurs.
> Poses toi cette question.
> Existe-t-il un programme qui permette de décider si un autre programme s'arrête ? >>

## Indécidabilité sans erreur

<%= leftblogimage("Turing_undecidability.png") %>

Jusqu'ici, on a vu que toutes les activité humaines font faces à des problèmes indécidables.
Mais jusqu'ici, cette indécidabilité était due aux _erreurs_.
Maintenant peut-être que privé d'erreur de mesure, on pourrait enfin résoudre tous les problèmes.
Et bien non.
Même dans un monde mathématique complètement contrôlé.
On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

Théorème d'indécidabilité du problème de l'arrêt. La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

> Supposons qu'il existe un programme qui puisse dire si un autre programme s'arrête. Plus précisément :
> 
> Hypothèse: Il existe un programme `P` tel que: 
>
> - `P(x,y)` réponde "s'arrête" en un temps fini si et seulement si `x(y)`[^1] s'arrête effectivement en temps fini et 
> - `P(x,y)` réponde "ne s'arrête pas" en un temps fini dans le cas contraire.
>
> Remarque: Tout code de programme est une chaîne de caractère qui peut être utilisée aussi comme entrée d'un autre programme. 
> Ainsi écrire `P(x,x)` est autorisé.
> 
> Soit le programme Q que j'écris comme suit :
> <pre class="twilight">
> Q(x) :
>     si P(x,x)="s'arrête" alors je fais une boucle infinie.
>     si P(x,x)="ne s'arrête pas" alors je m'arrête.
> </pre>
> 
> Maintenant que répond `P(Q,Q)`?
>
> - si `P(Q,Q)` répond "s'arrête" ça implique que `P(Q,Q)`="ne s'arrête pas"
> - si `P(Q,Q)` répond "ne s'arrête pas" ça implique que `P(Q,Q)`="s'arrête"
> 
> Il y a donc une contradiction que le seul moyen de régler est par la non existence du programme P.

[^1]: C'est-à-dire le programme `x` prenant l'entrée `y`.

Cette indécidabilité est vraiment la plus gênante de toute. 
Elle signifie que l'on peut créer un objet dont on ne peut pas prédire le comportement quelque soit mes possibilité de contrôler cet objet.

C'est simple, je suis le Démiurge de ce monde imaginaire. 
Et même moi, je dois me soumettre à cette règle.
Comme quoi, avoir la possibilité de créer le monde et la toute puissance sont deux choses différentes.

newcorps

# Que peut-on espérer ?


## Des bateaux à la rescousse de la *vérité*.

<%= leftblogimage("3DTriangle.png") %>

Pour prouver que même les très grand triangles obéissent à cette loi,
ils partent en expédition, avec trois bateaux.
Un va très au nord, pendant que l'un va vers l'est et l'autre vers l'ouest.
Ils naviguent tous à la même vitesse et pendant la même durée.

D'après leur calcul, les deux bateaux du sud doivent tourner avec un angle de 45° (respectivement -45°) pour rejoindre le bateau du nord.
Après de longues semaines de navigation, les deux bateaux du sud se rejoignent. Mais, il n'y a pas de trace du bateaux nordique.
Que se passe-t-il ? Bien entendu, leur Dieu facétieux leur fait faire des mesures imparfaites et donc ils ne sont pas allé exactement à la même vitesse, ils n'ont pas tourné exactement en même temps, ni d'un angle valant exactement 45°.
Sauf que leur ingénieurs en sont sûr l'erreur ne devait être que de quelques centaines de mètres. 
Alors que là, l'erreur semble vraiment très grande.


Et oui ! Comme je suis un Dieu terriblement farceur, je me suis débrouillé pour que leur Univers ne soit pas plat (comme l'imaginais leur théoricien).
Mais presque plat. Disons que je les fais vivre sur une sphère qui a un rayon de courbure d'environ 6000km (ça ne vous rappelle rien ?).

Ah ah ah ! Cette blague je la trouve bien bonne. 
De toute évidence, certains ne goûtent pas mon sens de l'humour. 
J'ai remarqué que ceux qui ont trouvé cette petit surprise, la solution avant les autres et qui fanfaronne en énerve certains au plus haut point. 
Certains se font même brûler.
Apparemment il y a de mauvais perdant chez ces êtres là.
Et oui sur une sphere on peut très bien dessiner des triangles dont la somme des angles fait 270° au lieu des 180° attendu dans un Univers plat.
Disons que pour tous les triangle moins grand que quelques kilomètres, l'erreur est minime.

## Fractions rationnelles

<%= leftblogimage("rational_fraction.png") %>

Utilisation des fractions rationnelles pour retrouver la formule exacte.
Problème, on sait qu'on converge mais on ne sait pas quand.

