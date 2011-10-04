-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-10-04T10:18:59+02:00
en: title: Yesod excellent ideas
fr: title: Yesod excellent ideas
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)

en: <%= tldr %>

fr: <%= tlal %>

I follows the yesod web framework for some times now. And I believe it reached the point where you should really consider to use it. But instead of telling you why you should learn Haskell and use yesod, I prefer to talk about new ideas used by yesod I didn't saw in other frameworks.

enddiv

en: ## Type safety
   
en: Let's start by an obligatory link from [xkcd](http://xkcd.com):
fr: Commençons par une BD d'[xkcd](http://xkcd.com) :

   ![SQL injection by a mom](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)

en: When you create a web application, a lot of time is spent dealing with strings.
en: Strings for URL, HTML, JavaScript, CSS, SQL, etc...
en: To prevent malicious usage you have to protect each strings to be sure, no script will pass from one point to another.
en: Suppose a user enter this user name:

<code class="javascript">
Newton<script>alert("An apple fall")</script>
</code>

en: You must transform each `<` into `&lt;`.
en: Without this transformation alert will appear each time you try to display this user name.
fr: Avec les technologies web on passe son temps à manipuler des chaînes de caractères. 
fr: Certaines de ces chaînes sont utilisées pour désigner du HTML, d'autre du JavaScript, d'autres du CSS, d'autre des requêtes SQL, des URL, etc...
fr: Il en résulte des problèmes pour éviter qu'un petit malin utilise le champs "nom d'utilisateur" et remplace un nom standard par `toto<script>alert("This site sucks!")</script>`.
fr: Sans une protection correcte, le message sera affiché à chaque fois que quelqu'un essayera d'accéder au nom de cet utilisateur.
fr: Les "types saufs" sont le [tonyglandil du web](https://www.youtube.com/watch?v=1IWF3IsEPBE).
fr: Safe types are the chains around all strings you'll use.

en: yesod does its best to handle cross scripting issues. Both between the client and the server and between the server and your DB.
en: Here is an example:
fr: Yesod fait de son mieux pour typer les objets manipulés et ainsi il fera ce qu'il faut pour ne pas mettre du script dans une URL par exemple.

<code class="html"> 
<a href=@[AnotherPageR]>Go to the other page
</code>

en: As `AnotherPageR` is of type URL and it could not contains something nefarious.
en: It will be an URL safe. Not something like:

    falselink"><script> bad_code(); </script><a href="pipo

en: ## Widgets

en: Yesod widget are different from just JavaScript widget.
en: In yesod widget are _more_ in the server side. Even if you can use yesod widget to manage JavaScript widgets.
en: Some examples of widgets are:

en: - the footer of a webpage,
en: - the header of a webpage with a menu,
en: - a button which appears only when scrolling down, 
en: - etc...

en: For each of this part, you might need, 

en: - a bit of HTML, 
en: - a bit of CSS and 
en: - a bit of Javascript.

en: Some in the header, some in the body.

en: You can declare a widget as this (note I use a very high meta-language):

    htmlheader = ...
    cssheader = ...
    javascriptheader = ...
    htmlbody = ...

en: The real syntax is:

toWidgetHeader cassiusFile "button.cassius"
toWidgetHeader juliusFile "button.julius"
toWidget hamletFile "buttonTemplate.hamlet"

en: Note the awesome Shakespearean inspired name convention. Just for these name you should use yesod.

en: - Cassius _&_ Lucius of CSS (a lot similar to SASS and SCSS)
en: - Julius for JavaScript
en: - Hamlet for HTML (similar to haml)

en: And when your page render, yesod make it easy to render everything nicely:

<code class="haskell">
myBigWidget =  menuWidget >> contentWidget >> footerWidget
</code>

en: Furthermore, if you use say 10 widgets each with a bit of CSS, yesod will create a unique and compressed CSS file. Except if you expressed a need to change the header by using different CSS. 

en: This is just awesome.

en: ## Optimized routing

en: In standard routing system you have for each entry a couple: regexp -> handler

en: The only way to discover the right rules is to match each regexp to the current URL. Then you can see behaviour such as, if you change the order of the rules you can lose or win time.

en: On the other hand yesod compile the routes. Therefore it can optimize it.
en: Of course two routes must not interfere.

<code class="html">
/blog/2003  Date2003R
/blog/$DATE DateR
</code>

en: is invalid by default (you can make it valid, but I don't think it is a good idea).

en: You'd better

<code class="html">
/blog/$DATE DateR
</code>

en: and make the test inside the handler

en: Why you should use yesod. Just saying from a very subjective point of vue, from what I heard, Haskell is a node.js done as it should be.

en: 1. Speed. This is just astounding.
en: 2. Haskell. This is certainly hard to learn but it is just incredibly awesome. If you want to make you a favor. Just learn Haskell. It will be difficult, far more than you can imagine. It is very different from all other languages I used.
en: 3. Good ideas, excellent community. I follow yesod from some month now and the speed at which the project progress is incredible.

If you are a haskeller, I believe you shouldn't fear the special syntax imposed by the standard yesod way of doing things.
Just try it more than the firsts basic tutorials. 

en: One more thing, if you are a designer, please, help the yesodweb.com website to improve. 
en: I am not a designer, but I'm interrested in web design and if I cannot necessarily make stunning design I detect _errors_ in design. 
en: I pushed some fixes for their website some time ago but it would be better to provide them new colors, etc...
en: But I also don't want to hurt any sensibility.
en: The work of Michael Snoyman and Greg Weber is just stunning.

  Until here I believe it goes in the right direction. Even if I believe the real future is by generating HTML pages from the client (using javascript) and server limited to serve JSON (or XML, or any object representation system).

  I cannot stress too much about how I believe Yesod is good.

  One of the most important point is the responsiveness of the community. It is very active. It is Greg which the first had given a way to [deploy Haskell code to Heroku](http://www.yesodweb.com/blog/2011/07/haskell-on-heroku).
