-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-06-07T12:21:41+02:00
en: title: programming language experience
fr: title: programming language experience
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)
en: <%=tldr%> My feelings about programming languages I used.
fr: <%=tlal%> Mon avis sur les différents languages de programmations que j'ai utilisé.
enddiv

### BASIC

en: The language of my firsts programs!
en: I was about 10, with an `MO5` and `Amstrad CPC 6128` and even with my `Atari STe`.
en: This is the language of `GOTO`s.
en: Ô nostalgia.
en: Unfortunately this might be the only intersting part of this language.

fr: Ah ! Le language de mes premiers programmes ! 
fr: Je devais avoir 10-11 ans. 
fr: Sous `MO5`, `Amstrad CPC 6128` et même `Atari STe`.
fr: Le langage des `GOTO`s. 
fr: Je suis empleint de nostalgie rien que d'y penser. 
fr: C'est à peu prêt le seul intérêt de ce langage.

en: Today this language is obsolescent.
en: It not even a good language to learn programming.
en: I know there exist some compiler now.
en: But this is not enough to try to learn it.

fr: Aujourd'hui ce langage est tombé en désuétude.
fr: Ce n'est ni un bon langage pour apprendre, ni un bon langage pour faire de vrai programmes. 
fr: Même si quelques années plus tard, je me remettais à programmer dans un basic avec un compilateur qui pourrait lui redonner vie. 
fr: Je m'en était servi pour faire un livre dont vous êtes le héro :-).

<code class="zsh">
READY
10 PRINT "HELLO WORLD!"
20 GOTO 10
RUN
</code>

en: I remember also to had copyied some game source code from some magazine.
en: Most lines were like:
fr: Je m'en souviens aussi pour avoir copier des codes de jeux vidéo à partir de magasines.
fr: La plupart des lignes ressemblaient à 

<code class="zsh">
3110 DATA FA,01,FF,FF,FF,FF,00,23,22,43,DA,DE,EE,FF,FF,FF,00,03,4A,F2
</code>

en: What a pleasure!
fr: Quel plaisir c'était !

### Logo

<%=leftblogimage("dragon.jpg","Dragon fractal")%>
en: Also when I was about 10. 
en: I played with logo to draw on the computer.
fr: Toujours lors que j'avais 10 ans, on pouvait faire de petits programmes sympathiques.

en: I remember the Bach's music while the program loaded.
fr: Je me souviens que lors du chargement de l'application logo on avait droit à de la musique de Bach.

en: Yes, at that time we had to load the program into the memory using tapes. 
en: This one was a rare one that didn't made an awfull 'Krrrkrr cssssss krrr' noise.
fr: Oui, il fallait charger le programme en mémoire avec une cassette. 
fr: Et elle ne faisait pas les 'Krrrkrr csssss krrrr'.

en: I used them without any loop.
en: Some years after, I had used it to learn programming to my college students.
en: In fact it was really good as first language.
en: Making fractals is like a game for children.

fr: Je l'avais utilisé sans les boucles.
fr: Des années plus tard, je le réutiliser pour faire de l'initiation à l'informatique à mes étudiants de DEUG MIAS première année. 
fr: Il s'est en fait révélé très utile. 
fr: Grace à lui, faire des fractales se révèle être un jeu d'enfant, au sens litéral. 
fr: Je ne peux que conseiller ce langage pour apprendre à programmer et aussi pour le fun.

en: Here is an example of code that results in the dragoon fractal.
fr: Voici un exemple de code et le résultat est la jolie fractale 'dragon'.

<code class="zsh">
HIDETURTLE

PENUP
SETXY -200 0
RIGHT 90
PENDOWN

to dragon :degree :size
    setpensize 1
    if :size>5  [setpensize 2]
    if :size>10 [setpensize 3]
    if :size>20 [setpensize 4]
    if :size>40 [setpensize 5]
    ifelse :degree=0 [ 
        fd :size 
    ][
        left  45 dragon (:degree-1) (size/4)
        right 90 dragon (:degree-1) (size/2)
        left  90 dragon (:degree-1) (size/4)
        right 45
    ]
end

dragon 6 3000
</code>

### Pascal

en: The always second.
fr: L'éternel numéro 2.

en: I made my firsts real serious program with Pascal.
en: I must confess I found it inferior to C.
en: I made graph algorithms, sort algorithms even some IA like genetic algorithms.
en: In the end I prefer C.

