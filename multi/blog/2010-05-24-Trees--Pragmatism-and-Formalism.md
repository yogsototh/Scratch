-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-05-24T20:05:14+02:00
fr: title: Arbres ; Pragmatisme et Formalisme
fr: subtitle: Quand la théorie est plus pratique que la pratique
en: title: Trees; Pragmatism and Formalism
en: subtitle: When theory is more efficient than practice
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
    - XML
    - Perl
en:     - programming
en:     - tree
en:     - theory
en:     - mathematics
en:     - regexp
en:     - script
fr:     - programmation
fr:     - arbre
fr:     - théorie
fr:     - mathématiques
fr:     - regexp
fr:     - script
-----

begindiv(intro)

en: %tldr: 
en: 
en: - I tried to program a simple filter
en: - Was blocked 2 days
en: - Then stopped working like an engineer monkey
en: - Used a pen and a sheet of paper
en: - Made some math.
en: - Crushed the problem in 10 minutes
en: - Conclusion: The pragmatism shouldn't mean "never use theory".

fr: %tlal :
fr: 
fr: - J'ai essayé de programmer un simple filtre ;
fr: - J'ai été bloqué pendant deux jours ;
fr: - J'ai arrêté de penser comme un robot ;
fr: - J'ai utilisé un papier et un stylo ;
fr: - J'ai fait un peu de maths ;
fr: - J'ai résolu le problème en 10 minutes ;
fr: - Conclusion: Pragmatisme n'est pas : &laquo;n'utilisez jamais la théorie&raquo;.
enddiv

en: ## Abstract (longer than %tldr)
fr: ## Résumé (plus long que le  %tlal)

en: For my job, I needed to resolve a problem. It first seems not too hard. 
en: Then I started working directly on my program. 
en: I entered in the *infernal*: *try &amp; repair loop*.
en: Each step was like:

fr: Je devais résoudre un problème à mon travail. Au début cela
fr: semblait assez facile. J'ai donc commencé à programmer
fr: tout de suite. Je suis alors entré dans un cercle infernal d'essais
fr: et de réparations. Voilà à quoi ressemblait cet étrange état
fr: de boucle infini :

en: >   -- Just this thing to repair and that should be done.  
en: >   -- OK, now that should just work.  
en: >   -- Yeah!!!  
en: >   -- Oops! I forgotten that...  
en: >   `repeat until death`

fr: >   -- Plus que ça a réparer et ça devrait être bon.  
fr: >   -- Très bien, maintenant ça doit marcher.  
fr: >   -- Oui !!  
fr: >   -- Ah mince! J'ai oublié ce détail...  
fr: >   `répéter jusqu'à la mort`

