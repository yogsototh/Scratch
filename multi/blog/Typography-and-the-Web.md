-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-02-02T11:53:00+02:00
en: title: Typography and the Web
fr: title: Typography and the Web
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

en: <%= tldr %> Web typography sucks and we'll have to wait forever before it will be fixed.

fr: <%= tlal %> La typography sur le web est pourrie et nous ne somme pas près de voir ce problème réparé.

enddiv

I stumbled upon [open typography](http://opentypography.org/). Their main message is:

> «There is no reason to wait for browser development to catch up.
> We can all create better web typography ourselves, today.»

As somebody who tried to make my website using some nice typography features and in particular _ligatures_, I believe this is wrong.

I already made an automatic system which will detect and replace text by their ligatures in my blog. But this I never published this on the web and this is why.

First, what is a ligatures?

<%= blogimage('ligatures.png', "A ligature example"); %>
/
What is the problem between the Web and ligatures?
The first one is: you cannot search them. For example, try to search the word "first":

- first ← No ligature, no problem
- <span style="color: #800">ﬁ</span>r<span style="color: #800">ﬆ </span> ← ligature nice but unsearchable

The second one is the rendering, for example, try to use a ligature character with small caps:

- <sc>first</sc>
- <sc><span style="color:#800">ﬁ</span>r<span style="color:#800">ﬆ</span></sc>

Here is a screenshot of what I see:

<%= blogimage('first_sc_screenshot.png', "Screenshot of first in small caps with and without ligatures."); %>

The browser isn't able to understand that the ligature character "<span style="color:#800">ﬁ</span>" should render as <sc>fi</sc> when rendered in small caps. And one part of the problem is you should choose to display a character in small caps using %css.

This way, how could you use a ligature Unicode character on a site on which you could change the %css?

Let's compare to %latex.

<%= blogimage('first_latex_screenshot.png', "LaTeX screenshot"); %>

If you take attention to detail, you'll see the first "first" contains a ligature. Of course the second render nicely. The code I used were:

<code class="latex">
\item first
\item {\sc first}
</code>

%latex was intelligent enough to create himself the ligatures when needed.

The "<span style="color:#800">ﬆ</span>" ligature is rare and not rendered in %latex by default. But if you want you could also render rare ligature using %xelatex:

<%= blogimage('xelatex_ligatures.jpg',"XeLaTeX ligatures"); %>

I took this image from the excellent article of [Dario Taraborelli](http://nitens.org/taraborelli/latex#rare).

Clearly fix the rendering of ligature in a browser is a difficult task.
In a perfect world I imagine it would be enough to pass a filter just before render text on the screen which transform "fi" in "<span style="color:#800">ﬁ</span>" and all other ligatures except if it should be rendered using small caps. And also when trying to search for "fi" it should also match "<span style="color:#800">ﬁ</span>".

I don't think we will see a browser completely ligature compliant soon.
I believe there is a lot of strange exceptions in font rendering inside a browser.
For example, do not search for ligatures in a word if it already contains a unicode ligature character.

Nonetheless if someone has a solution, I would be happy to hear about it.