fr: J'ai dû apprendre à programmer en Pascal aux alentour de 15 ans et je l'ai aussi réutiliser un peit peu en faculté. 
fr: Je dois avouer, que je le trouve inférieur au C en tous points.
fr: J'ai fait pas mal de chose avec ça, comme des algorithmes de graphes, des algorithmes de tri, et même un peu d'intelligence artificielle comme des algorithmes génétiques. 
fr: Mais je préfère largement le C.

### C

en: The language of pointers.
fr: Le langage des pointeurs

en: _Le_ programming language.
fr: Ah, _le_ langage de programmation par excellence. 

en: Once you understand loops and recursivity.
en: It is time to make things serious.
en: If you want to have good quality code, knowing C is almost mandatory.
fr: Une fois que vous avez compris les boucles et la récursivité. 
fr: Il est temps de passer aux choses sérieuses.
fr: Si vous voulez avoir du code de bonne qualité, alors apprendre le C est quasi-obligatoire.

en: This language is close to machine language.
en: So much, there is (mostly) a linear relation between the size of your code and the size of the compiled one.
fr: Ce langage est très proche du langage machine. 
fr: En particulier, (la majorité du temps). 
fr: Il y a une relation linéaire entre la taille du code en C et de son résultat compilé en assembleur.

en: In short, each time you write a C instruction there won't be anything strange that will occurs, like starting a long algorithm behind the scene.
fr: Ça signifie qu'à chaque fois que vous écrivez une ligne de C, il ne va pas se passer de choses toutes bizarres comme lancer un algorithme qui va prendre deux plombes.

en: It is very close to the machine while keeping a sufficient abstraction to be fun.
fr: Il est très proche de la machine tout en ayant une abstraction suffisante pour ne pas être "trop"  désagréable.

en: I made a lot of program with it.
en: From sort algorithms to AI ones (SAT3), system, network prgramming, etc...
en: It is a very useful language that will help you understand how things works on your computer. 
en: Most modern computer language hide a lot of informations. 
en: This is not the case with C.
fr: J'ai fait beaucoup de choses avec. 
fr: Tous les algorithmes de tri, des algorithmes d'intelligence artificielle (résolution de SAT3), du système, du réseau etc...
fr: Bref il est versatile, et on ne peut pas dire que l'on sait programmer si on ne s'est jamais mis à programmer sérieusement en `C`.

### ADA

en: The super-clean one.
fr: Le langage super-propre. 

en: I liked ADA. I must confess I didn't used it a lot.
en: May be one day I will try it again.
en: I was impressed by asynchronous programming with it.
en: What you need to know is this old language had certainly inspired most new object oriented languages.
fr: J'avais bien aimé ADA, mais j'avoue que ça n'a duré que le temps d'un semestre de cours. 
fr: Peut-être qu'un jour je m'y remettrai. 
fr: Disons qu'il est assez vieux et qu'il a inspiré la plupart des concepts objets.

en: ## Object Oriented Languages
fr: ## Les langages orientés objets

en: Until here I just described imperatives languages without any object notion.
fr: Bon, oui, le Pascal, le C, le Basic (fortran, Cobol et autres) étaient tous des langages impératifs, sans notion d'objets.

en: More clearly, the language didn't helped you to structure your program.
fr: En gros, il n'y avait pas d'aide pour structurer votre code.

en: In order to limit the number of bugs, particularly for huge programs, we started to thing about how to best organize computer programs.
en: In the end, from the imperatives language culture, it produced the Object Oriented programming (OOP).
en: Beware, the Object Oriented programming isn't a miracle. Proof? How many bug-free software do you use?
en: Furthermore, OOP doesn't fit all problems.
en: But to make a bank application, an application which help to manage stock, clients or text archives.
en: I mean an information system, the OOP is not so bad.

fr: Alors, pour aider à limiter le nombre de bug, en particulier pour la création de très gros programmes, on s'est mis à réfléchir à la meilleure façon d'organiser du code d'ordinateur.
fr: À la fin, ça à donné la programmation orienté objet. Et donc les langages comme le C manquaient de système pour aider au développement orienté objet.
fr: Attention, la programmaiton orienté objet n'est pas la panacée. Combien de programme utilisez-vous qui n'ont pas de bug ?
fr: Et ça ne convient pas à tous les type de problème. 
fr: Mais pour faire une application banquaire, un système de gestion des stocks, des clients ou des archives. 
fr: C'est-à-dire un système d'information, c'est pas trop mal.

