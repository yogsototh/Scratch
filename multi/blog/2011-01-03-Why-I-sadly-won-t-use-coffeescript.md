-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-01-03T10:37:26+02:00
fr: title: Pourquoi je n'utiliserai pas CoffeeScript (malheureusement)
en: title: Why I won't use CoffeeScript (sadly)
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Coffeescript
-----
<%= blogimage("main.png","Title image") %>

begindiv(encadre)

en: *Update*: I might change my mind now. Why?
en: I just discovered a [js2coffee converter](https://github.com/rstacruz/js2coffee). Furthermore Denis Knauf told me about a `CoffeeScript.eval` function. 
en: And as Denis said: "it is time to use Coffeescript as a javascript with Ruby-like syntax not a Ruby-like programming language".

fr: *Mise à jour :* Je pense que je vais finallement changer d'avis.
fr: Pourquoi ?
fr: Tout d'abord, je viens de découvrir un convertisseur javascript vers coffeescript, ensuite Denis Knauf m'a laissé un commentaire et m'a appris l'existence d'une fonction `CoffeeScript.eval`. De plus, il faut voir CoffeeScript comme javascript avec une syntaxe similaire à Ruby et pas comme un langage similaire à Ruby.

enddiv

begindiv(intro)

en: <%= tldr %> I would have loved to program client side using a Ruby-like syntax. But in the end, CoffeScript raised more disavantages than advantages.

fr: <%= tlal %> Qu'est-ce qui n'allait pas avec Coffeescript? La meta-programmation, il faut le "vendre" aux autres, une nouvelle étape de compilation intermédiaire sans fournir les avantages de Cappuccino, la sensation que c'est un peu instable.

enddiv

en: Recently I read [this entry](http://news.ycombinator.com/item?id=2053956) on HackerNews.
en: The most upvoted comment praised (within other) [CoffeeScript][cf].
en: Recently I used _a lot_ of javascript. After trying
en: [Sproutcore](http://sproutcore.com),
en: [Cappuccino](http://cappuccino.org), looking at
en: [backbone.js](documentcloud.github.com/backbone/) _&_
en: [javascriptMVC](javascriptmvc.com),
en: I've finally decided to make my own minimal javascript MVC framework.[^1]

fr: Le commentaire le mieux classé de [la question suivante](http://news.ycombinator.com/item?id=2053956) posée sur HackerNews mentionnait [CoffeeScript][cf].
fr: Récemment j'ai beaucoup programmé en javascript.
fr: Après avoir essayé
fr: [Sroutcore](http://sproutcore.com),
fr: [Cappuccino](http://cappuccino.org),
fr: [backbone.js](documentcloud.github.com/backbone/) _&_
fr: [javascriptMVC](javascriptmvc.com),
fr: Je me suis décidé à créer mon propre framework MVC minimal pour client javascript.[^1]

[cf]: http://coffeescript.org

en: [^1]: I know it may not be the best nor productive decision, but I'd like to start from scratch and understand how things works under the hood.
fr: [^1]: Je sais que ce n'est certainement ni la meilleure ni la plus productive des décisions. Mais j'aime bien fabriquer les choses pour savoir comment tout fonctionne dans le détail.

en: I had to fight the horrible syntax of javascript. It was like experiencing a back-in-time travel: 
fr: Je me suis battu avec l'horrible syntaxe de javascript. C'était comme revenir des années dans le passé :

en: - Verbose Java-like syntax, 
en: - Strange and insanely Verbose Object Oriented Programming,
en: - No easy way to refer to current instance of a class (`this` doesn't work really well),
en: - etc... 
fr: - une syntaxe à la Java très verbeuse ;
fr: - une syntaxe follement verbeuse et étrange pour la programmation orientée objet ;
fr: - pas de manière naturelle de se référer à l'instance d'une classe ;
fr: - etc... 

en: It was so annoying at a point, I had thinked about creating my _own_ CoffeeScript.
fr: J'étais tellement ennuyé par tous ces point qu'il était arrivé un moment où je commençais à vouloir faire mon propre CoffeeScript.

en: I'd finished a first draft of my MVC javascript framework. 
en: Just after I learned about the existence of CoffeeScript, I immediately created a new git branch to try it.

fr: J'ai fini une première version de mon framework MVC en javascript et j'ai appris l'existence de CoffeeScript. Merci à git, j'ai immédiatement créé une nouvelle branche dans le seul but d'essayer CoffeeScript.

en: Here is my experience:
fr: Voici mon expérience :

en: 1. I had to install `node.js` and use `npm` just to use CoffeeScript. It wasn't a big deal but it wasn't as straightfoward as I expected either.
en: 2. Existing javascript file are not coffee compatible. 
en:     I _had_ to translate them by hand. 
en:     There were no script to help me in this process.
en:     Thanks to [vim](http://vim.org), it wasn't too hard to translate 90% of the javascript using some regexp. 
en:     The `--watch` option of coffee was also really helpful to help in the translation. 
en:     But I had to write my own shell script in order to follow an entire directory tree.
en: 4. An unexpected event. I made some meta-programming in javascript using `eval`. But in order to work, the string in the eval must be written in pure javascript not in coffee. It was like writing in two different languages. Really not so good.

fr: 1. J'ai dû installer `node.js` et utiliser `npm` simplement pour utiliser CoffeeScript. Ce n'était pas très difficile, mais pas aussi facile que ce que j'aurai aimé.
fr: 2. Les fichier javascript existants ne sont pas compatible avec coffee.
fr: 3. Il n'y a pas script pour aider à transformer les anciens fichiers javascripts en fichier coffee. Du coups j'ai dû faire ça manuellement.
fr:     Merci à [vim](http://vim.org), il ne fut pas très difficile de transformer 90% des fichiers avec des expressions régulières.
fr:     L'option `--watch` de coffee était très utile pour debugger cette transformation.
fr:     Cependant, il m'a fallu écrire mon propre script pour que tous mes fichiers soient _watchés_ dans tous les sous-répertoires.
fr: 4. Quelque chose à laquelle je n'avais pas pensé. J'ai fait un peu de meta-programmation en javascript en utilisant `eval`. Mais pour que celà fonctionne correctement, il faut que la chaîne de caractère que je passe à `eval` soit codée en javascript et pas en coffee. C'est un peu comme écrire dans deux langages différents au même endroit. Ça ne me parraissait vraiment pas agréable.

## Conclusion

en: Advantages:
fr: Avantages :

en: - Readability: clearly it resolved most of javascript syntax problems
en: - Verbosity: I gained 14% line, 22% words, 14% characters
fr: - Code plus lisible : CoffeeScript résoud la majorité des problèmes de syntaxes de javascript
fr: - Concision : j'ai gagné 14% de lignes, 22% de mots et 14% de caractères.

en: Disadvantages:
fr: Inconvénients :

en: - Added another compilation step to see how my code behave on the website.
en: - I had to launch some script to generate on change every of my javascript file
en: - I have to learn another Ruby-like language,
en: - meta-programming become a poor experience,
en: - I must convince people working with me to: 
en:     - install `node.js`, `npm` and CoffeeScript,
en:     - remember to launch a script at each code session,
en:     - learn and use another ruby-like language

fr: - Ajout d'une nouvelle étape de compilation avant de pouvoir vérifier le comportement de mon site
fr: - Facilité d'utilisation : il m'a fallu créer un script pour gérer la génératio automatique des fichiers
fr: - Il faut apprendre un autre langage proche de ruby
fr: - La meta-programmation devient une expérience désagréable
fr: - Je dois convaincre les personnes travaillant avec moi : 
fr:     - d'installer `node.js`, `npm` et CoffeeScript ;
fr:     - de se souvenir de lancer un script à chaque session de codage ;
fr:     - d'apprendre un autre language proche de ruby.

en: The last two point were definitively really problematic for me.
fr: Les deux derniers points étant de mon point de vue les plus problématiques.

en: But even if I'll have to work alone, I certainly won't use CoffeeScript either. 
en: CoffeeScript is a third party and any of their update can break my code. 
en: I experienced this kind of situation many times, and it is very annoying. 
en: Far more than coding with a bad syntax.
fr: Mais même si j'avais à travailler seul, je n'utiliserai certainement pas CoffeeScript. 
fr: Il s'agit d'un tier dont la moindre mise à jour pourrait rendre mon code inutilisable. 
fr: Cette situation m'est déjà arrivée plusieurs fois et c'est très désagrable. 
fr: Beaucoup plus que coder avec une mauvaise syntaxe.

## Digression

en: I am sad. 
en: I wanted so much to program on Web Client with a Ruby-like syntax. 
en: But in the end I think it is not for me. 
en: I have to use the _horrible_ javascript syntax for now. 
en: At least I would have preferred a complete `ruby2js` script for example[^2]. 
en: But I believe it would be a really hard task just to simulate the access of current class for example.

en: [^2]: I know there is `rb2js`, but it doesn't handle the problem I talk about.

fr: Je suis attristé.
fr: J'espérais tant pouvoir programmer Javascript avec une touche de Ruby.
fr: En fin de compte, cette solution n'est pas pour moi.
fr: Je vais devoir utiliser l'_horrible_ syntaxe javascript pour l'instant.
fr: À la limite j'aurai préféré un script Ruby2Js par exemple[^2]. 
fr: Mais il me semble que ça serait un travail très difficile rien que pour simuler l'accès à la classe courante. 
fr: 
fr: [^2]: Je sais qu'il existe un projet `rb2js`, mais il ne résoud pas le problème dont je parle.

en: Typically `@x` translate into `this.x`. But the following code will not do what I should expect. Call the foo function of the current class.
fr: Typiquement `@x` est transformé en `this.x`. Mais le code suivant ne fait pas ce que j'attendrai de lui.

<code class="ruby">
-> 
class MyClass
  foo: ->
    alert('ok')

  bar: ->
    $('#content').load( '/content.html', ( -> @foo(x) ) )
en:     # That won't call MyClass.foo
fr:     # Ça n'appellera pas MyClass.foo
</code>

en: The only way to handle this is to make the following code:
fr: La seule façon de résoudre ce problème est avec le code suivant :


<code class="ruby">
-> 
class MyClass
  foo: ->
    alert('ok')

  bar: ->
    self=this
    $('#content').load( '/content.html', ( -> self.foo(x) ) )
</code>

en: Knowing this, `@` notation lose most of its interrest for me.
fr: Sachant celà, la notation `@` perd tout son intérêt pour moi.
