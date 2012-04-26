-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-09-28T12:21:41+02:00
en: title: Programming Language Experience
fr: title: Mon expérience avec les languages de programmation
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - programming
  - languages
  - C
  - C++
  - Java
  - haskell
  - Logo
  - Basic
-----
blogimage("dragon.jpg","Title image")

begindiv(intro)
en: %tldr My short and higly subjective feelings about programming languages I used.
fr: %tlal Mon avis court et hautement subjectif concernant les différents languages de programmations que j'ai utilisé.
enddiv

### `BASIC`

leftblogimage("basic.gif","Title image")

en: The language of my firsts programs!
en: I was about 10, with an `MO5` and `Amstrad CPC 6128` and even with my `Atari STe`.
en: This is the language of `GOTO`s.
en: Ô nostalgia.
en: Unfortunately this might be the only interesting part of this language.

fr: Ah ! Le language de mes premiers programmes ! 
fr: Je devais avoir 10-11 ans. 
fr: Sous `MO5`, `Amstrad CPC 6128` et même `Atari STe`.
fr: Le langage des `GOTO`s. 
fr: Je suis empleint de nostalgie rien que d'y penser. 
fr: C'est à peu prêt le seul intérêt de ce langage.

en: Today this language is obsolescent.
en: It is not even good to learn programming.
en: I know some compiler exists now.
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

en: I also remember I copied some game source code from some magazine.
en: Most lines were like:
fr: Je m'en souviens aussi pour avoir copier des codes de jeux vidéo à partir de magasines.
fr: La plupart des lignes ressemblaient à 

<code class="zsh">
3110 DATA FA,01,FF,FF,FF,FF,00,23,22,43,DA,DE,EE,FF,FF,FF,00,03,4A,F2
</code>

en: What a pleasure!
fr: Quel plaisir c'était !

### Logo

leftblogimage("dragon.jpg","Dragon fractal")

en: I was about 10 when I played with logo to draw on the computer.
fr: Toujours lors que j'avais 10 ans, on pouvait faire de petits programmes sympathiques.

en: I remember the Bach's music while the program loaded.
fr: Je me souviens que lors du chargement de l'application logo on avait droit à de la musique de Bach.

en: At that time we had to load the program into the memory using tapes. 
en: This one was a rare one. It didn't made an awfull 'Krrrkrr cssssss krrr' noise.
fr: Oui, il fallait charger le programme en mémoire avec une cassette. 
fr: Et elle ne faisait pas les 'Krrrkrr csssss krrrr'.

en: Some years after, I used it to learn programming to my college student.
en: It was really good as a first language.
en: Making fractals is like a game for children.
fr: Je l'avais utilisé sans les boucles.
fr: Des années plus tard, je le réutiliser pour faire de l'initiation à l'informatique à mes étudiants de DEUG MIAS première année. 
fr: Il s'est en fait révélé très utile. 
fr: Grace à lui, faire des fractales se révèle être un jeu d'enfant, au sens litéral. 
fr: Je ne peux que conseiller ce langage pour apprendre à programmer et aussi pour le fun.

en: Here is an example of code. It draws the dragon fractal.
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
en: I must confess I find it inferior to C.
en: I made graph algorithms, sort algorithms even some IA (genetic) algorithms.
en: In the end I prefer C.

fr: J'ai dû apprendre à programmer en Pascal aux alentour de 15 ans et je l'ai aussi réutiliser un peit peu en faculté. 
fr: Je dois avouer, que je le trouve inférieur au C en tous points.
fr: J'ai fait pas mal de chose avec ça, comme des algorithmes de graphes, des algorithmes de tri, et même un peu d'intelligence artificielle comme des algorithmes génétiques. 
fr: Mais je préfère largement le C.

### C

leftblogimage("C.jpg","Pointer representation from Dancing links")

en: The pointer's language.
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

en: It is very close to the machine while keeping sufficient abstractions to be fun.
fr: Il est très proche de la machine tout en ayant une abstraction suffisante pour ne pas être "trop"  désagréable.

en: I made a lot of program with it.
en: From sort algorithms to AI ones (SAT3), system, network prgramming, etc...
en: It is a very useful language that will help you understand how things works on your computer. 
en: Most modern computer language hide a lot of informations on what occurs. 
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

