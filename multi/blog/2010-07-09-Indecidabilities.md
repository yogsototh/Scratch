-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-08-01T10:04:31+02:00
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

en: <%= tldr %> I pretend to create a world to give examples of different meanings behind the word _undecidability_:
en: 
en: - Undecidability due to measure errors, 
en: - Big errors resulting from small initial measure error,
en: - Fractal undecidability ;
en: - Logic Undecidability.
en: 
en: After that, I try to find what is the best we can do to discover truths.
fr: <%= tlal %> Je crée un mode mathématique simple pour parler de différents types d'_indécidabilités_ :
fr: 
fr: - indécidabilité due aux erreurs d'observation ;
fr: - grandes erreurs résultant de petites erreurs de mesure ;
fr: - indécidabilité fractales ;
fr: - indécidabilité logique.
fr: 
fr: Ensuite je discute un peu sur ce qu'on peut faire de mieux sachant que beaucoup de choses sont indécidables.

enddiv

newcorps

en: # The Undecidabilities
fr: # Les indécidabilités

begindiv(intro)

fr: Si le monde a été fabriqué par un démiurge, on peut dire que celui-ci devait avoir le sens de l'humour. 
fr: Et le récit que je vais faire va vous en fournir la preuve.
fr: Je vais me mettre à sa place. 
fr: Je vais créer un monde simplifié.
fr: Un monde régi exactement par nos règles mathématiques.
fr: Puis je vais vous parler du mal qui touche cet Univers semblable au notre ; l'*indécidabilité*. 
fr: L'incapacité de savoir si nous avons trouvé la vérité, ou seulement une approximation de celle-ci.
fr: L'incapacité de prédire certaines choses qui semblent pourtant aller de soi.
fr: Voilà comment tout aurait pu commencer.
en: If a demiurge made our world, he certainly had a great sense of humor.
en: After this read, you should be convinced.
en: I'll pretend to be him.
en: I'll create a simplified world.
en: A world that obey to simple mathematical rules.
en: And I'll tell you about one of the curse on this world: the *undecidability*.
en: The inability to know if we had find the *truth*.
en: The inability to predict many things that should be natural.
en: Here begin the story.

enddiv

<%= leftblogimage("genesis.png") %>

fr: Au début, il n'y avait rien. 
fr: Puis un article de blog commença à prendre forme.
fr: J'inspire profondément pour sentir la pesanteur de ce que je vais accomplir.
fr: Attention, une dernier moment de tension et je crée l'_Univers_.
fr: Un *Univers* qui n'existera que le temps de la lecture de cet article.
fr: Me voici le _démiurge_ de cet Univers et te voilà son observateur privilégié.
en: In the beginning there was only void.
en: Then a blog post beginning to be written.
en: I breath profoundly to feel the weight of the act I will accomplish.
en: A last tense moment and... I _create_ the _Universe_.
en: An incredible _Universe_ which will exists only the time of this read.
en: I'm the _demiurge_ of this universe and you are its observer.

fr: Comme j'aime bien tout contrôler, je fabrique ce monde avec quelques règles simples.
fr: Je décide que les _vrais_ règles de ce monde sont celles que nous pensons qui régissent notre monde.
fr: Notez qu'il y a une grande différence. 
fr: Pour leur monde, ce que l'on _croit_ vrai aujourd'hui, est vraiment vrai pour eux.
fr: Leur monde est donc plus _simple_ à priori que le notre. 
fr: En particulier, on peut le décrire avec des axiomes et des règles mathématiques.
fr: Alors qu'il est possible que ce ne soit pas le cas de notre Univers. 
fr: Mais nous reviendront là-dessus plus tard.
en: I construct this world using only simples rules.
en: I decide that _real_ rules of this world will be the one we believe are _true_ for our world.
en: Note the difference.
en: For their world, everything we _believe_ today is _true_ for them.
en: Their world is then probably _simpler_ than our.
en: Particularly, we can describe this world with axioms and mathematic rules.
en: It is not so sure for our Universe. 
en: But we'll talk about that later.

fr: Bon au travail maintenant, je crée une *Terre*.
fr: J'y ajoute des habitants intelligents, les _Ys_.
fr: Bien entendu ils se posent des questions.
fr: En particulier, ils se demandent quelles sont les lois qui régissent leur monde. 
fr: Ils pensent que connaître toutes ces règles leur permettrait de connaître l'avenir. 
fr: Leur naïveté est touchante. 
fr: Ah, si seulement ils savaient.
fr: Mais je suis là pour les aider à apprendre.

