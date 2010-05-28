-----
isHidden:       true
menupriority:   1
kind:           article
created_at:     2010-05-24T20:05:14+02:00
title: Arbres ; Pragmatisme et Formalisme
subtitle: Quand la théorie est plus pratique que la pratique
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
    - arbre
    - théorie
    - mathématiques
    - regexp
    - script
-----

begindiv(intro)
<% tlal=%{<abbr title="Trop Long À Lire"><sc>tlàl</sc></abbr>} %>


<%=tlal%> :

- J'ai essayé de programmer un simple filtre ;
- J'ai été bloqué pendant deux jours ;
- J'ai arrêté de penser comme un robot ;
- J'ai utilisé un papier et un stylo ;
- J'ai fait un peu de maths ;
- J'ai résolu le problème en 10 minutes ;
- Conclusion: Pragmatisme n'est pas : &laquo;n'utilisez jamais la théorie&raquo;.
enddiv

## Résumé (plus long que le  <%=tlal%>)


Je devais résoudre un problème à mon travail. Au début cela
semblait assez facile. J'ai donc commencé à programmer
tout de suite. Je suis alors entré dans un cercle infernal d'essais
et de réparations. Voilà à quoi ressemblait cet étrange état
de boucle infini :


>   -- Plus que ça a réparer et ça devrait être bon.  
>   -- Très bien, maintenant ça doit marcher.  
>   -- Oui !!  
>   -- Ah mince! J'ai oublié ce détail...  
>   `répéter jusqu'à la mort`

Après deux jours à me prendre pour [Sisyphe](http://fr.wikipedia.org/wiki/Sisyphe), je me suis arrêté pour repenser le problème.
J'ai pris un stylo et une feuille de papier. Je me suis souvenu de de ce que j'avais appris sur les arbres pendant mon doctorat.
Finalement, le problème fut résolu en moins de 20 minutes.

Je pense que la leçon à retenir de cette expérience est de se souvenir que la méthodologie la plus efficace pour résoudre ce problème *pragamtique* était la méthode *théorique*. 
Et par conséquent, les arguments qui opposent la science et la théories au pragmatisme et à l'efficacité sont faux.

newcorps

# L'anecdote


Apparemment 90% des programmeurs sont incapable de programmer une recherche binaire sans faire de bug.
L'algorithme est pourtant connu et facile à comprendre.
Cependant, il est difficile à programmer sans bug.
J'ai participé à [ce concours](http://reprog.wordpress.com/2010/04/19/are-you-one-of-the-10-percent/).
Vous pouvez voir les [résultats ici](http://reprog.wordpress.com/2010/04/21/binary-search-redux-part-1/)[^1].
J'ai dû faire face à un problème similaire à mon travail.
Il paraissait simple au départ.
Transformer un <sc>xml</sc> d'un format à un autre.

[^1]: Normalement, je fais parti des 10% qui ont fourni une implémentation sans bug.

Voici le format général du <sc>xml</sc> source :

<code class="xml">
<rubrique>
    <contenu>
        <tag1>value1</tag1>
        <tag2>value2</tag2>
        ...
    </contenu>
    <enfant>
        <rubrique>
            ...
        </rubrique>
        ...
        <rubrique>
            ...
        </rubrique>
    </enfant>
</menu>
</code>

et le format d'arrivé est celui-ci :

<code class="xml">
<item name="Menu">
    <value>
        <item name="menu">
            <value>
                <item name="tag1">
                    <value>value1</value>
                </item>
                <item name="tag2">
                    <value>value2</value>
                </item>
                ...
                <item name="menu">
                    <value>
                        ...
                    </value>
                    <value>
                        ...
                    </value>
                </item>
            </value>
        </item>
    </value>
</item>
</code>

À première vue, cela m'a paru simple. J'étais certain de pouvoir y arriver en me fixant les règles suivantes :

1. ne pas utiliser <sc>xslt</sc> ;
2. ne pas utiliser de parseur <sc>xml</sc> ;
3. résoudre le problème en utilisant un simple script perl

Vous pouvez essayer si vous le souhaitez. Si vous attaquez ce problème directement en écrivant le programme, ce ne sera certainement pas si simple.
Je peux le dire, parce que c'est ce que j'ai fait.
Et je dois dire que j'ai perdu une journée de travail complète en m'y prenant de la sorte.
En réalité, il y avait pas mal de petits détails dont je ne parle pas qui m'ont induis en erreur et qui m'ont fait perdre encore plus de temps.

Pourquoi étais-je incapable de résoudre se problème alors qu'il avait l'air 

Voici comment je m'y prenais :


1. Réfléchir
2. Écrire le programme
3. Essayer le programme
4. Vérifier les résultats
5. Trouver un bug
6. Résoudre le bug
7. Reprendre à l'étape 3

Il s'agissait d'une méthode de travail standard pour un ingénieur en informatique. L'erreur venait de la première étape.
J'ai d'abord pensé à comment résoudre le problème mais avec des yeux d'*ingéinieur pragmatique*. Je me suis simplement dit :

> Ça à l'air de pouvoir se résouvre avec un petit script de *search&amp;replace* en perl
> Commençons à écrire le code maintenant.

C'est la deuxième phrase qui est complètement fausse. Parce que j'avais mal commencé et que cette méthodologie de travail ne fonctionne pas lorsque l'on part vraiment mal.

## La réflexion

## spoiler

In the end, the program should be a simple list of search and replace:
<code class="perl">
s/something/something else/g 
</code>

It is not only possible but I believe it is the best way of doing this.

# Solution

Transform this tree:

<pre class="twilight">
R - C - tag1
  \   \
   \    tag2
    E -- R - C - tag1
      \   \    \
       \   \     tag2
        \    E ...
         R - C - tag1 
           \    \
            \     tag2
             E ...
</pre>

to this tree:

<pre class="twilight">
                tag1
              /
M - V - M - V - tag2      tag1
              \         / 
                M --- V - tag2
                  \     \ 
                   \      M
                    \     tag1
                     \  / 
                      V - tag2
                        \ 
                          M
</pre>

using only an acyclic deterministic tree transducer:


>    C -> &epsilon;  
>    E -> R  
>    R -> V  

Wich can be traduced by the following simple regular expression expression:

<code class="perl">
s/C//g
s/E/M/g
s/R/V/g
</code>

Adapted to XML it becomes:

<code class="perl">
s!</?contenu>!!g
s!<enfant>!<item name="menu">!g
s!</enfant>!<item>!g
s!</?rubrique>!<value>!g
s!</rubrique>!</value>!g
</code>

That is all.

# conclusion

It should seems a bit paradoxal, but sometimes the most pragmatic approach to a pragmatic problem is to use the theoretical methodology. Not the commonly accepted pragmatic one. This simple experience prove this point.