en: Until here I just described imperative languages without any object notion.
fr: Bon, oui, le Pascal, le C, le Basic (fortran, Cobol et autres) étaient tous des langages impératifs, sans notion d'objets.

en: More clearly, the language didn't helped you to structure your program.
fr: En gros, il n'y avait pas d'aide pour structurer votre code.

en: In order to limit the number of bugs, particularly for huge programs, we started to think about how to organize computer programs.
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

leftblogimage("cplusplus.jpg","Messy router")

fr: Le malpropre
en: The ugly

fr: Et oui l'industrie voulait un langage objet, mais elle n'était pas prête à mettre à la poubelle tout ses codes en C. 
fr: La solution, prendre C et lui rajouter une couche objet.
fr: Le problème avec C++ c'est qu'il fait trop de choses. 
fr: L'héritage multiple, des templates, etc...
fr: Bon, je l'ai quand même choisi pour faire le plus gros programme que j'ai jamais fais lors de ma thèse. 
fr: Et je dois avouer que l'expérience m'a plu. 
fr: Le seul reproche que j'ai à faire, c'est que la STL n'était pas aussi complète que l'on aurait pu l'espérer pour un détail. 
fr: On ne peut pas faire de `String<T>` pour autre chose que des `char16`. 
fr: Du coup, mon alphabet était limité à 2<sup>16</sup> lettres. 
fr: Hors, pour certaines application, l'alphabet doit être gigantesque. 
fr: 
fr: En conclusion je dirai que C++ est un très bon langage si vous vous fixez à l'avance un sous ensemble de ses fonctionnalités.
en: Industry wanted an Object Oriented Language without losing all their old C code.
en: Solution, keep C and add an Object layer on it.
en: My main concern about C++ is: it do too many things.
en: I appreciated multiple inheritance and templates.
en: In reality I liked a lot C++ while I was working alone. 
en: I used it to write `DEES` my main thesis software.
en: My only concern was about a lack in the STL.
en: In the doc, one could use `String<T>`. 
en: But in reality, T have to be only `char` or `char16`.
en: Then I had to reduce my alphabet to 2<sup>16</sup> letters.
en: Except for some application, the alphabet must be far larger than that.
en:  
en: To conclude, I'd say, C++ is very good if you work alone or with a fixed subset of its features.


### Eiffel

leftblogimage("eiffel.jpg","Eiffel tower construction")

fr: Bon, ok c'est un très beau langage objet. 
fr: Bien plus propre que C++. 
fr: Mais, à moins que les choses aient changées, il n'est pas très populaire. 
fr: Derrière lui il n'a pas la communauté de C++.
fr: Pour être franc, j'ai préféré travailler en C++. 
fr: J'ai menti à mes profs de l'époque pour leur faire plaisir.
fr: Lorsqu'on viens du C, il est désagréable de changer ses habitudes.
en: Yes, it is a really nice language. 
en: Full object in mind. Far cleaner than C++.
en: But it isn't so popular.
en: Behind C++ there is a large community to help new users and to write libraries.
en: Furthermore, I preferred working with C++.
en: At that time I programmed a lot with C and like its syntax.

### Java

leftblogimage("grail.jpg","Holy Grail from the Monty Python")

fr: On continue vers les langages objets. Alors, à une époque où j'en ai entendu parler, c'était _le Graal_ ! 
en: The first time I heard about Java it was _le Grail_!

fr: La portabilité, votre programme marchera partout. Il était orienté objet. Incrusté à l'intérieur il y avait des concepts d'architecture qui empêchent de faire n'importe quoi... Sauf que.
en: Perfect portability, your program will work on all platform. 
en: There was incrusted inside the language architecture concepts to help limit mistakes, and force you to use good programming habits. But...

fr: Sauf qu'il est incroyablement verbeux.
fr: Et que les limitations sont très désagréables si on sait ce que l'on fait.
en: But It is extremely verbose. 
en: And limitations are quite boring if you know what you're doing.