en: Lets the work begin.
en: I create an _Earth_.
en: I populate it with intelligent people, the _Ys_.
en: Of course they are curious.
en: In particular they try to understand their world.
en: They believe that if they know the rules of their world they will be able to predict the consequences of most of their acts.
en: They are so naive.
en: If only they knew.
en: But I'm here to help them.

fr: Comme je suis un Dieu un peu facétieux, je vais leur jouer quelques tours.
fr: Sinon on s'ennuierai à mourir.
fr: Le premier est de leur donner des sens imparfaits. 
fr: De plus il leur est impossible d'avoir des mesures parfaites.
fr: Je leur laisse cependant toutes libertés pour améliorer leur technologie et diminuer ces erreurs de mesures.

en: I am a God who likes jokes.
en: The first joke I make to Ys is to make their sense imperfect.
en: Furthermore it is not possible to make perfect precise measure in my world.
en: I let Ys ameliorate their technology but there is a theoretical limit to the best precision they can reach.

fr: Les habitants de ce monde pensent que celui-ci est plat.
fr: Certains d'entre eux pensent qu'il est possible de découvrir les règles du monde que j'ai créé.
fr: Et bien que le jeu commence.

en: I'd like to precise that these people believe their world is flat.
en: Some believe it is possible to find the rules of their Universe.
en: Now, let the game begins.

fr: Commençons par leur première leçon, _les erreurs causent de l'indécidabilité_.
en: Lets start easily, _errors can cause undecidability_.

en: ## Undecidability due to measure errors
fr: ## Indécidabilité dues aux erreurs de mesures

fr: Voici ce que pense l'un de ces individus.
en: Here is what one of them think:

fr: > Tous les triangles que j'observe semble avoir une propriété commune.
fr: > La somme de leurs angles est toujours π radiants (180°).
fr: > Il s'agit certainement d'une loi de mon Univers.
fr: > Mais comment être certain que tous les triangles de mon Univers possèdent cette propriété ?

en: > All triangle I observe seems to share the same property.
en: > Each time I sum up their angles I obtain π radiants (180°).
en: > It is certainly a rule of my Universe.
en: > But how to be certain all triangle in my Universe share this property?

<%= leftblogimage('triangle_3_angles.png') %>

fr: Certain d'entre eux commencent à formaliser un petit peu le problème
fr: et ils finissent faire une preuve mathématique.
fr: Magnifique !
fr: La preuve est correcte, mais il reste un petit problème.
fr: La preuve s'appuie sur des axiomes et des règles.
fr: Comment être certain que ces règles et ces axiomes sont vrai dans leur monde?
fr: Ils auront beau faire des mesures de plus en plus précises qui conforteront cette formule,
fr: ils n'auront que l'_espoir_ et  _jamais_ la certitude que la formule est vrai.
fr: Simplement parce que le seul moyen de vérifier la véracité des axiomes est par l'observation.
fr: Hors en tant que dieu facétieux, j'ai interdit les observation avec des mesures parfaites.

en: Some began to formalize the problem.
en: They end by writing a mathematical proof.
en: Marvelous!
en: The proof seems correct, but, a problem remains.
en: The proof is based on rules and axioms.
en: How to be certain these rules and axioms are right in their world?
en: They will try to measure again and again the sum of the angles of triangles.
en: The measure will never fail.
en: But they'll never be certain the rules and axioms are right.
en: Because then only way to verify all axioms depends of observation.
en: And as a facetious god, I forbid perfect measure in observation.

fr: Bien entendu, ils prient, ils m'appellent à l'aide.
fr: Et comme tout Dieu qui se respecte, je ne réponds pas.
fr: Ah ah ah ! J'ai toujours aimé faire ce genre de chose.
fr: Ensuite je ferai comme si je n'existe pas.
fr: Encore un bonne blague !

en: Of course, they prey, they call me to help.
en: And as any respectful god, I don't answer.
en: Ah ah ah! I've always loved to make these kind of thing.
en: Let's act as if I don't exists.
en: What a good joke!

fr: Si certains se sentent accablés, il leur reste un espoir :
en: They feel sad. But they have some hope:

fr: > _Espoir_
fr: >
fr: > Si nous faisons de faibles erreurs de mesure, nous aurons de faibles erreurs dans nos prédictions.

en: _Hope_
en: 
en: > If we make small measure error, we will make small predictive error.

fr: ## Indécidabilité avec erreurs croissantes
en: ## Growing errors Undecidability


<%= leftblogimage('3_corps.png') %>