en: After two days of this [Sisyphus](http://fr.wikipedia.org/wiki/Sisyphe) work, I finally just stopped to rethink the problem.
en: I took a pen, a sheet of paper. I simplified the problem, reminded what I learned during my Ph.D. about trees.
en: Finally, the problem was crushed in less than 20 minutes.
fr: Après deux jours à me prendre pour [Sisyphe](http://fr.wikipedia.org/wiki/Sisyphe), je me suis arrêté pour repenser le problème.
fr: J'ai pris un stylo et une feuille de papier. Je me suis souvenu de de ce que j'avais appris sur les arbres pendant mon doctorat.
fr: Finalement, le problème fut résolu en moins de 20 minutes.

en: I believe the important lesson is to remember that the most efficient methodology to resolve this *pragmatic* problem was the *theoretical* one. 
en: And therefore, argues opposing science, theory to pragmatism and efficiency are fallacies.
fr: Je pense que la leçon à retenir de cette expérience est de se souvenir que la méthodologie la plus efficace pour résoudre ce problème *pragamtique* était la méthode *théorique*. 
fr: Ça ne signifie pas que la méthode théorique est toujours la meilleure, mais en tout cas, il ne faut pas l'écarter.

newcorps

en: # First: my experience
fr: # L'anecdote

en: Apparently 90% of programmer are unable to program a binary search without bug. 
en: The algorithm is well known and easy to understand. 
en: However it is difficult to program it without any flaw. 
en: I participated to [this contest](http://reprog.wordpress.com/2010/04/19/are-you-one-of-the-10-percent/).
en: And you can see the [results here](http://reprog.wordpress.com/2010/04/21/binary-search-redux-part-1/)[^1].
en: I had to face a problem of the same kind at my job. The problem was simple to the start. Simply transform an <sc>xml</sc> from one format to another.

fr: Apparemment 90% des programmeurs sont incapable de programmer une recherche binaire sans faire de bug.
fr: L'algorithme est pourtant connu et facile à comprendre.
fr: Cependant, il est difficile à programmer sans bug.
fr: J'ai participé à [ce concours](http://reprog.wordpress.com/2010/04/19/are-you-one-of-the-10-percent/).
fr: Vous pouvez voir les [résultats ici](http://reprog.wordpress.com/2010/04/21/binary-search-redux-part-1/)[^1].
fr: J'ai dû faire face à un problème similaire à mon travail.
fr: Il paraissait simple au départ.
fr: Transformer un <sc>xml</sc> d'un format à un autre.

en: [^1]: Hopefully I am in the 10% who had given a bug free implementation.
fr: [^1]: Normalement, je fais parti des 10% qui ont fourni une implémentation sans bug.

en: The source <sc>xml</sc> was in the following general format:
fr: Voici le format général du <sc>xml</sc> source :

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

en: and the destination format was in the following general format:
fr: et le format d'arrivé est celui-ci :

<code class="xml">
<item name="Menu0">
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

en: At first sight I believed it will be easy. I was so certain it will be easy that I fixed to myself the following rules:
fr: À première vue, cela m'a paru simple. J'étais certain de pouvoir y arriver en me fixant les règles suivantes :

en: 1. do not use <sc>xslt</sc>
en: 2. avoid the use of an <sc>xml</sc> parser
en: 3. resolve the problem using a simple perl script[^2]
fr: 1. ne pas utiliser <sc>xslt</sc> ;
fr: 2. ne pas utiliser de parseur <sc>xml</sc> ;
fr: 3. résoudre le problème en utilisant un simple script perl

en: You can try if you want. If you attack the problem directly opening an editor, I assure you, it will certainly be not so simple.
en: I can tell that, because it's what I've done. And I must say I lost almost a complete day at work trying to resolve this. There was also, many small problems around that make me lose more than two days for this problem.
fr: Vous pouvez essayer si vous le souhaitez. Si vous attaquez ce problème directement en écrivant le programme, ce ne sera certainement pas si simple.
fr: Je peux le dire, parce que c'est ce que j'ai fait.
fr: Et je dois dire que j'ai perdu une journée de travail complète en m'y prenant de la sorte.
fr: En réalité, il y avait pas mal de petits détails dont je ne parle pas qui m'ont induis en erreur et qui m'ont fait perdre encore plus de temps.

en: Why after two days did I was unable to resolve this problem which seems so simple?
fr: Pourquoi étais-je incapable de résoudre ce problème si simple en aparence ?

en: What was my behaviour (workflow)?
fr: Voici comment je m'y suis pris :

en: 1. Think
en: 2. Write the program
en: 3. Try the program 
en: 4. Verify the result
en: 5. Found a bug
en: 6. Resolve the bug
en: 7. Go to step 3.

fr: 1. Réfléchir
fr: 2. Écrire le programme
fr: 3. Essayer le programme
fr: 4. Vérifier les résultats
fr: 5. Trouver un bug
fr: 6. Résoudre le bug
fr: 7. Reprendre à l'étape 3

en: This was a *standard* workflow for computer engineer. The flaw came from the first step. 
en: I thought about how to resolve the problem but with the eyes of a *pragmatic engineer*. I was saying:
fr: Il s'agissait d'une méthode de travail standard pour un ingénieur en informatique. L'erreur venait de la première étape.
fr: J'ai d'abord pensé à comment résoudre le problème mais avec des yeux d'*ingéinieur pragmatique*. Je me suis simplement dit :

en: > That should be a simple perl search and replace program.  
en: > Let's begin to write code
fr: > Ça à l'air de pouvoir se résouvre avec un petit script de *search&amp;replace* en perl
fr: > Commençons à écrire le code maintenant.

en: This is the second sentence that was plainly wrong. I started in the wrong direction. And the workflow did not work from this entry point.
fr: C'est la deuxième phrase qui est complètement fausse. Parce que j'avais mal commencé et que cette méthodologie de travail ne fonctionne pas lorsque l'on part vraiment mal.

en: ## Think
fr: ## Réfléchir

en: After some times, I just stopped to work. Tell myself *"it is enough, now, I must finish it!"*.
en: I took a sheet of paper, a pen and began to draw some trees.
fr: Après un certain temps, j'ai arrêté de programmer et je me suis dit : &laquo;Maintenant, ça suffit !&raquo;.
fr: J'ai pris une feuille et un stylo et j'ai commencé à dessiner des arbres.

en: I began by make by removing most of the verbosity.
en: I first renamed `<item name="Menu">` by simpler name `M` for example.
en: I obtained something like:
fr: J'ai commencer par simplifier un peu en enlevant le maximum de verbiage.
fr: Tout d'abord en renommant `<item name="Menu">` par un simple `M` par exemple.
fr: J'ai obtenu quelque chose comme :

<graph title="The source tree">
    subgraph cluster_x {
        node [label="C"] C_x ;
        node [label="E"] E_x ;
        node [label="a1"] tag1_x ;
        node [label="a2"] tag2_x ;
        node [label="R", color="#333333", fillcolor="#333333", fontcolor="white"] R_x ;
        R_x -> C_x;
        C_x -> tag1_x ;
        C_x -> tag2_x ;
        R_x -> E_x ;
    }
    subgraph cluster_y {
        node [label="C"] C_y ;
        node [label="E"] E_y ;
        node [label="a1"] tag1_y ;
        node [label="a2"] tag2_y ;
        node [label="R", color="#333333", fillcolor="#333333", fontcolor="white"] R_y ;
        R_y -> C_y;
        C_y -> tag1_y ;
        C_y -> tag2_y ;
        R_y -> E_y ;
    }
    subgraph cluster_z {
        node [label="C"] C_z ;
        node [label="E"] E_z ;
        node [label="a1"] tag1_z ;
        node [label="a2"] tag2_z ;
        node [label="R", color="#333333", style="filled", fillcolor="#333333", fontcolor="white"] R_z ;
        R_z -> C_z;
        C_z -> tag1_z ;
        C_z -> tag2_z ;
        R_z -> E_z ;
    }
    E_x -> R_y ;
    E_x -> R_z ;

</graph>

en: and
fr: et

<graph title="The destination tree">
    subgraph cluster_x {
        node [label="M"] E_x ;
        node [label="a1"] tag1_x ;
        node [label="V"] value_tag1_x ;
        node [label="a2"] tag2_x ;
        node [label="V"] value_tag2_x ;
        node [label="V", color="#333333", fillcolor="#333333", fontcolor="white"] R_x ;
        R_x -> value_tag1_x -> tag1_x ;
        R_x -> value_tag2_x -> tag2_x ;
        R_x -> E_x ;
    }
    subgraph cluster_y {
        node [label="M"] E_y ;
        node [label="a1"] tag1_y ;
        node [label="V"] value_tag1_y ;
        node [label="a2"] tag2_y ;
        node [label="V"] value_tag2_y ;
        node [label="V", color="#333333", fillcolor="#333333", fontcolor="white"] R_y ;
        R_y -> value_tag1_y -> tag1_y ;
        R_y -> value_tag2_y -> tag2_y ;
        R_y -> E_y ;
    }
    subgraph cluster_z {
        node [label="M"] E_z ;
        node [label="a1"] tag1_z ;
        node [label="V"] value_tag1_z ;
        node [label="a2"] tag2_z ;
        node [label="V"] value_tag2_z ;
        node [label="V", color="#333333", fillcolor="#333333", fontcolor="white"] R_z ;
        R_z -> value_tag1_z -> tag1_z ;
        R_z -> value_tag2_z -> tag2_z ;
        R_z -> E_z ;
    }
    E_x -> R_y ;
    E_x -> R_z ;

</graph>

en: Then I made myself the following reflexion:
fr: Puis, je me suis fait la réflexion suivante :

en: Considering Tree Edit Distance, each unitary transformation of tree correspond to a simple search and replace on my <sc>xml</sc> source[^nb].
en: We consider three atomic transformations on trees:
fr: Dans les distances d'éditions sur les arbres, chaque opération atomique correspond à un simple *search and replace* sur mon fichier <sc>xml</sc> source[^nb].
fr: On considère trois opérations atomiques sur les arbres :

en:  - *substitution*: renaming a node
en:  - *insertion*: adding a node
en:  - *deletion*: remove a node
fr:  - *substitution*: renommer un nœud
fr:  - *insertion*: ajouter un nœud
fr:  - *délétion*: supprimer un nœud


en: [^nb]: I did a program which generate automatically the weight in a matrix of each edit distance from data.
fr: [^nb]: J'ai programmé un outil qui calcule automatiquement le poids de chaque élément des matrices d'édition à partir de données.

en: One of the particularity of atomic transformations on trees, is ; if you remove a node, all children of this node, became children of its father.
fr: Une des particularité avec les transformations sur les arbres est celle-ci : 
fr: supprimer un nœud et tous ses enfants deviendront les enfants du père de ce nœud.

en: An example:
fr: Un exemple:

<pre class="twilight">
r - x - a
  \   \
   \    b
    y - c   
</pre>

en: If you delete the `x` node, you obtain
fr: Si vous supprimez le nœud `x`, vous obtenez

<pre class="twilight">
    a
  /
r - b
  \
    y - c   
</pre>

en: And look at what it implies when you write it in <sc>xml</sc>:
fr: Et regardez ce que ça implique quand on l'écrit en <sc>xml</sc> :

<code class="xml">
<r>
  <x>
    <a>value for a</a>
    <b>value for b</b>
  </x>
  <y>
    <c>value for c</c>
  </y>
</r>
</code>

en: Then deleting all `x` nodes is equivalent to pass the <sc>xml</sc> via the following search and replace script:
fr: Alors supprimer tous les nœuds `x` revient à faire passer le <sc>xml</sc> à travers le filtre suivant :

<code class="perl">
s/<\/?x>//g
</code>

en: Therefore, if there exists a one state deterministic transducer which transform my trees ;
en: I can transform the <sc>xml</sc> from one format to another with just a simple list of search and replace directives.
fr: Par conséquent, s'il existe un transducteur déterministe à un état qui permet de transformer mes arbres ; 
fr: je suis capable de transformer le <sc>xml</sc> d'un format à l'autre en utilisant une simple liste de *search and replace*.

# Solution

en: Transform this tree:
fr: Transformer cet arbre :

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

en: to this tree:
fr: en celui-ci :

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


en: can be done using the following one state deterministic tree transducer:
fr: peut-être fait en utilisant le transducteur déterministe à un état suivant: 


>    C -> &epsilon;  
>    E -> M  
>    R -> V  

en: Wich can be traduced by the following simple search and replace directives: 
fr: Ce qui peut-être traduit par les simples directives Perl suivantes :

<code class="perl">
s/C//g
s/E/M/g
s/R/V/g
</code>

en: Once adapted to <sc>xml</sc> it becomes:
fr: Une fois adapté au <sc>xml</sc> cela devient :

<code class="perl">
s%</?contenu>%%g
s%<enfant>%<item name="menu">%g
s%</enfant>%</item>%g
s%<rubrique>%<value>%g
s%</rubrique>%</value>%g
</code>

en: That is all.
fr: Et c'est tout.

# Conclusion

en: It should seems a bit paradoxal, but sometimes the most efficient approach to a pragmatic problem is to use the theoretical methodology.
fr: Même si cela peut sembler paradoxal, parfois la solution la plus efficace à un problème pragmatique est d'utiliser une méthodologie théorique.