fr: Par exemple, il n'y a pas d'héritage multiple en Java. 
fr: Ce qui est en général un choix que je trouve cohérent s'il est bien appuyé par des systèmes qui compensent ce manque. 
fr: En java, il existe les interfaces. 
fr: Les interfaces permettent d'ajouter des méthodes à une classe. 
fr: En aucun cas on ne peut rajouter un attribut autrement qu'en héritant. 
fr: Cet état de fait m'a vraiment géné.
en: For example, there is no multiple inheritance. 
en: Generally it is a coherent choice when there are a way to compensate.
en: In Java, there are interfaces for this.
en: Except, interfaces can only add methods to a class.
en: You cannot add any attribute to a class except by subclassing.
en: I really lacked this feature.

fr: Typiquement je faisais une GUI en Java Swing. 
fr: J'avais créé mon propre système de notification entre objets. 
fr: Au début je considérais qu'un objet ne devait envoyer des notifications qu'à un seul objet. 
fr: Ô quelle erreur lorsque je réalisais qu'il fallait non plus gérer un seul objet mais parfois plusieurs. 
fr: Je changeais mon implémentation d'interface partout, conséquence, des copier/coller dans tous les sens pour mes classes. 
fr: Les copier/coller qui sont justement un problème censé être évité par les langages orientés objets.
en: I made a GUI using Java Swing and I created my own notification system between different element of the GUI.
en: Then, at the begining I only needed to send notification 1 to 1.
en: After some times, I needed to make 1 to many notifications.
en: And I add to make a bunch of copy/paste inside all my subclasses!
en: Copy/paste are exactly what should be avoided the most by object oriented languages.

fr: De plus toujours pour ma GUI, je devais évidemment gérer des threads. 
fr: Hors, il m'a fallu faire mon propre système de gestion de threads pour éviter les locks, pour les notifications (ce thread à fini, etc...). 
fr: À l'époque j'utilisais Java 1.5. 
fr: Normallement ce problème devait être réglé sur Java 1.6. 
fr: J'espère que c'est le cas, mais avoir ce type de "feature" essentielle oubliée par le langage était assez grave. 
en: Another thing: threads.
en: I was forced to make my own thread management system to avoid locks and notifications between threads (wait the end of this thread, ...).
en: At that time I used Java 1.5.
en: This problem should have been solved with Java 1.6.
en: I wish it is the case, but lacking such an essential feature for a language was very bad.

fr: De même, il a fallu attendre très longtemps avant d'avoir des boucles foreach qui rendent le code bien plus lisible.
en: In the same idea, it was very long to wait for the foreach loops.

fr: Bon, après cette expérience je déconseillerai Java.
fr: La portabilité, n'est pas si intéressante que ce qu'on pourrait croire.
en: After my experience, I don't recommend Java.
en: Portability does not worth this price.

fr: En ce qui concerne les GUI, portable signifie interface fonctionnelle mais médiocre sur toutes les plateformes. 
fr: Quelquesoit le système d'ailleurs (wxWidget, QT, etc...).
fr: Donc, pour des applications à distribuer à des tiers, c'est à éviter.
en: GUI protability means mediocre experience on all platforms.
en: Any system it might be (wxWidget, QT, etc...).

fr: Le système de Java est très clos. 
fr: Par contre il résoud un très bon problème. 
fr: Il permet à des développeurs médiocres de travailler en groupe sans faire trop de mal.
fr: Et un bon programmeur sera tout de même capable d'y faire des choses très intéressantes.
fr: Veuillez noter que je n'ai pas dit que les programmeurs Java sont de mauvais programmeurs, ce n'est pas ce que je pense.
en: The Java ideology is "closed". But it resolve a big problem.
en: It helps medium to low quality developper to work in team without the ability to make too much harm to the product.
en: A good programmer will be able to make very interresting things with it thought.
en: Please note I didn't say Java programmer are bad programmer.


### Objective-C

leftblogimage("xcode_logo.png","Xcode Logo")