fr: Malheureusement pour eux, il y a le  _problème des 3 corps_. 
fr: Prenons les formules de la gravitation Universelle et appliquons la à deux corps célestes. 
fr: Si on connait la position de ces corps avec un grande précision, on pourra aussi connaître la position future de ces corps avec une grande précision.
fr: L'hypothèse selon laquelle de petite erreurs de mesures impliquent de petites erreurs prédictive est confortée.
fr: Cependant, il y a un problème.
fr: Reprenons le même problème mais avec trois corps. Par exemple, avec le Soleil, la Terre et la Lune.
fr: Dans ce cas, les erreurs de mesures initiales vont s'amplifier. 
fr: S'amplifier au point de rendre toute prédiction inutilisable.

en: Unfortunately, the three bodies problem will crush this _hope_.
en: Using Newton's Universal Law of gravitation with two bodies, we can predict with precision what will be their position and speed in the future.
en: Until there all seems OK.
en: But now, add another body.
en: All errors will grow.
en: Errors will grow at a point that any prediction will be unusable.

fr: Là encore une voix d'espoir s'élève :
fr: > Peut-être pouvons nous calculer l'erreur maximale acceptable pour prédire quelque chose.
fr: > Et nous pourrions au moins savoir ce que nous pouvons prédire ou pas.

en: Even with this bad news there is the _hope_ to _control_ the error.
en: > May we should know the maximal measure error we can handle to predict something. 
en: > And we should at least determine what we can predict and what we cannot.

fr: Une fois encore, ça ne va pas très bien se passer.
en: Once again, this should not terminate has they hope.

fr: ## Indécidabilité fractale
en: ## Fractal Undecidability

fr: Considérons la question suivante :
en: Consider the following question:

<%= leftblogimage('mandelbrot.png') %>

fr: Soit des coordonnées GPS précises à 1m près.
fr: Les coordonnées sont proches des côtes de la Bretagne.
fr: Ce point va-t-il tomber dans la mer ou sur la terre ferme ?

en: Consider some GPS coordinates on a point around the cost of the "Bretagne" in France.
en: The coordinates are 3 feet precise.
en: Is the point in the water or on Earth?

fr: Et bien, pour certaines coordonnées, c'est impossible de le savoir. 
fr: Même si je réduis l'erreur à une valeur infinitésimale. 
fr: Simplement parce que certains voisinages autour d'un point contiennent toujours à la fois de l'eau et de la terre.
fr: Et ce quelque soit la taille du voisinage.

en: For some coordinates it is not possible to know.
en: Even if we are authorize to move a bit to dodge the borders.
en: Because there are some zone in which all point could be a "border" for any size of the zone.

fr: On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur[^2].
fr: [^2]: Pensez aux deux ensembles R\Q et Q.
en: We can even imagine some mathematical structure where _all_ points are at the border[^2]. 
en: [^2]: The set $$\mathbb{R}\setminus\mathbb{Q}$$ has this property.

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

fr: ## Indécidabilité logique
en: ## Logical Undecidability

<%= leftblogimage("stackOverflow.png") %>

fr: Jusqu'ici, tous les problèmes d'indécidabilités était dûs aux _erreurs_.
fr: Maintenant peut-être que privé d'erreur de mesure, on pourrait enfin résoudre tous les problèmes.  
fr: Et bien non.
fr: Même dans un monde mathématique complètement contrôlé.
fr: On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

en: Until there all problem were undecidable because of measure _errors_.
en: May be in a controlled world without any _error_ we should be able to predict anything.  
en: I'm sorry to say no.
en: Even in a self-contained mathematical world it can be possible to create object with an unpredictable behaviour.

fr: Il s'agit du problème de l'arrêt. 
fr: 
fr: Le Théorème stipule qu'il n'existe pas de programme permettant de _décider_ si un autre programme s'arrête.
fr: La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

en: It is the _halting problem_.
en: 
en: Theorem: It is undecidable given a description of a program, whether the program finishes running or will run forever.
en: The idea of the proof is simple enough to be part of this article. 
en: And this is with pleasure I give you one here.

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

