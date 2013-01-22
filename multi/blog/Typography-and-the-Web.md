-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-02-02T11:53:00+02:00
en: title: Typography and the Web
fr: title: La typography et le Web
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - web
  - design
  - typography
macros:
 latex: '<span style="text-transform: uppercase">L<sup style="vertical-align: 0.15em; margin-left: -0.36em; margin-right: -0.15em; font-size: .85em">a</sup>T<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">e</sub>X</span>'
 xelatex: '<span style="text-transform: uppercase">X<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">&#x018E;</sub>L<sup style="vertical-align: 0.15em; margin-left: -0.36em; margin-right: -0.15em; font-size: .85em">a</sup>T<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">e</sub>X</span>'
 css: <span class="sc">css</span>

-----
blogimage("first_sc_screenshot.png", "Screenshot of first in small caps with and without ligatures.")

begindiv(intro)

en: %tldr Web typography sucks and we'll have to wait forever before it will be fixed.

fr: %tlal La typography sur le web est pourrie et nous ne somme pas près de voir ce problème réparé.

enddiv

en: I stumbled upon [open typography](http://opentypography.org/). Their main message is:
fr: Je suis tombé sur ce site: [open typography](http://opentypography.org/). Leur message principal est :

> «There is no reason to wait for browser development to catch up.
> We can all create better web typography ourselves, today.»

fr: ou en français :
fr: 
fr: > «Nous ne somme pas obligé d'attendre le développement des navigateurs.
fr: > Nous pouvons créer un web avec une meilleure typographie aujourd'hui.»

en: As somebody who tried to make my website using some nice typography features and in particular _ligatures_, I believe this is wrong.
fr: Comme quelqu'un qui a déjà essayé d'améliorer la typographie de son site web, et en particulier des _ligatures_, je crois que c'est faux.

en: I already made an automatic system which will detect and replace text by their ligatures in my blog. But this I never published this on the web and this is why.
fr: J'ai déjà écrit un système automatique qui détecte et ajoute des ligatures en utilisant des caractères unicode.
fr: Cependant je n'ai jamais publié cette amélioration sur le web et voilà pourquoi :

en: First, what is a ligatures?
fr: Tout d'abord, qu'est-ce qu'un ligature ?

blogimage("ligatures.png", "A ligature example")

en: What is the problem between the Web and ligatures?
en: The first one is: you cannot search them. For example, try to search the word "first":
fr: Quel est le problème des ligatures sur le web ?
fr: Le premier c'est que vous ne pouvez pas chercher les mots qui contiennent ces ligatures. Par exemple essayez de chercher le mot "first".

en: - first ← No ligature, no problem[^1]
en: - <span class="red">ﬁ</span>r<span class="red">ﬆ </span> ← ligature nice but unsearchable
fr: - first ←  Pas de ligature, pas de problème[^1].
fr: - <span class="red">ﬁ</span>r<span class="red">ﬆ </span> ← Une jolie ligature, mais introuvable avec une recherche (<code>C-f</code>).

en: [^1]: In fact, you might see a ligature and the search works because I now use some CSS ninja skills: `text-rendering: optimizelegibility`. But it also works because I use the right font; Computer Modern. Steal my CSS at will.
fr: [^1]: En réalité, vous devriez pouvoir voir une ligature. Maintenant j'utilise : `text-rendering: optimizelegibility`. Le rendu est correct parce que j'utilise une fonte correct, à savoir Computer Modern de Donald Knuth.

en: The second one is the rendering, for example, try to use a ligature character with small caps:
fr: Le second problème est le rendu. Par exemple, essayer d'utiliser un charactère de ligature en petites capitales :

- <sc>first</sc>
- <sc><span class="red">ﬁ</span>r<span class="red">ﬆ</span></sc>

en: Here is a screenshot of what I see:
fr: Voici une capture d'écran pour que vous voyez ce que je vois :

blogimage("first_sc_screenshot.png", "Screenshot of first in small caps with and without ligatures.")

en: The browser isn't able to understand that the ligature character "<span class="red">ﬁ</span>" should render as <sc>fi</sc> when rendered in small caps. And one part of the problem is you should choose to display a character in small caps using %css.
fr: Le navigateur est incapable de comprendre que le caractère de ligature "<span class="red">ﬁ</span>" doit être rendu comme <sc>fi</sc> lorsqu'il est en petites capitales. 
fr: Et une part du problème est que l'on peut décider d'écrire en petite majuscule dans le %css.

en: This way, how could you use a ligature Unicode character on a site on which you could change the %css?
fr: Comment par exemple utiliser un charactère de ligature unicode sur un site qui possède différents rendus via différentes %css ?

en: Let's compare to %latex.
fr: Comparons à %latex

blogimage("first_latex_screenshot.png", "LaTeX screenshot")

en: If you take attention to detail, you'll see the first "first" contains a ligature. Of course the second render nicely. The code I used were:
fr: Si vous faites attention au détail, vous constaterez que le premier "first" contient une ligature. Bien entendu la deuxième ligne est affichée correctement. Le code que j'ai utilisé pour avoir ce rendu est simplement :

<code class="latex">
\item first
\item {\sc first}
</code>

en: %latex was intelligent enough to create himself the ligatures when needed.
fr: %latex a été suffisamment intelligent pour créer les ligatures si nécessaire.

en: The "<span class="red">ﬆ</span>" ligature is rare and not rendered in %latex by default. But if you want you could also render rare ligature using %xelatex:
fr: La ligature "<span class="red">ﬆ</span>" est rare et n'est pas rendu par défaut par %latex. 
fr: Si vous voulez voir des ligatures rares, vous pouvez utiliser %xelatex:

blogimage("xelatex_ligatures.jpg","XeLaTeX ligatures")

en: I took this image from the excellent article of [Dario Taraborelli](http://nitens.org/taraborelli/latex#rare).
fr: J'ai copié cette image de l'excellent article de [Dario Taraborelli](http://nitens.org/taraborelli/latex#rare).


en: Clearly fix the rendering of ligature in a browser is a difficult task.
en: Simply imagine the number of strange little exceptions:
fr: Clairement il sera difficile aux navigateurs de corriger ces problèmes.
fr: Imaginez le nombre de petites exceptions.

en: - The text is rendered in small caps, I cannot use ligature.
en: - The current word contains a ligature unicode character, I should search for ligature in this one.
en: - The current font does not defined the ligature unicode character, we shouldn't use it, etc
en: - A javascript command changed the CSS, I should verify if I had to revert the insertion of ligatures characters
en: - etc...

fr: - Le texte est en petites capitales, je ne dois pas utiliser de ligatures.
fr: - Le mot courant contient un caractère de ligature, je ne dois pas chercher d'autre ligature dans ce mot.
fr: - La fonte n'a pas défini de caractère unicode pour la ligature, je ne dois pas l'utiliser.
fr: - Une commande javascript a modifé le CSS, je dois vérifier si je dois remplacer les ligatures par les deux caractères.
fr: - etc...

en: Nonetheless if someone has a solution, I would be happy to hear about it.
fr: Dans tous les cas, si quelqu'un possède une solution je suis preneur !
