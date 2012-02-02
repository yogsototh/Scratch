-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-02-02T11:53:00+02:00
title: La typography et le Web
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
<%= blogimage('first_sc_screenshot.png', "Screenshot of first in small caps with and without ligatures."); %>

begindiv(intro)


<%= tlal %> La typography sur le web est pourrie et nous ne somme pas près de voir ce problème réparé.

enddiv

Je suis tombé sur ce site: [open typography](http://opentypography.org/). Leur message principal est :

> «There is no reason to wait for browser development to catch up.
> We can all create better web typography ourselves, today.»

ou en français :

> «Nous ne somme pas obligé d'attendre le développement des navigateurs.
> Nous pouvons créer un web avec une meilleure typographie aujourd'hui.»

Comme quelqu'un qui a déjà essayé d'améliorer la typographie de son site web, et en particulier des _ligatures_, je crois que c'est faux.

J'ai déjà écrit un système automatique qui détecte et ajoute des ligatures en utilisant des caractères unicode.
Cependant je n'ai jamais publié cette amélioration sur le web et voilà pourquoi :

Tout d'abord, qu'est-ce qu'un ligature ?

<%= blogimage('ligatures.png', "A ligature example"); %>

Quel est le problème des ligatures sur le web ?
Le premier c'est que vous ne pouvez pas chercher les mots qui contiennent ces ligatures. Par exemple essayez de chercher le mot "first".

- first ←  Pas de ligature, pas de problème.
- <span style="color: #800">ﬁ</span>r<span style="color: #800">ﬆ </span> ← Une jolie ligature, mais introuvable avec une recherche (<code>C-f</code>).

Le second problème est le rendu. Par exemple, essayer d'utiliser un charactère de ligature en petites capitales :

- <sc>first</sc>
- <sc><span style="color:#800">ﬁ</span>r<span style="color:#800">ﬆ</span></sc>

Voici une capture d'écran pour que vous voyez ce que je vois :

<%= blogimage('first_sc_screenshot.png', "Screenshot of first in small caps with and without ligatures."); %>

Le navigateur est incapable de comprendre que le caractère de ligature "<span style="color:#800">ﬁ</span>" doit être rendu comme <sc>fi</sc> lorsqu'il est en petites capitales. 
Et une part du problème est que l'on peut décider d'écrire en petite majuscule dans le %css.

Comment par exemple utiliser un charactère de ligature unicode sur un site qui possède différents rendus via différentes %css ?

Comparons à %latex

<%= blogimage('first_latex_screenshot.png', "LaTeX screenshot"); %>

Si vous faites attention au détail, vous constaterez que le premier "first" contient une ligature. Bien entendu la deuxième ligne est affichée correctement. Le code que j'ai utilisé pour avoir ce rendu est simplement :

<code class="latex">
\item first
\item {\sc first}
</code>

%latex a été suffisamment intelligent pour créer les ligatures si nécessaire.

La ligature "<span style="color:#800">ﬆ</span>" est rare et n'est pas rendu par défaut par %latex. 
Si vous voulez voir des ligatures rares, vous pouvez utiliser %xelatex:

<%= blogimage('xelatex_ligatures.jpg',"XeLaTeX ligatures"); %>

J'ai copié cette image de l'excellent article de [Dario Taraborelli](http://nitens.org/taraborelli/latex#rare).


Clairement il sera difficile aux navigateurs de corriger ces problèmes.
Imaginez le nombre de petites exceptions.


- Le texte est en petites capitales, je ne dois pas utiliser de ligatures.
- Le mot courant contient un caractère de ligature, je ne dois pas chercher d'autre ligature dans ce mot.
- La fonte n'a pas défini de caractère unicode pour la ligature, je ne dois pas l'utiliser.
- Une commande javascript a modifé le CSS, je dois vérifier si je dois remplacer les ligatures par les deux caractères.
- etc...

Dans tous les cas, si quelqu'un possède une solution je suis preneur !