fr: Le langage que je n'ai appris et utilisé que pour faire des applications sur les plateformes d'Apple(c). 
fr: J'ai appris Objective-C après Python. 
fr: Et je dois avouer que j'ai eu du mal à m'y mettre. 
fr: Je n'ai pas du tout aimé la syntaxe et pas mal d'autres détails. 
fr: Mais ça fait parti de ces langages que plus on utilise, plus on aime.
fr: En réalité, il y a quelque chose dans ce langage qui fait que tout est bien pensé.
fr: Mais surtout, ici, ce n'est pas le langage qui est la meilleure partie, c'est plutôt le framework Cocoa qui lui est le plus souvent associé qui est une merveille.
fr: Par rapport à tous les autres framework permettant de fabriquer des GUI, Cocoa est de très loin supérieur.
fr: Même si ça semble être des détails sur le papier, en pratique cela fait une grande différence.
en: The language I learned and used only to make application on Apple(c) platform.
en: I learned Objective-C just after Python.
en: It was hard to do it.
en: At first I didn't liked the syntax and many other details.
en: But it is this kind of language you like more and more you use it.
en: In fact, Objective-C is a simple language, but associated with the Cocoa framework it is a really good tool.
en: Cocoa is very different to other framework I used before. 
en: I find many of its idea extermely good. 
en: Both simple and efficient.
en: It might seems like small details on paper, but once you start using it, it make all the difference.

fr: Vraiment jusqu'ici, même si Objective-C reste assez bas niveau, le fait que le typage de ce langage soit dynamique est un vrai plus pour l'interface graphique.
fr: Je ne peux que vous encourager à vous accrocher à ce langage et de faire un vrai programme avec. Vous en serez certainement plus ravi qu'il n'y parrait eu début.
en: Even if Objective-C is a relatively low level language. 
en: Its dynamic typing ability make it very good for GUI programming.
en: I recommand to continue working with this language. 
en: In the end you'll certainely find it better than expected.

fr: ## Les langages interprétés modernes
en: ## Modern Scripting Languages

### PHP

leftblogimage("php.jpg","A Jacky Touch Car")

fr: Le petit langage de script que nous utilisions tous pour faire des sites web à l'époque des gifs animées !
en: This small script language that we used all to make our website in the time of animated gifs.

fr: Sympatique, mais sans plus. Apparemment il y a eu pas mal de progrès depuis PHP5, un jour peut-être que j'y reviendrai. Mais, il a derrière lui une réputation de langage pour les "scripts kiddies". 
fr: En gros ceux qui ne savent pas coder. 
fr: Des trous de sécurité de tous les cotés, etc...
en: Nice but no more. Apparently there were a lot of progress since PHP5. Maybe one day I'll use it again. But behind it, this language has a "script kiddies only" reputation.
en: Also long history of easy to make security holes.

fr: En réalité, PHP est au niveau d'abstration à peine supérieur au C. 
fr: Et donc, il est beaucoup moins bien organisé que des langages objets, favorisant ainsi la création de bug. 
fr: Pour les applications web, c'est un vrai problème.
en: In reality PHP is just behind C for the abstraction level. 
en: Therefore it has a lot of organisation problems and make it easier to create bugs.
en: For web applications it is a real problem.

fr: PHP, reste pour moi le langage de l'injection SQL. J'en fait encore un peu de temps en temps. Et j'ai moi-même dû protéger les accès au SQL pour éviter les injections. Oui, je n'ai pas trouvé de librairie toute prête pour protéger les entrées SQL. Je n'ai pas beaucoup cherché non plus.
en: PHP remains for me the SQL injection language.
en: I make a bit of PHP not so long ago, and it was a pain to protect my application to SQL injection. Yep, I didn't found any standard library to make this, but I didn't searched a lot.

### Python

leftblogimage("python.jpg","Python. Do you speak it?")

fr: Alors là, attention ! Révélation ! 
en: Revelation!

fr: Lorsqu'on avait l'habitude de travailler avec des langages compilé, type C++, Java et qu'on passe à Python, on se prend une claque magistrale. 
fr: La programmation comme elle doit être faite. 
fr: Tout est si naturel, c'est _magique_.
fr: Oui, c'est si bien que ça.
fr: Mais quelque chose d'aussi incroyablement bien doit avoir des inconvénients me dirais-vous.
en: When you were used to work with compiled languages (C++, Java) and you start learning Python, it's like a punch in the face.
en: Programming like it always should have been.
en: Everything is natural, it's _magic_.
en: Yes, as good as this.
en: But something so good must have some drawback.

