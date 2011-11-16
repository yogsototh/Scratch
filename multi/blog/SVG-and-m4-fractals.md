-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-10-20T11:39:36+02:00
en: title: Increase the power of deficient languages.
en: subtitle: Fractals with SVG and m4
fr: title: Accroître le pouvoir des languages déficients.
fr: subtitle: Fractales en SVG avec m4
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - m4
  - SVG
  - XSLT
  - XML
  - design
en:   - programming
en:   - fractal
fr:   - programmation
fr:   - fractales
macros:
 svg: '<span class="sc">svg</span>' 
 xml: '<span class="sc">xml</span>' 
 xslt: '<span class="sc">xslt</span>' 
 json: '<span class="sc">json</span>' 
-----
<%= blogimage("main.png","Yesod logo made in SVG and m4") %>

begindiv(intro)

en: <%= tldr %> How to use m4 to increase the power of deficient languages. Two examples: improve %xslt syntax and make fractal with %svg.
fr: <%= tlal %> Utiliser m4 pour accroître le pouvoir d'%xslt et d'%svg. Example cool, les fractales.

enddiv

en: %xml was a very nice idea about structuring data.
en: Some people where so enthusiastic about %xml they saw it everywhere.
en: The idea was: the future is %xml.
en: Then some believed it would be a good idea to invent many %xml compatible format and even programming languages with %xml syntax.
fr: Lorsqu'%xml fût inventé beaucoup pensaient que c'était l'avenir.
fr: Passer de fichiers plat à des fichiers structurés standardisés fût un grand progrès dans beaucoup de domaines.
fr: Cerain se mirent à voir du %xml de partout.
fr: À tel point que les les format compatibles %xml naquirent de toute part.
fr: Non seulement comme format de fichier, mais aussi comme format pour un langage de programmation.

en: Happy! Happy! Joy! Joy! 
fr: Ô joie !

en: Unfortunately, %xml was made to transfert structured data.
en: Not a format a human should see or edit directly.
en: The sad reality is %xml syntax is simply verbose and ugly.
en: Most of the time it shouldn't be a problem, as nobody should see it.
en: In a perfect nice world, we should never deal directly with %xml but only use software which deal with it for us.
en: Guess what?
en: Our world isn't perfect. Too sad, a bunch of developer have to deal directly with this ugly %xml.
fr: Malheureusement, %xml fût fabriquer pour le transfert de données.
fr: Pas du tout pour être vu ou édité directement.
fr: La triste vérité est qu'%xml est verbeux et laid.
fr: Dans un monde parfait, nous ne devrions avoir des programmes qui s'occupent de nous afficher correctement le %xml pour nous épargner la peine de les voir directement.
fr: Mais devinez quoi ?
fr: Notre monde n'est pas parfait. 
fr: Beaucoup de programmeurs sont ainsi forcé de travailler
fr: directement avec de l'%xml.

en: Unfortunately %xml isn't the only case of misused format I know. 
en: You have many format for which it would be very nice to add variables, loops, functions...
fr: %xml, n'est pas le seul cas de format mal utilisé que je connaisse.
fr: Vous avez d'autres formats dans lesquels il serait très agréable d'ajouter des variables, des boucles, des fonctions...

en: If like me you hate with passion %xslt or writing %xml,
en: I will show you how you could deal with this bad format
en: or language.
fr: Mais je suis là pour vous aider.
fr: Si comme moi vous détestez %xslt ou écrire de l'%xml.
fr: Je vais vous montrer une façon d'améliorer tout ça.

en: ## The %xslt Example
fr: ## Un exemple avec %xslt

en: Let's start by the worst case of misused %xml I know: %xslt.
en: Any developer who had to deal with %xslt know how horrible it is.
fr: Commençons avec le pire cas de langage %xml que je connaisse : %xslt.
fr: Tous les développeurs qui ont déjà dû écrire du %xslt savent à quel point ce langage est horrible.

en: In order to reduce the verbosity of such a bad languages, there is a way.
en: **`m4`**. Yes, the preprocessor you use when you program in `C` and `C++`.
fr: Pour réduire la "verbosité" de tels langages, il y a un moyen.
fr: **`m4`**.
fr: Oui, le préprocesseur utilisé par `C` et `C++`.

en: Here are some example: 
fr: Voici certains exemples :

en: - Variable, instead of writing the natural `myvar = value`, here is the <sc>xslt</sc> way of doing this:
fr: - Les variables, au lieu d'écrire `myvar = value`, voici la version <sc>xslt</sc> :

<code class="xml">
<xsl:variable name="myvar" select="value"/>
</code>

en: - Printing something. Instead of `print "Hello world!"` here is the <sc>xslt</sc> equivalent:
fr: - Afficher quelquechose. Au lieu de `print "Hello world!"`, <sc>xslt</sc> nous offre :

<code class="xml">
<xsl:text 
    disable-output-escaping="yes"><![CDATA[Hello world!
]]></xsl:text>
</code>


