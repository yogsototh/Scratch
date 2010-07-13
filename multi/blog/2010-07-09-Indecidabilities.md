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
fr: <%= tlal %> Différentes indécidabilités :
fr: 
fr: - Indécidabilité due aux erreurs de mesures ;
fr: - Espoir : de petites erreurs de mesures impliquent de petites erreurs prédictives ;
fr: - Indécidabilités avec de petites erreurs de mesures ;
fr: - Espoir : l'erreur est contrôlable, i.e. on peut trouver l'erreur maximale de mesure à partir de l'erreur maximale que l'on peut se permettre ;
fr: - Indécidabilités avec discontinuités ;
fr: - Espoir : l'indécidabilité est due aux erreurs de mesure. Sans erreur on peut tout prévoir ;
fr: - Indécidabilité sans erreur de mesure.
fr: 
fr: Est-ce que la situation est perdue ?
fr: Un théorème d'apprentissage automatique (qui est dans ma thèse) démontre que sous certaines circonstances raisonnables, on peut découvrir la vérité. 
fr: Par contre il est impossible d'être sûr que nous l'ayons atteinte.
fr: Je ne pense pas que l'on puisse faire mieux.


enddiv

newcorps

en: # The Undecidabilities
fr: # Les indécidabilités

begindiv(intro)

fr: Si le monde a été fabriqué par un Démiurge, on peut dire que celui-ci devait avoir le sens de l'humour. 
fr: Et le récit que je vais faire va vous en fournir la preuve.
fr: Je vais me mettre à sa place. 
fr: Je vais créer un monde simplifié.
fr: Un monde régie par des règles mathématiques très simples.
fr: Puis je vais vous parler du mal qui touche cet Univers semblable au notre.
fr: L'*indécidabilité*. 
fr: L'incapacité de savoir si nous avons trouvé la vérité, ou seulement une approximation de celle-ci.
fr: L'incapacité de prédire certaines choses qui semblent pourtant aller de soi.
fr: Voilà comment tout aurait pu commencer.

enddiv

fr: Au début, il n'y avait rien. 
fr: Puis un article de blog commença à prendre forme.
fr: J'hésitais tant le poids de ce que j'allais accomplir était imposant.
fr: Mais devant le défi, je décidais finalement de créer l'*Univers*.
fr: Bien entendu cet Univers n'est pas réel. 
fr: Il s'agit d'une représentation, une vue de l'esprit. 
fr: Un *Univers* qui n'existera que le temps de la lecture de cet article.

fr: Ce qui est agréable c'est que maintenant je suis Dieu. 
fr: Toi aussi tu possèdes une place privilégiée.
fr: Tu es un observateur de ce monde.

fr: Comme je suis un Dieu sympa, je fabrique ce monde avec quelques règles simples.
fr: C'est *la* différence entre ce monde est celui dans lequel je vis.
fr: Comme je crée ce monde je connais précisément toutes ses règles.
fr: Et je décide d'utiliser les axiomes actuels des mathématiques.

fr: Pour que ce monde soit un peu sympathique je crée une *Terre*.
fr: Et j'y ajoute des habitants intelligents.
fr: Bien entendu les habitants de ce monde se posent des questions.
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

fr: Certains d'entre eux pensent qu'il est possible de découvrir les règles du monde que j'ai créé.
fr: Et mais ! Moi je veux jouer.
fr: Bon alors, le jeu commence.
fr: Le but des habitants est de retrouver les règles de mon monde.
fr: Et moi, je vais leur montrer qu'ils vont avoir du mal à y parvenir.
fr: Ne serait-ce que pour leur fermer le clapet à ces présomptueux.
fr: Non mais. 
fr: Trouver tous les secrets de mon monde aussi facilement.

fr: Commençons par leur première leçon, _les erreurs causent de l'indécidabilité_.

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

fr: Quand certain s'en rendent compte, ça les accable. Mais heureusement un espoir transparait :

fr: > Espoir
fr: >
fr: > Si Dieu nous empêche de mesurer avec une infinie précision.
fr: > Il nous est quand même possible de trouver des loi avec des erreurs minimes.
fr: > Et comme l'erreur que nous faisons est faible, nos prédictions auront elles aussi de faibles erreurs.

fr: ## Indécidabilité avec erreurs croissantes
en: ## Growing errors Undecidability

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

