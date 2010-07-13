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

en: <%= tldr %> We can attribute different meaning to undecidability:
en: 
en: - Undecidability due to measure errors, 
en: - Undecidability with big error from small measure error,
en: - Fractal undecidability ;
en: - Undecidability without any measure error.
en: 
en: Is the situation so bad we cannot do anything?
en: We can find the truth, but we can never be sure we had reach it.
en: I don't think we can do better than that.
fr: <%= tlal %> Plusieurs choses sont indécidables et pour des raisons différentes :
fr: 
fr: - Indécidabilité due aux erreurs de mesures ;
fr: - Indécidabilités avec de petites erreurs de mesures ;
fr: - Indécidabilités fractales ;
fr: - Indécidabilité dans un monde sans erreur de mesure.
fr: 
fr: Est-ce que la situation est perdue ?
fr: On peut découvrir la vérité, par contre il est impossible d'être sûr que nous l'ayons atteinte.
fr: Je ne pense pas que l'on puisse faire mieux.
fr: Ainsi il faut toujours adopter un grande ouverture d'esprit si l'on recherche la vérité.


enddiv

newcorps

en: # The Undecidabilities
fr: # Les indécidabilités

begindiv(intro)

fr: Si le monde a été fabriqué par un démiurge, on peut dire que celui-ci devait avoir le sens de l'humour. 
fr: Et le récit que je vais faire va vous en fournir la preuve.
fr: Je vais me mettre à sa place. 
fr: Je vais créer un monde simplifié.
fr: Un monde régi par des règles mathématiques très simples.
fr: Puis je vais vous parler du mal qui touche cet Univers semblable au notre.
fr: L'*indécidabilité*. 
fr: L'incapacité de savoir si nous avons trouvé la vérité, ou seulement une approximation de celle-ci.
fr: L'incapacité de prédire certaines choses qui semblent pourtant aller de soi.
fr: Voilà comment tout aurait pu commencer.
en: If the world was made by a demiurge he certainly have a great sense of humor.
en: And this read will prove it to you.
en: I'll pretend to be him.
en: I'll create a simplified world.
en: A world that obey to simple mathematical rules.
en: And I'll tell you about the *undecidability*.
en: The inability to know if we had find the *truth* or only an approximation to it.
en: The inability to predict many things.

enddiv

<%= leftblogimage("genese.png") %>

fr: Au début, il n'y avait rien. 
fr: Puis un article de blog commença à prendre forme.
fr: J'inspire profondément pour sentir la pesanteur de ce que je vais accomplir.
fr: Attention, une dernier moment de tension et je crée l'_Univers_.
fr: Un *Univers* qui n'existera que le temps de la lecture de cet article.
en: At the beginning there was only void.
en: Then a blog post beginning to be written.
en: I breath profoundly to feel the weight the act I will accomplish.
en: A last tense moment and... I create the _Universe_.
en: A _Universe_ which will exists only the time of this read.

fr: Me voici le _démiurge_ de cet Univers et te voilà son observateur privilégié.
en: I'm the _demiurge_ of this universe and you are its observer.

fr: Comme j'aime bien tout contrôler, je fabrique ce monde avec quelques règles simples.
fr: Je décide que les _vrais_ règles de ce monde sont celles que nous pensons qui régissent notre monde.
fr: Notez qu'il y a une grande différence. 
fr: Pour leur monde, ce que l'on _croit_ vrai aujourd'hui, est vraiment vrai pour eux.
fr: Leur monde est donc plus _simple_ à priori que le notre. 
fr: En particulier, on peut le décrire avec des axiomes et des règles mathématiques.
fr: Alors qu'il est possible que ce ne soit pas le cas de notre Univers. 
fr: Mais nous reviendront là-dessus plus tard.
en: I like to control everything.
en: I construct this world using only some simples rules.
en: I decide that _real_ rules of this world will be the one we believe are _true_ for our world.
en: Note the difference.
en: For their world, everything we _believe_ today is _true_ for them.
en: Their world is then _simpler_ than our.
en: Particularly, we can describe this world with axioms and mathematic rules.
en: It is not so sure for our Universe. 
en: But we'll talk about that later.

fr: Bon au travail maintenant, je crée une *Terre*.
fr: J'y ajoute des habitants intelligents.
fr: Bien entendu ils se posent des questions.
fr: En particulier, ils se demandent quelles sont les lois qui régissent leur monde. 
fr: Ils pensent que connaître toutes ces règles leur permettrait de connaître l'avenir. 
fr: Leur naïveté est touchante. 
fr: Ah, si seulement ils savaient.
fr: Mais je suis là pour les aider à apprendre.

fr: Comme je suis un Dieu un peu facétieux, je vais leur jouer quelques tours.
fr: Sinon on s'ennuierai à mourir.
fr: Le premier est de leur donner des sens imparfaits. 
fr: De plus il leur est impossible d'avoir des mesures parfaites.
fr: Je leur laisse cependant toutes libertés pour améliorer leur technologie et diminuer ces erreurs de mesures.

