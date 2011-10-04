-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-10-04T10:18:59+02:00
title: Yesod excellent ideas
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)


<%= tlal %>

I follows the yesod web framework for some times now. And I believe it reached the point where you should really consider to use it. But instead of telling you why you should learn Haskell and use yesod, I prefer to talk about new ideas used by yesod I didn't saw in other frameworks.

enddiv

   
Commençons par une BD d'[xkcd](http://xkcd.com) :

   ![SQL injection by a mom](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)


<code class="javascript">
Newton<script>alert("An apple fall")</script>
</code>

Avec les technologies web on passe son temps à manipuler des chaînes de caractères. 
Certaines de ces chaînes sont utilisées pour désigner du HTML, d'autre du JavaScript, d'autres du CSS, d'autre des requêtes SQL, des URL, etc...
Il en résulte des problèmes pour éviter qu'un petit malin utilise le champs "nom d'utilisateur" et remplace un nom standard par `toto<script>alert("This site sucks!")</script>`.
Sans une protection correcte, le message sera affiché à chaque fois que quelqu'un essayera d'accéder au nom de cet utilisateur.
Les "types saufs" sont le [tonyglandil du web](https://www.youtube.com/watch?v=1IWF3IsEPBE).
Safe types are the chains around all strings you'll use.

Yesod fait de son mieux pour typer les objets manipulés et ainsi il fera ce qu'il faut pour ne pas mettre du script dans une URL par exemple.

<code class="html"> 
<a href=@[AnotherPageR]>Go to the other page
</code>


    falselink"><script> bad_code(); </script><a href="pipo








    htmlheader = ...
    cssheader = ...
    javascriptheader = ...
    htmlbody = ...


toWidgetHeader cassiusFile "button.cassius"
toWidgetHeader juliusFile "button.julius"
toWidget hamletFile "buttonTemplate.hamlet"




<code class="haskell">
myBigWidget =  menuWidget >> contentWidget >> footerWidget
</code>







<code class="html">
/blog/2003  Date2003R
/blog/$DATE DateR
</code>



<code class="html">
/blog/$DATE DateR
</code>




If you are a haskeller, I believe you shouldn't fear the special syntax imposed by the standard yesod way of doing things.
Just try it more than the firsts basic tutorials. 


  Until here I believe it goes in the right direction. Even if I believe the real future is by generating HTML pages from the client (using javascript) and server limited to serve JSON (or XML, or any object representation system).

  I cannot stress too much about how I believe Yesod is good.

  One of the most important point is the responsiveness of the community. It is very active. It is Greg which the first had given a way to [deploy Haskell code to Heroku](http://www.yesodweb.com/blog/2011/07/haskell-on-heroku).