fr: Considération la question suivante. 
fr: Je vous donne les coordonnées GPS d'un point et une erreur de mesure.
fr: Ma question est : est-ce que je vais être dans la mer où sur Terre ?
fr: Et bien, il est impossible de le savoir, même si je réduis l'erreur à une valeur infinitésimale. 
fr: Simplement parce que si je prends ce qu'il y a autour de mon point, il y aura toujours des zones avec et sans eau. 
fr: Et ce quelque soit la distance de mon point.

fr: Fractales et Mandelbrot. 
fr: On peut même imaginer une structure ou *tous* les points sont au bord de celle-ci, on ne peut donc pas se permettre d'erreur. (Imaginer R\Q)

fr: Mais que vois-je ? 
fr: Un petit malin essaye de trouver la vérité en s'extrayant de mon Monde et en faisant un article sur un blog ?
fr: Ça ne va pas se passer comme ça ! Croyez moi !
fr: > Jusqu'ici, faire des prédictions à partir des données observées semble être une quête vouée à l'échec. 
fr: > Mais je suis persuadé que l'on peut aller au delà.
fr: > Au diable ce Dieu qui nous empêche d'avoir des mesures précises !
fr: > Inventons notre propre Univers mathématique avec des axiomes connus, clairs et précis. 
fr: > Un monde qui se suffit à lui-même, un monde _self-contained_.
fr: > Un monde dans lequel il n'y aura plus d'erreur de mesure. 
fr: > Un monde entièrement contrôlé par des règles que nous aurons choisi.
fr: > Un monde où enfin tout pourra être prédis.

fr: Alors là je me fâche !
fr: J'apparais devant ce petit importun dans un flot de lumière aveuglante.

fr: > Eh mon petit gars, tu ne crois pas que ça va se passer comme ça ?
fr: > Je te ferai remarquer, que s'il y a certaines choses que même moi, le Démiurge de ton Univers, je ne puis décider. 
fr: > Il est absolument hors de question que tu le puisses aussi.
fr: > Et tiens, rien que pour t'embêter, je te mets sur la voie d'un problème indécidable qui va rabattre ton caquet.
fr: > Vous avez des ordinateurs.
fr: > Poses toi cette question. Existe-t-il un programme qui permette de décider si un autre programme s'arrête ?

fr: ## Indécidabilité sans erreur

fr: Jusqu'ici, on a vu que toutes les activité humaines font faces à des problèmes indécidables.
fr: Mais jusqu'ici, cette indécidabilité était due aux _erreurs_.
fr: Maintenant peut-être que privé d'erreur de mesure, on pourrait enfin résoudre tous les problèmes.
fr: Et bien non.
fr: Même dans un monde mathématique complètement contrôlé.
fr: On peut créer un objet pour lequel on ne pourra pas décider à l'avance ce qu'il fait.

fr: Théorème d'indécidabilité du problème de l'arrêt. La preuve est suffisamment simple pour rentrer dans ce post, donc je me fais un petit plaisir en la donnant.

fr: > Supposons qu'il existe un programme qui puisse dire si un autre programme s'arrête. Plus précisément :
fr: > 
fr: > Hypothèse: Il existe `P` tel que: 
fr: >
fr: > - `P(x,y)` réponde "s'arrête" en un temps fini si et seulement si `x(y)` s'arrête effectivement en temps fini et 
fr: > - `P(x,y)` réponde "ne s'arrête pas" en un temps fini dans le cas contraire.
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
fr: > Maintenant que répond `P(Q,Q)`?
fr: >
fr: > - si `P(Q,Q)` répond "s'arrête" ça implique que `P(Q,Q)`="ne s'arrête pas"
fr: > - si `P(Q,Q)` répond "ne s'arrête pas" ça implique que `P(Q,Q)`="s'arrête"
fr: > 
fr: > Il y a donc une contradiction que le seul moyen de régler est par la non existence du programme P.

fr: Cette indécidabilité est vraiment la plus gênante de toute. 
fr: Elle signifie que l'on peut créer un objet dont on ne peut pas prédire le comportement quelque soit mes possibilité de contrôler cet objet.

fr: C'est simple, je suis le Démiurge de ce monde imaginaire. 
fr: Et même moi, je dois me soumettre à cette règle.
fr: Comme quoi, avoir la possibilité de créer le monde et la toute puissance sont deux choses différentes.

fr: newcorps

fr: # Que peut-on espérer ?


## Des bateaux à la rescousse de la *vérité*.

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

## Fractions rationnelles

fr: Utilisation des fractions rationnelles pour retrouver la formule exacte.
fr: Problème, on sait qu'on converge mais on ne sait pas quand.

