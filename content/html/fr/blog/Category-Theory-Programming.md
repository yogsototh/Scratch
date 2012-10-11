-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-10-01T19:16:43+02:00
title: Programmation en Théorie des Catégories
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Haskell
  - programming
  - functional
  - category theory
-----

begindiv(intro)

%tlal Comment programmer en utilisant la théorie des catégories.

> <center><hr style="width:30%;float:left;border-color:#CCCCD0;margin-top:1em"/><span class="sc"><b>Table of Content</b></span><hr style="width:30%;float:right;border-color:#CCCCD0;margin-top:1em"/></center>
> 
> * This will be replaced by the ToC
> {:toc}
>

enddiv

## Introduction

%TODO{Do everything after the end}

Now, it is time to talk about Categories.
How this notion could help you and how it is easy to use with Haskell.

- What are categories?
- How to use them?

### Programming Paradigms

When you program, you resolve problems.
There are a lot of different means to resolve a problem.
Many different "school of thought"[^school] exists.

[^school]: Écoles de pensées

**Imperative paradigm**:
In programming, most people use the imperative paradigm.
You have an infinite number of cell and you can write things on them.
Of course, it is more complex with modern architecture, but the paradigm is the same.
Hidden somewhere, there is the model of the Turing machine.

**Functional paradigm**:
Another paradigm, is the functional paradigm.
This time, you don't write on cells, but instead you have a flow of data.
And you transform the flows in another flows... Mostly it looks like pipes.
I am a bit restrictive here. But generally this is how functional programming is perceived.
The main theory behind this paradigm is the Set theory.
You have a set and you go from one set to another set by using a function.

**Category paradigm**:
I believe there is another paradigm arising from Category theory.
Category theory feels both more general and powerful to help solve problems.

First, you must realize there are categories everywhere.
With the category theory you can find relationships between quantum physics,
topology, logic (both predicate and first order), programming.
Most of the time, the object your are programming with will form a category.

This is the promise from the Category Theory.
Another even better paradigm.
A paradigm with gates between many different domains.

## Get some intuition

We write down the definition first.
And will discuss about some categories.

<div style="display:none">
\\( \newcommand{\hom}{\mathrm{hom}} \\)
</div>

 > **Definition**:
 >
 > A category \\(C\\) consist of:
 >
 > - A collection of _objects_ \\(ob(C)\\)
 > - For every pair of objects \\((A,B)\\) a set \\(\hom(A,B)\\)
 >   of _morphisms_ \\(f:A→B\\) (Another notation for \\(f\in \hom(A,B)\\))
 > - A composition operator \\(∘\\)
 >   which associate to each couple \\(g:A→B\\), \\(f:B→C\\) another morphism \\(f∘g:A→C\\).
 >
 > With the following properties
 >
 > - for each object \\(x\\) there is an identity morphism  
 >   \\(id_x:x→x\\)  
 >   s.t. for any morphism \\(f:A->B\\),  
 >   \\(id_A∘f = f = f∘id_B\\)
 > - for all triplet of morphisms \\(h:A->B\\), \\(g:B->C\\) and \\(f:C->D\\)  
 >   \\( (f∘g)∘h = f∘(g∘h) \\)

### Representation of Category

Representing Category is not just a game.
It will be _very_ important.
But in the same time, it will help you to gain intuition about categories.

A naïve representation (which can work in many cases) is to represent
a specific category as a directed graph.
Here is a first example of the representation of a category:

<graph title="First Naïve Category Representation">

A -> B [label="f"]
B -> C [label="g"]
A -> C [label="h"]

A -> A [label="idA"]
B -> B [label="idB"]
C -> C [label="idC"]

</graph>

From this graph we can conclude without any ambiguity that:

\\[ob(C)=\\{A,B,C\\}\\]
and
\\[\hom(C)=\\{f,g,h,idA,idB,idC\\}\\]