en: Then Object Oriented Languages appeared everywhere.
fr: Donc les langages orientés objets se sont mis à fleurir.

### C++

fr: Le malpropre
en: The ugly

Et oui l'industrie voulait un langage objet, mais elle n'était pas prête à mettre à la poubelle tout ses codes en C. 
La solution, prendre C et lui rajouter une couche objet.
Le problème avec C++ c'est qu'il fait trop de choses. 
L'héritage multiple, des templates, etc...
Bon, je l'ai quand même choisi pour faire le plus gros programme que j'ai jamais fais lors de ma thèse. 
Et je dois avouer que l'expérience m'a plûe. 
Le seul reproche que j'ai à faire, c'est que la STL n'était pas aussi complète que l'on aurait pû l'espérer pour un détail. 
On ne peut pas faire de String<X> pour autre chose que des Char16. 
Du coup, mon alphabet était limité à 2^16 lettres. 
Hors, pour certaines application, l'alphabet doit être gigantesque. 

### Eiffel

Bon, ok c'est un très beau langage objet. 
Bien plus propre que C++. 
Mais, à moins que les choses aient changées, il n'est pas très populaire. 
Derrière lui il n'a pas la communauté de C++.
Pour être franc, j'ai préféré travailler en C++. 
J'ai menti à mes profs de l'époque pour leur faire plaisir.
Lorsqu'on viens du C, il est désagréable de changer ses habitudes.

### Java

On continue vers les langages objets. Alors, à une époque où j'en ai entendu parler, c'était _le Graal_ ! 

La portabilité, votre programme marchera partout. Il était orienté objet. Incrusté à l'intérieur il y avait des concepts d'architecture qui empêchent de faire n'importe quoi... Sauf que.

Sauf qu'il est incroyablement verbeux.
Et que les limitations sont très désagréables si on sait ce que l'on fait.

Par exemple, il n'y a pas d'héritage multiple en Java. 
Ce qui est en général un choix que je trouve cohérent s'il est bien appuyé par des système qui compensent ce manque. 
En java, il existe les interfaces. 
Hors, les interfaces sont un moyen d'ajouter simplement des méthodes à une classe. 
En aucun cas on ne peut rajouter un attribut. 
Ce qui m'a vraiment géner pour faire une interface graphique par exemple.
Typiquement je faisais une GUI en Java Swing, et j'avais créé mon propre système de notification entre objets de GUI. 
Alors, au début je considérais qu'un objet ne devais envoyer des notifications qu'à un seul objet. 
Ô quelle erreur lorsque je réalisais qu'il fallait non plus gérer un seul objet mais parfois plusieurs. 
Je changeais mon implémentation d'interface partout, conséquence, des copier/coller dans tous les sens pour mes classes. 
Les copier/coller qui sont justement un problème censé être évité par les langages orientés objets.

De plus toujours pour ma GUI, je devais évidemment gérer des threads. 
Hors, il m'a fallu faire mon propre système de gestion de threads pour éviter les locks, pour les notifications (ce thread à fini, etc...). 
À l'époque j'utilisais Java 1.5. 
Normallement ce problème devait être réglé sur Java 1.6. 
J'espère que c'est le cas, mais avoir ce type de "feature" essentielles oubliées par le langage était assez grave. 

De même, il a fallu attendre très longtemps avant d'avoir des boucles foreach qui rende le code bien plus lisible.

Bon, après cette expérience je déconseillerai Java.
La portabilité, n'est pas si intéressante que ce qu'on pourrait croire.

En ce qui concerne les GUI, portable signifie interface fonctionnelle mais médiocre sur toutes les plateformes. 
Quelquesoit le système d'ailleurs (wxWidget, QT, etc...).
Donc, pour des applications à distribuer à des tiers, c'est à éviter.

Le système de Java est très clos. 
Par contre il résoud un très bon problème. 
Il permet à des développeurs médiocre de travailler en groupe sans faire trop de mal.
Et un bon programmeur sera tout de même capable d'y faire des choses très intéressantes.

### Objective-C