fr: Les habitants n'ont pas eu notre évolution historique.
fr: En particulier, il pensent que le monde est plat avec ou sans bord (ça dépend) et le ciel repose dessus.
fr: Une vision proche de celle de nos ancêtres.
fr: Certains d'entre eux pensent qu'il est possible de découvrir les règles du monde que j'ai créé.
fr: Et bien que le jeu commence.
fr: Le but des habitants est de retrouver les règles de mon monde.
fr: Et moi, je vais les aider à découvrir qu'ils vont avoir du mal à y parvenir.
fr: Je vais intervenir le moins possible. 
fr: Mais je vais prendre un malin plaisir à voir ces présomptueux se ramasser.
fr: Je suis le Dieu de ce monde après tout.
fr: Je ne voudrais pas que mes secrets de fabrication soit dévoilés trop facilement.

fr: Commençons par leur première leçon, _les erreurs causent de l'indécidabilité_.

en: ## Undecidability due to measure errors
fr: ## Indécidabilité dues aux erreurs de mesures

fr: > Incroyable voix de Dieu
fr: >
fr: > Voici des triangles. Vous pouvez en fabriquer vous même.
fr: > Serez vous capable de savoir quelle est la somme de leurs angles ?

<%= leftblogimage('triangles_plats.png') %>

fr: En prenant des mesures, ils découvrent rapidement que la somme des angles des triangles est toujours très proche de 180° (ou π radians).
fr: Mais comment certifier que c'est la formule exacte ?
fr: Pourquoi ne serait-ce pas 179,999995 ou 180,000003 ?
fr: Certain d'entre eux commencent à formaliser un petit peu le problème
fr: et ils finissent par démontrer que la somme fais toujours 180°.
fr: Magnifique !
fr: Seulement la preuve s'appuie sur des axiomes non démontrables parce que soumis aux mêmes règles d'imperfections de l'observation.
fr: Ils auront beau faire des mesures de plus en plus précises qui viendront toujours conforter leur formule.
fr: Ils n'auront que l'_espoir_ et  _jamais_ la certitude d'avoir la bonne.

fr: Bien entendu, ils prient, ils m'appellent à l'aide.
fr: Et comme tout Dieu qui se respecte, je ne réponds pas.
fr: Ah ah ah ! J'ai toujours aimé faire ce genre de chose.
fr: Et oui, j'aime bien rigoler.

fr: Quand certain se rendent compte du problème des axiomes, ça les accable. 
fr: Mais heureusement un espoir transparait :

fr: > _Espoir_
fr: >
fr: > Si Dieu nous empêche de mesurer avec une infinie précision.
fr: > Il nous est quand même possible de trouver des lois avec des erreurs minimes.
fr: > Et comme l'erreur que nous faisons est faible, nos prédictions auront elles aussi de faibles erreurs.

fr: ## Indécidabilité avec erreurs croissantes
en: ## Growing errors Undecidability


<%= leftblogimage('trois_corps.png') %>

fr: C'est bien espéré, mais malheureusement il existe un problème très ennuyeux qui ne possède pas cette jolie propriété.
fr: Il s'agit du _problème des 3 corps_. 
fr: Prenons les formules de la gravitation Universelle et appliquons la à deux corps célestes. 
fr: Si on connait la position de ces corps avec un grande précision, on pourra aussi connaître la position future de ces corps avec une grande précision.
fr: L'hypothèse selon laquelle de petite erreurs de mesures impliquent de petites erreurs prédictive est confortée.
fr: Cependant, il y a un problème.

fr: Reprenons le même problème mais avec trois corps. Par exemple, avec le Soleil, la Terre et la Lune.
fr: Dans ce cas, les erreurs de mesures initiales vont s'amplifier. 
fr: S'amplifier au point de rendre toute prédiction inutilisable.

fr: Là encore une voix d'espoir s'élève :
fr: > Certes les erreurs prédictives augmentent. Mais plus le temps passe, plus notre technologie s'améliore.
fr: > Plus les erreurs de mesures diminuent.
fr: > Et plus les prédictions seront précises sur du long terme.
fr: > Ainsi, on peut toujours espérer progresser dans nos prédictions.

fr: Mais je vous l'ai dit. Je suis un Dieu facétieux.

fr: ## Indécidabilité avec erreurs discontinues

fr: Considérons la question suivante :

fr: Soit des coordonnées GPS précises à quelques centimètres près.
fr: Les coordonnées sont proches des côtes de la Bretagne.
fr: Ce point va-t-il tomber dans la mer ou sur la terre ferme ?