Instantaneously, we understand that we can get rid of all \\(idX\\) arrows.

But in reality, we lack an important information.
What is \\(∘\\)?

Now, we can add informations to our previous representation.
We simply add a relation between 3 arrows that represent the composition.

<graph title="Naïve Category Representation">

f[label="", fixedsize="false", width=0,height=0,shape=none];
A -> f[label="f", arrowhead=None]
f -> B

g[label="", fixedsize="false", width=0,height=0,shape=none];
B -> g[label="g", arrowhead=None]
g -> C

fg      [label="", fixedsize="false", width=0,height=0,shape=none];
AC      [label="", fixedsize="false", width=0,height=0,shape=none];

f -> fg  [color="#b58900",style=dashed,arrowhead=None]
fg -> g  [color="#b58900",style=dashed,arrowhead=None]
fg -> AC [label="h=g∘f",fontcolor="#b58900",color="#b58900",style=bold]

A -> AC [label="h",arrowhead=None]
AC -> C

</graph>

Now we have a complete representation.
We don't have to represent \\(idX\\), we know there are there.
And we also don't have to represent composition implying \\(idX\\) morphisms.
But, even this little graph look complex.
To show just how complex things can be;
we just double the number morphisms between different objects.

<graph title="Naïve Category Representation Mess">

f[label="", fixedsize="false", width=0,height=0,shape=none];
A -> f[label="f", arrowhead=None]
f -> B

fp[label="", fixedsize="false", width=0,height=0,shape=none];
A -> fp[label="f'", arrowhead=None]
fp -> B

g[label="", fixedsize="false", width=0,height=0,shape=none];
B -> g[label="g", arrowhead=None]
g -> C

gp[label="", fixedsize="false", width=0,height=0,shape=none];
B -> gp[label="g'", arrowhead=None]
gp -> C

fg[label="", fixedsize="false", width=0,height=0,shape=none];
fpg[label="", fixedsize="false", width=0,height=0,shape=none];
fgp[label="", fixedsize="false", width=0,height=0,shape=none];
fpgp[label="", fixedsize="false", width=0,height=0,shape=none];
AC[label="", fixedsize="false", width=0,height=0,shape=none];
ApCp[label="", fixedsize="false", width=0,height=0,shape=none];

f -> fg  [color="#b58900",style=dashed,arrowhead=None]
fg -> g  [color="#b58900",style=dashed,arrowhead=None]
fg -> AC [color="#b58900",style=bold,fontcolor="#b58900",label="h=g∘f"]

fp -> fpgp [color="#d33682",style=dashed,arrowhead=None]
fpgp -> gp [color="#d33682",style=dashed,arrowhead=None]
fpgp -> AC [color="#d33682",style=bold,fontcolor="#d33682",label="h=g'∘f'"]

fp -> fpg   [color="#dc322f",style=dashed,arrowhead=None]
fpg -> g    [color="#dc322f",style=dashed,arrowhead=None]
fpg -> ApCp [color="#dc322f",style=bold,fontcolor="#dc322f",label="h'=g∘f'"]

f -> fgp    [color="#268bd2",style=dashed,arrowhead=None]
fgp -> gp   [color="#268bd2",style=dashed,arrowhead=None]
fgp -> ApCp [color="#268bd2",style=bold,fontcolor="#268bd2",label="h'=g'∘f"]

A -> AC [label="h",arrowhead=None]
AC -> C

A -> ApCp [label="h'",arrowhead=None]
ApCp -> C

</graph>

In fact we could have made something equivalent and far easier to read.
But the ∘ relation will be more hidden.

<graph title="Less Graphic Category Representation">

A -> B[label="f"]
A -> B[label="f'"]
B -> C[label="g"]
B -> C[label="g'"]
A -> C [label="h\n=g∘f\n=g'∘f'"]
A -> C [label="h'\n=g'∘f\n=g∘f'"]

</graph>