Le langage que je n'ai appris et utilisé que pour faire des applications sur les plateformes d'Apple(c). 
J'ai appris Objective-C après Python. 
Et je dois avouer que j'ai eu du mal à m'y mettre. 
Je n'ai pas du tout aimé la syntaxe et pas mal d'autres détails. 
Mais ça fait parti de ces langages que plus on utilise, plus on aime.
En réalité, il y a quelque chose dans ce langage qui fait que tout est bien pensé.
Mais surtout, ici, ce n'est pas le langage qui est la meilleure partie, c'est plutôt le framework Cocoa qui lui est le plus souvent associé qui est une merveille.
Par rapport à tous les autres framework permettant de fabriquer des GUI, Cocoa est de très loin supérieur.
Même si ça semble être des détails sur le papier, en pratique cela fait une grande différence.

Vraiment jusqu'ici, même si Objective-C reste assez bas niveau, le fait que le typage de ce langage soit dynamique est un vrai plus pour l'interface graphique.
Je ne peux que vous encourager à vous accrocher à ce langage et de faire un vrai programme avec. Vous en serez certainement plus ravi qu'il n'y parrait eu début.

## Les langages de scripts

### PHP

Le petit langage de script que nous utilisions tous pour faire des sites web à l'époque des gifs animées !

Sympatique, mais sans plus. Apparemment il y a eu pas mal de progrès depuis PHP5, un jour peut-être que j'y reviendrai. Mais, il a derrière lui une réputation de langage pour les "scripts kiddies". 
En gros ceux qui ne savent pas coder. 
Des trous de sécurité de tous les cotés, etc...

En réalité, PHP est au niveau d'abstration à peine supérieur au C. Et donc, il est beaucoup moins bien organisé que des langages objets, favorisant ainsi la création de bug. Pour les applications web, c'est un vrai problème.

PHP, reste pour moi le langage de l'injection SQL. J'en fait encore un peu de temps en temps. Et j'ai moi-même dû protéger les accès au SQL pour éviter les injections. Oui, je n'ai pas trouvé de librairie toute prête pour protéger les entrées SQL. Je n'ai pas beaucoup cherché non plus.

### Python

Alors là, attention ! Révélation ! 
Lorsqu'on avait l'habitude de travailler avec des langages compilé, type C++, Java et qu'on passe à Python, on se prend une claque magistrale. 
La programmation comme elle doit être faite. 
Tout est si naturel, c'est _magique_.
Oui, c'est si bien que ça.
Mais quelque chose d'aussi incroyablement bien doit avoir des inconvénients me dirais-vous.

Et bien, oui, comme tous les langages de scripts de haut niveau, Python est _lent_. 
Attention pas juste un peu lent, comme 2 fois plus lent que du C. 
Non, de l'ordre de 10 à 20 fois plus lent que le C.
Argh... Bon ça reste utilisable pour beaucoup de choses.
Mais certaines application lui sont donc interdites.

### Awk

Des filtres de fichiers à faire.
Si ce n'est pas trop compliqué, c'est le langage idéal.
Vous avez un fichier et vous voulez savoir quels sont les mots les plus utilisés.
Savoir combien de fois un mot est utilisé.
Filtrer sous des condition un peu plus compliquées qu'un grep.
Super outils. Je l'ai utilisé pour modifier en masse des centaines de fichier XML plus facilement qu'avec du XSLT.

: Perl
Perl c'est assez magique, mais la syntaxe est tellement désagréable à lire que personne ne peut vraiment aimer programmer dans un environnement de plusieurs personnes en Perl. A moins que tous les autres soient des cadors du Perl. Mais la feature qui tue, les expressions régulières :

<code class="perl">
$var =~ s/toto/titi/
</code>

Va remplacer toto par titi dans la valeur de la variable $var. Et oui, les expressions régulière y sont intégrées directement comme avec `sed` et `awk`. Et ça rend le code beacoup plus compact (et parfois illisible). Mais c'est vraiment pas mal. C'est une sorte de `awk` sous stéroides.

: Ruby
C'est une sorte de Perl en plus propre. 
Un mélange de Perl et de Python. 
Les notion objets y sont plus fortes qu'en Python. 
Je l'ai beaucoup utilisé, je reste quand même un Pythoniste de préférence.
Mais Ruby est vraiment très bien.
Par contre en terme d'efficacité, c'est le pire langage utilisé par beaucoup de monde de ce point de vue.
C'est le langage qui perd quasiment tous les benchmarks.
Par contre c'est un outil parfait pour faire des prototypes.
Et si vous voulez faire un prototype de site web, RoR est ce qui se fait de mieux.
De l'idée au site, il ne se passera que peu de temps.