en: - printing the value of a variable, instead of `print myvar` the <sc>xslt</sc> is:
fr: - afficher la valeur d'une variable, au lieu de `print myvar`, nous avons droit à :

<code class="xml">
<xslt:value-of select="myvar"/>
</code>

en: - Just try to imagine how verbose it is to declare a function with this language.
fr: - Essayez d'imaginer à quel point il est verbeux de déclarer une fonction dans ce langage.

en: ## The cure (m4 to the rescue)
fr: ## La solution (m4 à la rescousse)

<code class="xml">
<?xml version="1.0" standalone="yes"?> <!-- YES its %xml -->
<!-- ← start a comment, then write some m4 directives:

define(`ydef',`<xsl:variable name="$1" select="$2"/>')
define(`yprint',`<xsl:text disable-output-escaping="yes"><![CDATA[$1]]></xsl:text>')
define(`yshow',`<xsl:value-of select="$1"/>')

-->
<!-- Yes, %xml sucks to be read -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- And it sucks even more to edit -->
<xsl:template match="/">
    ydef(myvar,value)
    yprint(Hello world!)
    yshow(myvar)
</xsl:template>
</code>

en: Now just compile this file:
fr: Maintenant compilons simplement ce fichier :

<code class="zsh">
m4 myfile.m4 > myfile.xslt
</code>

en: Profit! Now <sc>xslt</sc> is more readable and easier to edit!
fr: Et vous pouvez profitez ! Maintenant <sc>xslt</sc> devient plus lisible et plus facile à éditer.

en: ## The cool part: Fractals!
fr: ## La partie la plus cool: les fractales !

en: %svg is an %xml format used to represent vector graphics, it even support animations.
en: At its beginning some people believed it would be the new Flash. Apparently, it will be more canvas + js.
fr: À ses débuts, beaucoup pensaient que ce serait le nouveau Flash. Apparemment, ce devrait plutôt être `canvas` avec du javascript qui occupera cette place.

en: Let me show you the result:
fr: Tout d'abord, laissez moi vous montrer le résultat :

<a href="<%= blogimagedir %>main.svg">
<%= blogimage("main.png","Yesod logo made in SVG and m4") %>
en: Click to view directly the %svg. It might slow down your computers if you have an old one.
fr: Cliquez sur l'image pour voir le %svg directement. Attention, si vous n'avez pas un ordinateur récent, ça risque de ramer.
</a>

en: The positionning of the "esod" text with regards to the reversed "λ" was done by changing position in firebug. I didn't had to manually regenerate to test.
fr: Le positionnement du texte "esod" par rapport au "λ" renversé a été en jouant avec firebug. De cette façon je n'avais pas à regénérer pour tester.

en: Making such a fractal is mostly:
fr: Faire une telle fractale revient à :

en: 1. take a root element
en: 2. duplicate and transform it (scaling, translating, rotate)
en: 3. the result is a sub new element.
en: 4. repeat from 2 but by taking the sub new element as new root.
en: 5. Stop when recursion is deep enough.
fr: 1. Choisir un élément racine ;
fr: 2. le dupliquer et le transformer ;
fr: 3. le résultat est un nouveau sous-élément ;
fr: 4. répéter à partir de 2 mais en utilisant le sous-élément comme nouvelle racine.
fr: 5. Arréter lorsque la récursion est assez profonde.

en: If I had to do this for each step, I had make a lot of copy/paste in my %svg, because the transformation is always the same, but I cannot say, use transformation named "titi". Then instead of manually copying some %xml, I used m4
fr: Si j'avais dû faire ça manuellement, il m'aurait fallu faire beaucoup de copier/coller dans mon %svg.
fr: Simplement parce que la transformation est toujours la même, mais je ne pouvais pas dire, utiliser la transformation appelée "titi".
fr: Plutôt que copier du %xml, j'ai utilisé m4.

en: and here is the commented code:
fr: Et voici le code commenté :

<code class="xml" file="yesodlogo.m4">
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!--
     M4 Macros
define(`YTRANSFORMONE', `scale(.43) translate(-120,-69) rotate(-10)')
define(`YTRANSFORMTWO', `scale(.43) translate(-9,-67.5) rotate(10)')
define(`YTRANSFORMTHREE', `scale(.43) translate(53,41) rotate(120)')
define(`YGENTRANSFORM', `translate(364,274) scale(3)')
define(`YTRANSCOMPLETE', `
    <g id="level_$1">
        <use style="opacity: .8" transform="YTRANSFORMONE" xlink:href="#level_$2" />
        <use style="opacity: .8" transform="YTRANSFORMTWO" xlink:href="#level_$2" />
        <use style="opacity: .8" transform="YTRANSFORMTHREE" xlink:href="#level_$2" />
    </g>
    <use transform="YGENTRANSFORM" xlink:href="#level_$1" />
')
 -->
<svg 
    xmlns="http://www.w3.org/2000/svg" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    x="64" y="64" width="512" height="512" viewBox="64 64 512 512"
    id="svg2" version="1.1">
    <g id="level_0"> <!-- some group, if I want to add other elements -->
        <!-- the text "λ" -->
        <text id="lambda" 
            fill="#333" style="font-family:Ubuntu; font-size: 100px"
            transform="rotate(180)">λ</text>
    </g>
    <!-- the text "esod" -->
    <text 
        fill="#333" 
        style="font-family:Ubuntu; font-size: 28px; letter-spacing: -0.10em" 
        x="-17.3" 
        y="69" 
        transform="YGENTRANSFORM">esod</text>
    <!-- ROOT ELEMENT -->
    <use transform="YGENTRANSFORM" xlink:href="#level_0" />

    YTRANSCOMPLETE(1,0) <!-- First recursion -->
    YTRANSCOMPLETE(2,1) <!-- deeper -->
    YTRANSCOMPLETE(3,2) <!-- deeper -->
    YTRANSCOMPLETE(4,3) <!-- even deeper -->
    YTRANSCOMPLETE(5,4) <!-- Five level seems enough -->
</svg>
</code>

en: and I compiled it to <sc>svg</sc> and then to <sc>png</sc> with:
fr: et je l'ai compile en <sc>svg</sc> et ensuite en <sc>png</sc> avec :

<code class="zsh">
m4 yesodlogo.m4 > yesodlogo.svg && convert yesodlogo.svg yesodlogo.png
</code>

en: The main λ is duplicated 3 times. Each transformation is named by: `YTRANSFORMONE`, `YTRANSFORMTWO` and `YTRANSFORMTHREE`.
fr: Le λ est dupliqué avec trois "transformations" différentes. Les transformations sont : `YTRANSFORMONE`, `YTRANSFORMTWO` et `YTRANSFORMTHREE`.

en: Each transformation is just a similarity (translate + rotation + scale).
fr: Chaque transformation est une similarité (translation + rotation + zoom, ce qui est équivalent à juste rotation + zoom, mais bon).

en: Once fixed, we should now simply copy and repeat for each new level.
fr: Une fois fixée chaque transformation peut ensuite être réutilisée pour chaque nouveau niveau.

en: Now it is time to talk about where the magic occurs: `YTRANSCOMPLETE`.
en: This macro takes two arguments.
en: The current depth and the preceding one.
en: It duplicates using the three transformations the preceding level.
en: 
en: - At level 0 there is only one λ,
en: - at level 1 there is 3 λ,
en: - at level 2 there is 9 λ
en: - etc... 
en: 
en: At the final 5th level there is 3<sup>5</sup>=243 λ.
en: All level combined have 3<sup>6</sup>-1 / 2 = 364 λ.
fr: Maintenant `YTRANSCOMPLETE` entre en jeu.
fr: Cette macro prend deux arguments.
fr: Le niveau courant et le niveau précédent.
fr: Cette macro va dupliquer le niveau précédent en lui appliquant chacune des 3 transformations.
fr: Au niveau 0, le contenu est un seul grand λ, le niveau 1 en contient 3. Le niveau 2 en contient 9, etc...
fr: Le niveau 5 contient 3<sup>5</sup>=243 λ.
fr: Tous les niveaux combinés représentent 3<sup>6</sup>-1 / 2 = 364 λ.

en: I could preview the final result easily. 
en: Without the macro system, I would have to make 5 copy/paste + modifications for each try.
fr: L'avantage principal c'est que je pouvais visualiser le résultat final facilement.
fr: Sans ce système de macro, pour faire une preview il m'aurait fallu faire des copier/coller + quelques modifications à chaque essai.

## Conclusion

en: It was fun to make a fractal in <sc>svg</sc>, but the interesting part is how to augment the power of a language using this preprocessor method. 
en: I used the <sc>xslt</sc> trick at work for example.
en: I also used it to make include inside obscure format.
en: If all you want is to generate  a minimal static website withou using nanoc, jekyll or hakyll (ther are plenty other alternatives). You can consider using m4 to generate your <sc>html</sc> instead of copy/paste the menu and the footer, or using AJAX.
en: 
en: Another usage I thouhgt about is to use m4
en: to organize languages such as brainfuck.
fr: Ce fut très amusant de faire une fractale en <sc>svg</sc>, mais la partie la plus intéressante était d'augmenter la puissance d'expressivité du langage en utilise un préprocesseur.
fr: J'ai utilisé cette méthode avec <sc>xslt</sc> pour une vrai application par exemple.
fr: On peut aussi utiliser m4 pour faire des includes d'autres fichiers.
fr: Typiquement je l'ai utiliser pour les includes dans un format obscur.
fr: Mais vous pouvez aussi le considérer pour des includes dans du HTML.
fr: Par exemple pour fabriquer un site statique rapidement, m4 peut se révéler utile pour inclure un footer ou un menu sur toutes les pages par exemple.
fr: J'ai aussi pensé que l'on pouvait utiliser m4 pour structurer des programmes comme brainfuck.