en: > Suppose a program able to decide if any program halt exists.
en: > More precisely:
en: > 
en: > Hypothesis: there exists a program `P` such that:
en: >
en: > - `P(x,y)` return "stop" in a finite amount of time if `x(y)`[^1] will stop running.
en: > - `P(x,y)` return "loop" in a finite amount of time if `x(y)` will never stop running.
en: > 
en: > Remark: Any program can be represented as a string. Therefore, a program can be used as the input of another program.
en: > It is authorized to write `P(x,x)`.
en: > 
en: > Let `Q` be the following program using the return value of `P`.
en: > <pre class="twilight">
en: > Q(x) :
en: >     if P(x,x)="stop" then I enter in an infinite loop
en: >     if P(x,x)="loop" then I stop
en: > </pre>
en: > 
en: > Now, what is the value of `P(Q,Q)`?
en: > 
en: > - if `P(Q,Q)` returns "stop" that imply by construction of `Q` that `P(Q,Q)` returns "loop".
en: > - if `P(Q,Q)` returns "loop" that means by construction of `Q` that `P(Q,Q)` return "stop".
en: > 
en: > Therefore there is a contradiction the only way to handle is by the non existence of the program `P`.

fr: [^1]: C'est-à-dire le programme `x` prenant l'entrée `y`.
en: [^1]: Meaning `x` taking `y` as input.

fr: C'est simple, je suis le démiurge de ce monde imaginaire. 
fr: Et même moi, je dois me soumettre à cette règle.
fr: Comme quoi, avoir la possibilité de créer le monde et la toute puissance sont deux choses différentes.

en: I am the demiurge of this imaginary world. 
en: And I cannot know the future of this world.
en: Therefore, creative power isn't equivalent to omnipotence.
fr: Après tout ceci, il peut sembler difficile de savoir en quoi nous pouvons croire.
fr: Mais ce serait une erreur de jeter le bébé avec l'eau du bain.
fr: J'expliquerai ce que nous pouvons espérer et qu'elle attitude nous devons adopter une fois que l'on a réalisé que beaucoup de vérité nous sont inaccessibles.

en: After all this, it becomes difficult to know what we can believe.
en: But it would be another error to throw away all our knowledge.
en: I'll explain in a future article what we can hope and what attitude we should have once we've realized most of truth are unaccessible.

newcorps

fr: # Que peut-on espérer ?
en: # What could we do then?

fr: ## Des bateaux découvrent une vérité inattendue
en: ## Boat Serendipity

<%= leftblogimage("triangle_on_sphere.png") %>

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

en: The Ys have boats. And they navigate, the send two boats.
en: The first to the North and the second to the West.
en: The first boat stop after one week.
en: The second make a $$\frac{3}{4}π$$ turn to the right.
en: After what should have been $$\sqrt{2}$$ weeks, the second boat should have encounter the first boat.
en: But the north boat seems to have disappeared.
en: And after sometimes, they discovered the boat is very far to the north north east.
en: The proof is here.
en: There was a triangle were sum of its angle is not π radiant (180°).

fr: Et oui ! Comme je suis un Dieu terriblement farceur, je me suis débrouillé pour que leur Univers ne soit pas plat (comme l'imaginais leur théoricien).
fr: Mais presque plat. Disons que je les fais vivre sur une sphère qui a un rayon de courbure d'environ 6000km (ça ne vous rappelle rien ?).

en: Yes! Good joke!
en: As God I'd like all these jokes.
en: Their world isn't _flat_.
en: That means, two parallel line have two common point.
en: They live on a spherical planet. 
en: Huge enough for they didn't notice it for a long time.

fr: Ah ah ah ! Cette blague je la trouve bien bonne. 
fr: De toute évidence, certains ne goûtent pas mon sens de l'humour. 
fr: J'ai remarqué que ceux qui ont trouvé cette petit surprise, la solution avant les autres et qui fanfaronne en énerve certains au plus haut point. 
fr: Certains se font même brûler.
fr: Apparemment il y a de mauvais perdant chez ces êtres là.
fr: Et oui sur une sphere on peut très bien dessiner des triangles dont la somme des angles fait 270° au lieu des 180° attendu dans un Univers plat.
fr: Disons que pour tous les triangle moins grand que quelques kilomètres, l'erreur est minime.

en: Ah Ah Ah! How funny I am!
en: But I don't know why some don't like my jokes.
en: The firsts who discovered this little surprise are happy to tell the world and some are annoyed.
en: Annoyed to the point to burn some of them.
en: They apparently are bad losers within these people.
en: And yes, you can draw triangle were the sum of angle is 270° instead of the 180° on a flat world.
en: For triangle small than many kilometers the error is minimal.

fr: ## Fractions rationnelles
en: ## Rational fractions

<%= leftblogimage("controled_error.png") %>

fr: Utilisation des fractions rationnelles pour retrouver la formule exacte.
fr: Problème, on sait qu'on converge mais on ne sait pas quand.