: Javascript

C'est la bonne surprise. 
Pendant des années, javascript était considéré comme un langage tout bon à vous embété dans votre navigation web. En réalité, javascript possède beaucoup de qualité des langages de haut niveau. En particulier, il est facille de passer une fonction en paramèter ou de créer des fonctions anonymes (closures). Récemment, il est devenu très rapide et beaucoup de frameworks naissent un peu partout.

    - Il y a Cappuccino, Objecte-J (comme de l'objective-C mais avec du javascript)
    - Sproutcore
    - Spine.js
    - Backbone.js
    - jQuery
    - prototype.js

    En particulier avec jQuery, on peut faire des appels chainés, très agréables à utiliser.
    Comme je le disais, c'est une bonne surprise, javascript a été choisi un peu au hasard lors de la création des navigateurs web comme langage de script. Et il s'avère qu'à part sa syntaxe, tout le reste est bien. Heureusement, en ce qui concerne la syntaxe, on peu pallier à ce problème en utilisant CoffeeScript.

## Les langages fonctionnels

: CamL

J'ai appris CamL à la fac, j'avais trouvé cette expérience très interressante. J'étais plutôt bon, et j'avais les bonnes intuitions mathématiques qui vont avec la programmation fonctionnelle. Mais je dois avouer que je ne l'ai plus jamais utilisé. Simplement, ce type de langage semble si loin de ce qui se fait pour fabriquer des produits que ça me donnais vraiment l'impression d'être un langage pour chercheurs.

: Haskell

Je suis en train d'apprendre ce langage. Et je dois dire que c'est un vrai plaisir. En général les concepts derrière tous les langages de programmation  sont assez limités. Chaque langage y va de son petit lot de nouveau concepts, et en général en une après-midi, c'est appris.
Pour haskell, c'est très différent. Je sens bien qu'il va me falloir plusieurs semaines pour maîtriser la bête. Ça doit faire quatre semaines que j'apprend haskell un peut tous les jours et je sais qu'il y a des notions que j'ai juste survollées et qui sont assez incroyables.
Les Monades par exemple, est un concept que je n'avais jamais rencontré ailleurs. C'est un super concept. De plus le design du langage en fait un parfait système pour paralléliser les calculs naturellement. haskell sépare la partie "pure" de la partie "impure" de la programmation. À ma connaissance, c'est le seul langage de programmation qui fait ça. Enfin, je prend beaucoup de plaisir à apprendre ce langage. La communauté est aussi très acceuillante. Pas de "L0L! URAN00B!". Et aussi pas de concession du langage pour devenir populaire. Le langage est bon, voilà tout. Alors qu'en Java et C++, typiquement certain choix ont été fait en dépis du bon sens pour "faire plaisir". 

## Langages originaux

En plus des langages de programmation proprement dit, il existe des langages dont le seul but et de créer des documents.

: MetaPost
Metapost est un langage qui permet de programmer des dessins.
Le gros plus de metapost, c'est qu'il y a un solveur d'équations linéaires. Ainsi on peut faire des choses assez impressionnantes, comme laisser une petite distance entre les flèches et les bords. Ou encore les têtes des flèches se courbent.
Très sympatique à utiliser.

: zsh 
Oui, zsh est un shell. Mais c'est aussi un langage de script très bien adapté aux traitement de fichiers. Je le recommande chaudement. C'est pour l'instant le meilleur shell que j'ai utilisé. Je le préfère au bash.

: Prolog
Je n'ai jamais rien fait de conséquent avec Prolog, mais j'ai adoré l'utiliser. C'est un langage qui essaye de résoudre les contraintes autant qu'il le peut pour vous. C'est assez magique. On ne fait que décrire ce qu'il faut et on ne donne pas d'ordre. Un peu comme la programmation fonctionnelle mais en beaucoup plus puissant.

## Les langages à découvrir

Il reste encore pas mal de langages et de framework à essayer. Actuellement je pense que je vais passer un moment avec haskell. Peut-être demain que j'irai voir du LISP, Scala ou Erlang. Comme je suis plus dans la création de site web, j'irai certainement jeter un coup d'oeil à clojure aussi. Et certainement beaucoup d'autres choses.

Dites-moi si vous avez une autre expérience avec ces langages de programmation. Je ne donne que mes impressions. En tout cas je les ai tous utilisés.
