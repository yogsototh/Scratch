-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-10-04T10:18:59+02:00
en: title: Yesod excellent ideas
fr: title: Les idées de yesod
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)

en: <%= tldr %>

fr: <%= tlal %>

en: I follows the [yesod web framework](http://www.yesodweb.com) for some times now. And I believe it reached the point where you should really consider to use it. But instead of telling you why you should learn Haskell and use yesod, I prefer to talk about new ideas used by yesod I didn't saw in other frameworks.
fr: Cela fait un moment que je suis la progression du [framework yesod](http://www.yesodweb.com). 
fr: À mon humble avis on peut commencer à l'utiliser pour des applications sérieuses (comprendre en prod).
fr: Je pourrai vous dire pourquoi vous devriez considérer d'utiliser ce framework.
fr: Mais je préfère vous parler de deux bonnes idées (parmi d'autres) de yesod que je n'avais jamais vu ailleurs.

enddiv

en: ## Type safety
fr: ## Types saufs
   
en: Let's start by an obligatory link from [xkcd](http://xkcd.com):
fr: Commençons par une BD d'[xkcd](http://xkcd.com) :

   ![SQL injection by a mom](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)

en: When you create a web application, a lot of time is spent dealing with strings.
en: Strings for URL, HTML, JavaScript, CSS, SQL, etc...
en: To prevent malicious usage you have to protect each strings to be sure, no script will pass from one point to another.
en: Suppose a user enter this user name:
fr: Lorsque vous créez une application web, beaucoup de temps est passé à s'occuper de chaînes de caractères.
fr: Des chaînes de caractère pour les URL, le HTML, le Javascript, les CSS, les requêtes SQL, etc...
fr: Pour éviter des utilisation malicieuses vous devez protéger chaque chaîne de caractère entre chaque étape.
fr: Par exemple supposons que vous entriez comme nom :

<code class="javascript">
Newton<script>alert("An apple fall")</script>
</code>

en: You must transform each `<` into `&lt;`.
en: Without this transformation alert will appear each time you try to display this user name.
en: Safe types are the chains around all strings you'll use.
fr: Sans une protection correcte, le message "An apple fall" sera affiché à chaque fois que quelqu'un essayera d'accéder au nom de cet utilisateur.
fr: Les "types saufs" sont le [tonyglandil du web](https://www.youtube.com/watch?v=1IWF3IsEPBE).

en: Yesod does its best to handle cross scripting issues. Both between the client and the server and between the server and your DB.
en: Here is an example:
fr: Yesod fait de son mieux pour typer les objets manipulés et ainsi il fera ce qu'il faut pour ne pas mettre du script dans une URL par exemple.

<code class="html"><a href=@[AnotherPageR]>Go to the other page
</code>

en: As `AnotherPageR` is of type URL and it could not contains something nefarious.
en: It will be an URL safe. Not something like:

<code class="html">
falselink"><script> bad_code(); </script><a href="pipo
</code>

en: Type safety is not magic, but it will help a lot resolving these issues.
fr: Les types saufs ne sont pas magiques, mais ils aident beaucoup à résoudre ces problèmes.

en: ## Widgets
fr: ## Les widgets

en: Yesod widget are different from just JavaScript widget.
en: In yesod widget are a set of small parts of a web application.
en: A bit of CSS, a bit of HTML and a bit of JS for example.
en: If you want to use many widgets in a same page yesod do the work.
en: Some examples of widgets are:
fr: Les widgets de yesod sont différents des widgets Javascripts (ou java).
fr: Pour yesod un widget est un ensemble de morceaux d'appli web. Un bout de CSS, un bout de javascript, un bout d'HTML.
fr: Et si dans une page on veut utiliser plusieurs widgets, alors yesod s'occupe de les faire fonctionner tous les deux.
fr: Des exemples de widgets (au sens yesod) sont :

en: - the footer of a webpage,
en: - the header of a webpage with a menu,
en: - a button which appears only when scrolling down, 
en: - etc...
fr: - Le «footer» d'une page web,
fr: - Le «header» d'une page web,
fr: - un bouton qui apparaît lorsque l'on «scrolle» vers le bas,
fr: - etc...

en: For each of this part, you might need, 
fr: Pour chacun de ces widgets vous pourriez avoir besoin de

en: - a bit of HTML, 
en: - a bit of CSS and 
en: - a bit of javascript.
fr: - un peu d'HTML
fr: - un peu de CSS et
fr: - un peu de javascript

en: Some in the header, some in the body.
fr: Et certain morceau doivent être placés dans le «header» de la page et d'autre dans le «body».


en: You can declare a widget as this (note I use a very high meta-language):
fr: Vous pouvez déclarer un widget comme suit (je n'utilise pas la vrai syntaxe) :

    htmlheader = ...
    cssheader = ...
    javascriptheader = ...
    htmlbody = ...

en: The real syntax is:
fr: La vraie syntaxe est :

<code class="haskell">
toWidgetHeader cassiusFile "button.cassius"
toWidgetHeader juliusFile "button.julius"
toWidget       hamletFile "buttonTemplate.hamlet"
</code>

en: Note the awesome Shakespearean inspired name convention.
en: Another good reason to use yesod.
fr: Veuillez aussi noté la convention Shakespearienne des noms.
fr: Encore une bonne raison d'utiliser yesod.

en: - Cassius _&_ Lucius of CSS (a lot similar to SASS and SCSS),
en: - Julius for JavaScript (not a CoffeeScript is somewhere in the source of yesod),
en: - Hamlet for HTML (similar to haml)
fr: - Cassius _&_ Lucius pour le CSS (très similaire à SASS et SCSS)
fr: - Julius pour le javascript (notons qu'il existe aussi un CoffeeScript qui traîne dans les sources de yesod)
fr: - Hamlet pour l'HTML (similaire à haml)

en: And when your page render, yesod make it easy to render everything nicely:
fr: Lorsque vous générez votre page, yesod se débrouille pour que tout fonctionne ensemble:

<code class="haskell">
myBigWidget =  menuWidget >> contentWidget >> footerWidget
</code>

en: Furthermore, if you use say 10 widgets each with a bit of CSS, yesod will create a unique and compressed CSS file. Except if you expressed a need to change the header by using different CSS. 
fr: De plus, si vous utilisez 10 widgets avec un peu de CSS, yesod fabriquera un unique fichier CSS pour vous. Bien entendu si vous préférez avoir une dizaine de fichier CSS vous pouvez aussi le faire.

en: This is just awesome!
fr: C'est juste génial !

en: ## Optimized routing
fr: ## Routage optimisé

en: In standard routing system you have for each entry a couple: regexp → handler
fr: Dans un système de routage standard (à la ruby on rails par exemple) vous avez pour chaque entrée un couple: regexp → handler

en: The only way to discover the right rules is to match each regexp to the current URL. Then you can see behaviour such as, if you change the order of the rules you can lose or win time.
fr: La seule façon de découvrir la bonne règle est d'essayer de matcher l'url demandée à chaque expression régulière.

en: On the other hand yesod compile the routes. Therefore it can optimize it.
en: Of course two routes must not interfere.
fr: Au lieu d'essayer chaque expression régulière, yesod regroupe et compile les routes pour les optimiser.
fr: Bien entendu pour pouvoir profiter de cet avantage au mieux, il ne faut pas que deux routes interfèrent entres elles.

<code class="html">
/blog/2003  Date2003R
/blog/$DATE DateR
</code>

en: is invalid by default (you can make it valid, but I don't think it is a good idea).
fr: Cette définition de route est invalide par défaut dans yesod.
fr: Si vous voulez vraiment vous pouvez le faire foncionner quand même, mais il me semble que ça doit être quasiment toujours une mauvaise idée.

en: You'd better
fr: Il vaut mieux faire :

<code class="html">
/blog/$DATE DateR
</code>

en: and make the test inside the handler
fr: et faire le test "est-ce que date = 2003 ?" dans le «handler».

en: ## Why yesod?
fr: ## Pourquoi yesod?

en: From a very subjective point of vue and from what I heard, Haskell is a node.js done as it should be.
fr: D'un point de vu très subjectif et de ce que j'ai lu. 
fr: Haskell est un node.js fait en beaucoup mieux.


en: 1. _Speed_. This is just astounding. Look at [this](http://snapframework.com/blog/2010/11/17/snap-0.3-benchmarks) and then to [this](http://www.yesodweb.com/blog/2011/02/warp-speed-ahead).
en: 2. _Haskell_. This is certainly hard to learn but it is just incredibly awesome. If you want to make you a favor. Just learn Haskell. It will be difficult, far more than you can imagine. It is very different from all other languages I used.
en: 3. _Good ideas, excellent community_. I follow yesod from some month now and the speed at which the project progress is incredible.
fr: 1. _La vitesse_. Simplement incroyable, je ne pense pas qu'il existe quelque chose de plus rapide aujourd'hui. Regardez d'abord cet [article](http://snapframework.com/blog/2010/11/17/snap-0.3-benchmarks) puis [celui-ci](http://www.yesodweb.com/blog/2011/02/warp-speed-ahead).
fr: 2. _Haskell_. C'est certainement le langage de programmation le plus difficile à apprendre que j'ai jamais rencontré. Mais aussi l'un des plus incroyables. Si vous voulez rencontrer tout un tas de notions que vous n'avez jamais croisée avant et faire exploser votre cerveau avec de nouvelles idées, alors apprenez Haskell.
fr: 3. _Bonnes idées et communauté excellente_. Cela fait quelques mois que je suis la progression de yesod. Et la vitesse à laquelle ça s'est fait est simplement incroyable. De plus les développeur sont intelligents et super sympa.

en: If you are a haskeller, I believe you shouldn't fear the special syntax imposed by the standard yesod way of doing things.
en: Just try it more than the firsts basic tutorials. 
fr: Si vous êtes un "haskeller", je pense que vous ne devriez pas avoir peur de la syntaxe particulière imposée par la façon standard de faire les choses avec yesod.
fr: Il faut essayer un peu plus loin que les premiers tutoriaux du livre.

en: Until here I believe it goes in the right direction. 
en: Even if I believe the real future is by generating HTML pages from the client (using javascript) and server limited to serve JSON (or XML, or any object representation system).
fr: Je pense que yesod va dans la bonne direction d'un web plus sûr et plus rapide. Même si je pense que l'avenir sera que les serveurs devront être limités à faire serveur d'API (JSON ou XML ou n'importe quel autre mode de représentation d'objets).

en: I cannot stress too much about how I believe Yesod is good.
fr: Yesod est juste incroyable, essayez le.