fr: Et bien, oui, comme tous les langages de scripts de haut niveau, Python est _lent_. 
fr: Attention pas juste un peu lent, comme 2 fois plus lent que du C. 
fr: Non, de l'ordre de 10 à 20 fois plus lent que le C.
fr: Argh... Bon ça reste utilisable pour beaucoup de choses.
fr: Mais certaines application lui sont donc interdites.
en: And yes, like all interpreted languages, Python is _slow_.
en: Beware, no just a bit slow like 2 or 3 times slower than C. (like Java for example).
en: No, really slow, about 10 to 20 times slower than C.
en: Argh... Note it is completely usable for many things.

### Awk

fr: Des filtres de fichiers à faire.
fr: Si ce n'est pas trop compliqué, c'est le langage idéal.
fr: Vous avez un fichier et vous voulez savoir quels sont les mots les plus utilisés.
fr: Savoir combien de fois un mot est utilisé.
fr: Filtrer sous des condition un peu plus compliquées qu'un grep.
fr: Super outils. Je l'ai utilisé pour modifier en masse des centaines de fichier XML plus facilement qu'avec du XSLT.
en: If you have to "filter" some files and the filter is not too complicated awk is the ideal language to do this.
en: For example, if you want to know which words in a text file are most used. 
en: I used it to modify hundred of XML files in an easier manner than XSLT.


### Perl

fr: Perl c'est assez magique, mais la syntaxe est tellement désagréable à lire que personne ne peut vraiment aimer programmer dans un environnement de plusieurs personnes en Perl. 
fr: A moins que tous les autres soient des cadors du Perl. 
fr: Mais la feature qui tue, les expressions régulières :
en: Perl is magic, but the syntax is so hideous nobody can like to work in an environment with many different person in Perl.
en: Or at least, all other collaboratos must be excellent programmers.
en: But the very good feature is the integration of some perl syntax.


<code class="perl">
$var =~ s/toto/titi/g
</code>

fr: Va remplacer toto par titi dans la valeur de la variable `$var`.
fr: Et oui, les expressions régulière y sont intégrées directement comme avec `sed` et `awk`.
fr: Et ça rend le code beacoup plus compact (et parfois illisible). 
fr: Mais c'est vraiment pas mal.
fr: C'est une sorte de `awk` sous stéroides.
en: This program will replace every toto by titi inside the `$var` variable.
en: The Perl code is often very compact and usally unreadable.
en: But it is a language good to know.
en: It is a kind of `awk` under steroids.

### Ruby

fr: C'est une sorte de Perl en plus propre. 
fr: Un mélange de Perl et de Python. 
fr: Les notion objets y sont plus fortes qu'en Python. 
fr: Je l'ai beaucoup utilisé, je reste quand même un Pythoniste de préférence.
fr: Mais Ruby est vraiment très bien.
fr: Par contre en terme d'efficacité, c'est le pire langage utilisé par beaucoup de monde de ce point de vue.
fr: C'est le langage qui perd quasiment tous les benchmarks.
fr: Par contre c'est un outil parfait pour faire des prototypes.
fr: Et si vous voulez faire un prototype de site web, RoR est ce qui se fait de mieux.
fr: De l'idée au site, il ne se passera que peu de temps.
en: Ruby is a very good language. It is often compared (opposed ?) to Python.
en: There are the regular expression operators Perl inside the langage.
en: But the syntax is extremely clear, like in Python.
en: Many feature were inspired by functionnal programming (as in Python).
en: I used it a lot.
en: It is the worst language I know in term of efficiency.
en: This is the language that lose almost all benchmarks.
en: But it is the perfect tool for prototypes.
en: If you want to make a website prototype, RoR (Ruby on Rails) is certainly one of the best system known to mankind.
en: From idea to realisation, few time will occur. Make this site work for thousand of people, will, on the other hand, certainly require a lot of optimisations.

### Javascript

