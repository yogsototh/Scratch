-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-05-19T22:20:34+02:00
fr: title: Comment réparer un XML coupé ?
fr: subtitle: et comment s'en sortir sans parseur ?
en: title: How to repair a cutted XML?
en: subtitle: and how to do it without any parsor?
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
fr:     - arbre
en:     - tree
    - HTML
    - script
    - ruby
-----

en: For my main page, you can see, a list of my latest blog entry. And you have the first part of each article. To accomplish that, I needed to include the begining of the entry and to cut it somewhere. But now, I had to repair this cutted HTML.
fr: Sur ma page d'accueil vous pouvez voir la liste des mes derniers articles avec le début de ceux-ci. Pour arriver à faire ça, j'ai besoin de couper le code XHTML de mes pages en plein milieu. Il m'a donc fallu trouver un moyen de les réparer.

en: Here is an example:
fr: Prenons un exemple :

<code class="html">
<div class="corps">
    <div class="intro">
        <p>Introduction</p>
    </div>
    <p>The first paragraph</p>
    <img src="/img/img.png" alt="an image"/>
    <p>Another long paragraph</p>
</div>
</code>

en: After the cut, I obtain:
fr: Après avoir coupé, j'obtiens :

<code class="html">
<div class="corps">
    <div class="intro">
        <p>Introduction</p>
    </div>
    <p>The first paragraph</p>
    <img src="/img/im
</code>

en: Argh! In the middle of an `<img>` tag.
fr: En plein milieu d'un tag `<img>` !

en: In fact, it is not as difficult as it should sound first. The secret is, you don't need to keep the complete tree structure to repair it, but only the list of not closed parents.
fr: En réalité, ce n'est pas si difficile que celà peut paraître au premier abord. Le secret réside dans le fait de comprendre que l'on n'a pas besoin de conserver la structure complète de l'arbre pour le réparer, mais seulement la liste des parents non fermés.

en: Given with our example, when we are after the first paragraph. we only have to close the `div` for class `corps` and the XML is repaired. Of course, when you cut inside a tag, you sould go back, as if you where just before it. Delete this tag and all is ok.
fr: Pour notre exemple, juste après le paragraphe `first paragraph` nous n'avons qu'à fermer un `div` pour la classe `corps` et le XML est réparé. Bien entendu, quand on est dans le cas où un tag est coupé au milieu, on a qu'à remonté juste avant le début de ce tag corrompu.

en: Then, all you have to do, is not remember all the XML tree, but only the heap containing your parents. Suppose we treat the complete first example, the stack will pass through the following state, in order:
fr: Donc, tout ce que nous avons à faire, c'est d'enregistrer la liste des parents dans une pile. Supposons que nous traitions le premier exemple complètement. La pile passera par les états suivants :

<code class="html">
[]           
[div]           <div class="corps">
[div, div]          <div class="intro">
[div, div, p]           <p>
                            Introduction
[div, div]              </p>
[div]               </div>
[div, p]            <p>
                        The first paragraph
[div]               </p>
[div]               <img src="/img/img.png" alt="an image"/>
[div, p]            <p>
                        Another long paragraph
[div]               </p>
[]              </div>
</code>

en: The algorihm, is then really simple: 
fr: L'algorithme est alors très simple :
<code class="html">
let res be the XML as a string ; 
read res and each time you encouter a tag: 
    if it is an opening one: 
        push it to the stack
    else if it is a closing one: 
        pop the stack.

remove any malformed/cutted tag in the end of res
for each tag in the stack, pop it, and write:
    res = res + closed tag

return res
</code>

en: And `res` contain the repaired XML.
fr: Et `res` contiend le XML réparé.

en: Finally, this is the code in ruby I use. The `xml` variable contain the cutted XML.
fr: Finallement, voici le code en ruby que j'utilise. La variable `xml` contient le XML coupé.

<code class="ruby" file="repair_xml.rb">
# repair cutted XML code by closing the tags
# work even if the XML is cut into a tag.
# example:
#    transform '<div> <span> toto </span> <p> hello <a href="http://tur'
#    into      '<div> <span> toto </span> <p> hello </p></div>'
def repair_xml( xml )
    parents=[]
    depth=0
    xml.scan( %r{<(/?)(\w*)[^>]*(/?)>} ).each do |m|
        if m[2] == "/"
            next
        end
        if m[0] == "" 
            parents[depth]=m[1]
            depth+=1
        else
            depth-=1
        end
    end
    res=xml.sub(/<[^>]*$/m,'')
    depth-=1
    depth.downto(0).each { |x| res<<= %{</#{parents[x]}>} }
    res
end
</code>

en: I don't know if the code can help you, but the raisonning should definitively be known.
fr: Je ne sais pas si ce code pourra vous être utile. Par contre le raisonnement pour y parvenir mérite d'être connu.