fr: Et bien, pour certaines coordonnées, c'est impossible de le savoir. 
fr: Même si je réduis l'erreur à une valeur infinitésimale. 
fr: Simplement parce que certains voisinages autour d'un point contiennent toujours à la fois de l'eau et de la terre.
fr: Et ce quelque soit la taille du voisinage.

<%= leftblogimage('fractale.png') %>

fr: Fractales et Mandelbrot. 
fr: On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur. (Imaginer R\Q)

fr: Mais que vois-je ? 
fr: Un petit malin essaye de trouver la vérité en s'extrayant de mon Monde et en faisant un article sur un blog ?
fr: Ça ne va pas se passer comme ça ! Croyez moi !
fr: > Faire des prédictions précises à partir des données observées semble être une quête vouée à l'échec. 
fr: > Mais je suis persuadé que l'on peut aller au delà.
fr: > Au diable ce Dieu qui nous empêche d'avoir des mesures précises !
fr: > Inventons notre propre Univers mathématique.
fr: > Un monde qui se suffit à lui-même.
fr: > Un monde dans lequel il n'y aura plus d'erreur de mesure. 
fr: > Un monde entièrement contrôlé par des règles que nous aurons choisi.
fr: > Un monde similaire au notre mais où tout pourra être prédit.

fr: ## Indécidabilité sans erreur

<%= leftblogimage("Turing_undecidability.png") %>

fr: Jusqu'ici, tous les problèmes d'indécidabilités était dûs aux _erreurs_.
fr: Maintenant peut-être que privé d'erreur de mesure, on pourrait enfin résoudre tous les problèmes.
fr: Et bien non.
fr: Même dans un monde mathématique complètement contrôlé.
fr: On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

fr: Il s'agit du problème de l'arrêt. 
fr: 
fr: Le Théorème stipule qu'il n'existe pas de programme permettant de _décider_ si un autre programme s'arrête.
fr: La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

fr: > Supposons qu'il existe un programme qui puisse dire si un autre programme s'arrête. Plus précisément :
fr: > 
fr: > Hypothèse: Il existe un programme `P` tel que: 
fr: >
fr: > - `P(x,y)` réponde "s'arrête" en un temps fini si et seulement si `x(y)`[^1] s'arrête effectivement en temps fini et 
fr: > - `P(x,y)` réponde "ne s'arrête pas" en un temps fini dans le cas contraire.
fr: >
fr: > Remarque: Tout code de programme est une chaîne de caractère qui peut être utilisée aussi comme entrée d'un autre programme. 
fr: > Ainsi écrire `P(x,x)` est autorisé.
fr: > 
fr: > Soit le programme Q que j'écris comme suit :
fr: > <pre class="twilight">
fr: > Q(x) :
fr: >     si P(x,x)="s'arrête" alors je fais une boucle infinie.
fr: >     si P(x,x)="ne s'arrête pas" alors je m'arrête.
fr: > </pre>
fr: > 
fr: > Maintenant que répond `P(Q,Q)`?
fr: >
fr: > - si `P(Q,Q)` répond "s'arrête" ça implique que `P(Q,Q)`="ne s'arrête pas"
fr: > - si `P(Q,Q)` répond "ne s'arrête pas" ça implique que `P(Q,Q)`="s'arrête"
fr: > 
fr: > Il y a donc une contradiction que le seul moyen de régler est par la non existence du programme P.

fr: [^1]: C'est-à-dire le programme `x` prenant l'entrée `y`.

fr: Cette indécidabilité est vraiment la plus gênante de toute. 
fr: Elle signifie que l'on peut créer un objet dont on ne peut pas prédire le comportement quelque soit mes possibilité de contrôler cet objet.

fr: C'est simple, je suis le démiurge de ce monde imaginaire. 
fr: Et même moi, je dois me soumettre à cette règle.
fr: Comme quoi, avoir la possibilité de créer le monde et la toute puissance sont deux choses différentes.

fr: newcorps

fr: # Que peut-on espérer ?


## Des bateaux à la rescousse de la *vérité*.

<%= leftblogimage("3DTriangle.png") %>

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
fr: De toute évidence, certains ne goûtent pas mon sens de l'humour. 
fr: J'ai remarqué que ceux qui ont trouvé cette petit surprise, la solution avant les autres et qui fanfaronne en énerve certains au plus haut point. 
fr: Certains se font même brûler.
fr: Apparemment il y a de mauvais perdant chez ces êtres là.
fr: Et oui sur une sphere on peut très bien dessiner des triangles dont la somme des angles fait 270° au lieu des 180° attendu dans un Univers plat.
fr: Disons que pour tous les triangle moins grand que quelques kilomètres, l'erreur est minime.

## Fractions rationnelles

<%= leftblogimage("rational_fraction.png") %>

fr: Utilisation des fractions rationnelles pour retrouver la formule exacte.
fr: Problème, on sait qu'on converge mais on ne sait pas quand.