fr: C'est la bonne surprise. 
fr: Pendant des années, javascript était considéré comme un langage tout bon à vous embéter dans votre navigation web. 
fr: En réalité, javascript possède beaucoup de qualité des langages de haut niveau.
fr: En particulier, il est facille de passer une fonction en paramèter ou de créer des fonctions anonymes (closures). 
fr: Récemment, il est devenu très rapide et beaucoup de frameworks et de librairies naissent un peu partout.
en: It is the good surprise.
en: During years, javascript was considered as an annoying web experience language. 
en: In reality, javascript has many really good qualities.
en: Particularly, it is easy to pass a function in parameter and to create anonymous functions (closures).
en: Recently, javascript became far faster than before and many frameworks and libraries appears:

fr: - Il y a Cappuccino, Objective-J (comme de l'objective-C mais avec du javascript)
en: - Cappuccino, Objective-J (as in objective-C but with javascript)
- Sproutcore
- Spine.js
- Backbone.js
- jQuery
- prototype.js

fr: En particulier avec jQuery, on peut faire des appels chainés, très agréables à utiliser.
fr: Comme je le disais, c'est une bonne surprise, javascript a été choisi un peu au hasard lors de la création des navigateurs web comme langage de script. 
fr: Et il s'avère qu'à part sa syntaxe, tout le reste est bien. 
fr: Heureusement, en ce qui concerne la syntaxe, on peu pallier à ce problème en utilisant CoffeeScript.
en: Particularly with jQuery we can chain functions.
en: It is very nice to use.
en: As I said, this is a good surprise.
en: Javascript was chosen by chance as the script inside your navigator.
en: Instead of the java inspired syntax, everything else is very good.
en: In order to compensate the syntax, you can use CoffeScript.

fr: ## Les langages fonctionnels
en: ## Functional Languages

### CamL

fr: J'ai appris CamL à la fac, j'avais trouvé cette expérience très interressante.
fr: J'étais plutôt bon, et j'avais les bonnes intuitions mathématiques qui vont avec la programmation fonctionnelle.
fr: Mais je dois avouer que je ne l'ai plus jamais utilisé.
fr: Simplement, ce type de langage semble si loin de ce qui se fait pour fabriquer des produits que ça me donnais vraiment l'impression d'être un langage pour chercheurs.
en: I learned CamL during the college.
en: It was really interresting.
en: Functional programming is very different to imperative programming (most of popular languages).
en: I had good mathematic intuitions to use this language.
en: But I must confess I never used it for something serious.

### Haskell

fr: Je suis en train d'apprendre ce langage.
fr: Et je dois dire que c'est un vrai plaisir.
fr: En général les concepts derrière tous les langages de programmation  sont assez limités.
fr: Chaque langage y va de son petit lot de nouveau concepts, et en général en une après-midi, c'est appris.
fr: Pour haskell, c'est très différent.
fr: Je sens bien qu'il va me falloir plusieurs semaines pour maîtriser la bête.
fr: Ça doit faire quatre semaines que j'apprend haskell un peut tous les jours et je sais qu'il y a des notions que j'ai juste survollées et qui sont assez incroyables.
fr: Les Monades par exemple, est un concept que je n'avais jamais rencontré ailleurs.
fr: C'est un super concept.
fr: De plus le design du langage en fait un parfait système pour paralléliser les calculs naturellement.
fr: haskell sépare la partie "pure" de la partie "impure" de la programmation.
fr: À ma connaissance, c'est le seul langage de programmation qui fait ça.
fr: Enfin, je prend beaucoup de plaisir à apprendre ce langage.
fr: La communauté est aussi très acceuillante.
fr: Pas de "L0L! URAN00B!".
fr: Et aussi pas de concession du langage pour devenir populaire.
fr: Le langage est bon, voilà tout.
fr: Alors qu'en Java et C++, typiquement certain choix ont été fait en dépis du bon sens pour "faire plaisir".
en: I am still learning this language.
en: I must say it is a pleasure.
en: Generally it takes me no more than some hours to some days to learn a new programming language.
en: Concerning haskell, this is very different.
en: To master haskell you need to understand very hard concepts.
en: Monads and Arrows are some of them. 
en: I didn't understand them before I read some scientific paper.
en: Many week will be necessary to master it perfectly (if someone does).
en: Also the community is very friendly and nice. There is no "LOL! URAN00B! RTFM!"
en: And no concession has been made to make this language more popular (I'm looking at you C++, Java and Javascript). 
en: This langage remain pure (I know there are two meaning).

fr: ## Langages originaux
en: ## Unpopular Languages

### Metapost

fr: Metapost est un langage qui permet de programmer des dessins.
fr: Le gros plus de metapost, c'est sa capacité de résoudre automatiquement les systèmes d'équations linéaires.
fr: Par exemple, si vous écrivez :
en: Metapost is a language to program drawings.
en: What make metapost very good? 
en: It contains a linear solver.
en: This is really useful to draw things.
en: For example if you write:

<code class="ruby">
AA=1/3[A,B]
</code>

fr: Il va position le point `AA` entre `A` et `B`.
fr: Plus précisément, au barycentre `(2A + B)/3`.
en: It will place the point `AA` between the point `A` and `B`.
en: More precisely at the barycenter `(2xA + B)/3`.

<code class="ruby">
X=whatever[A,B]
X=whatever[C,D]
</code>

fr: Ce deuxième exemple positionne `X` à l'intersection des deux segments `AB` et `CD`.
fr: Vous pouvez aussi voir pas mal d'[exemples ici](http://tex.loria.fr/prod-graph/zoonekynd/metapost/metapost.html).
en: This second example, will place the point X at the intersection of the two segments `AB` and `CD`.
fr: You could see [more example there](http://tex.loria.fr/prod-graph/zoonekynd/metapost/metapost.html).

fr: Cette fonction est très utile. 
fr: Et à mon avis pas seulement pour afficher des choses.
fr: De mon point de vue, les autres langages de programmation devraient penser à rajouter les résolutions automatiques simples.
en: This feature is very helpful, and not only to draw things. 
en: Most programming language should think about adding it.

### zsh 

fr: Oui, zsh est un shell.
fr: Mais c'est aussi un langage de script très bien adapté aux traitement de fichiers.
fr: Je le recommande chaudement.
fr: C'est pour l'instant le meilleur shell que j'ai utilisé. Je le préfère au bash.
en: Yes, zsh is a shell.
en: But it is also a script language extremly well suited to file management.
en: For now, it is the best shell I used. I prefer zsh to bash.

### Prolog

fr: Je n'ai jamais rien fait de conséquent avec Prolog, mais j'ai adoré l'apprendre et l'utiliser.
fr: J'ai eu la chance d'apprendre Prolog par [Alain Colmerauer](http://alain.colmerauer.free.fr/) lui-même.
fr: C'est un langage qui essaye de résoudre les contraintes autant qu'il le peut pour vous.
fr: Il en ressort un impression de magie.
fr: On ne fait que décrire ce qu'il faut et on ne donne pas d'ordre.
fr: Un peu comme la programmation fonctionnelle mais en beaucoup plus puissant.
en: I never made something serious with Prolog, but I really loved to use and learn it. 
en: I had the chance to learn Prolog with [Alain Colmerauer](http://alain.colmerauer.free.fr/) himself.
en: This language try to resolve constraints as much as it can.
en: It has a magic feeling when you use it.
en: We only write constraints, we never put order.
en: A bit like functional programming but far more powerful.

fr: ## Les langages à découvrir
en: ## Languages to discover

fr: Il reste encore pas mal de langages et de framework à essayer.
fr: Actuellement je pense que je vais passer un moment avec haskell.
fr: Peut-être demain que j'irai apprendre LISP, Scala ou Erlang.
fr: Comme je suis plus dans la création de site web, j'irai certainement jeter un coup d'œil à clojure aussi.
fr: Et certainement beaucoup d'autres choses.
en: Many languages and framework remains to be learnt and tried.
en: Actually I believe I will stay a while with haskell.
en: Maybe tomorrow I will look at LISP, Scala or Erlang.
en: I also certainly look at clojure to make web application.

fr: Dites moi si vous avez une autre expérience avec ces langages de programmation.
fr: Évidement mes impression sont hautement subjectives. 
fr: Cependant, j'ai utilisé tous les langages dont j'ai parlé.
en: Tell me if you have any other experience with these programming languages.
en: Of course, my feelings are highly subjectives.
en: But I used all of these languages.


*[STL]: Standard Tempate Library
*[GUI]: Graphic User Interface
