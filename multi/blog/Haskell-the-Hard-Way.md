-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-02-08T15:17:53+02:00
en: title: Learn Haskell Fast and Hard
en: subtitle: Blow your mind with Haskell
fr: title: Haskell comme un vrai!
fr: subtitle: Haskell à s'en faire griller les neurones
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Haskell
  - programming
  - functional
  - tutorial
-----
blogimage("magritte_pleasure_principle.jpg","Magritte pleasure principle")

begindiv(intro)

en: %tldr A very short and dense tutorial for learning Haskell.

fr: %tlal Un tutoriel très court mais très dense pour apprendre Haskell.

en: Thanks to [Oleg Taykalo](https://plus.google.com/u/0/113751420744109290534) you can find a Russian translation here: [Part 1](http://habrahabr.ru/post/152889/) _&_ [Part 2](http://habrahabr.ru/post/153383/) ; 
fr: Merci à [Oleg Taykalo](https://plus.google.com/u/0/113751420744109290534) vous pouvez trouver une traduction Russe ici: [Partie 1](http://habrahabr.ru/post/152889/) _&_ [Partie 2](http://habrahabr.ru/post/153383/) ; 

> <center><hr style="width:30%;float:left;border-color:#CCCCD0;margin-top:1em"/><span class="sc"><b>Table of Content</b></span><hr style="width:30%;float:right;border-color:#CCCCD0;margin-top:1em"/></center>
>
> begindiv(toc)
>
> * <a href="#introduction">Introduction</a>
>   * <a href="#install">Install</a>
>   * <a href="#don-t-be-afraid">Don't be afraid</a>
>   * <a href="#very-basic-haskell">Very basic Haskell</a>
>     * <a href="#function-declaration">Function declaration</a>
>     * <a href="#a-type-example">A Type Example</a>
> * <a href="#essential-haskell">Essential Haskell</a>
>   * <a href="#notations">Notations</a>
>       * <a href="#arithmetic">Arithmetic</a>
>       * <a href="#logic">Logic</a>
>       * <a href="#powers">Powers</a>
>       * <a href="#lists">Lists</a>
>       * <a href="#strings">Strings</a>
>       * <a href="#tuples">Tuples</a>
>       * <a href="#deal-with-parentheses">Deal with parentheses</a>
>   * <a href="#useful-notations-for-functions">Useful notations for functions</a>
> * <a href="#hard-part">Hard Part</a>
>   * <a href="#functional-style">Functional style</a>
>     * <a href="#higher-order-functions">Higher Order Functions</a>
>   * <a href="#types">Types</a>
>     * <a href="#type-inference">Type inference</a>
>     * <a href="#type-construction">Type construction</a>
>     * <a href="#recursive-type">Recursive type</a>
>     * <a href="#trees">Trees</a>
>   * <a href="#infinite-structures">Infinite Structures</a>
> * <a href="#hell-difficulty-part">Hell Difficulty Part</a>
>   * <a href="#deal-with-io">Deal With IO</a>
>   * <a href="#io-trick-explained">IO trick explained</a>
>   * <a href="#monads">Monads</a>
>     * <a href="#maybe-monad">Maybe is a monad</a>
>     * <a href="#the-list-monad">The list monad</a>
> * <a href="#appendix">Appendix</a>
>   * <a href="#more-on-infinite-tree">More on Infinite Tree</a>
>
> enddiv

enddiv
begindiv(intro)

en: I really believe all developer should learn Haskell.
en: I don't think all should be super Haskell ninjas,
en: but at least, they should discover what Haskell has to offer.
en: Learning Haskell open your mind.
fr: Je pense vraiment que
fr: tous les développeurs devraient apprendre Haskell.
fr: Peut-être pas devenir des ninjas d'Haskell, 
fr: mais au moins savoir ce que ce langage a de particulier.
fr: Son apprentissage ouvre énormément l'esprit.

en: Mainstream languages share the same foundations:
fr: La plupart des langages partagent les mêmes fondamentaux :

en: - variables
en: - loops
en: - pointers[^0001]
en: - data structures, objects and classes (for most)
fr: - les variables
fr: - les boucles
fr: - les pointeurs[^0001]
fr: - les structures de données, les objets et les classes

en: [^0001]: Even if most recent languages try to hide them, they are present.
fr: [^0001]: Même si tous les langages récents essayent de les cacher, ils restent présents.

en: Haskell is very different.
en: This language uses a lot of concepts I had never heard about before.
en: Many of those concepts will help you become a better programmer.
fr: Haskell est très différent.
fr: Ce langage utilise des concepts dont je n'avais jamais entendu parlé avant.
fr: Beaucoup de ces concepts pourront vous aider à devenir un meilleur développeur.

en: But, learning Haskell can be hard.
en: It was for me.
en: In this article I try to provide what I lacked during my learning.
fr: Plier son esprit à Haskell peut être difficile.
fr: Ce le fût pour moi.
fr: Dans cet article, j'essaye de fournir les informations qui m'ont manquées lors de mon apprentissage.

en: This article will certainly be hard to follow.
en: This is on purpose.
en: There is no shortcut to learning Haskell.
en: It is hard and challenging. 
en: But I believe this is a good thing.
en: It is because it is hard that Haskell is interesting.
fr: Cet article sera certainement difficile à suivre.
fr: Mais c'est voulu.
fr: Il n'y a pas de raccourci pour apprendre Haskell.
fr: C'est difficile.
fr: Mais je pense que c'est une bonne chose.
fr: C'est parce qu'Haskell est difficile qu'il est intéressant.

en: The conventional method to learning Haskell is to read two books. 
en: First ["Learn You a Haskell"](http://learnyouahaskell.com) and just after ["Real World Haskell"](http://www.realworldhaskell.org).
en: I also believe this is the right way to go.
en: But, to learn what Haskell is all about, you'll have to read them in detail.
fr: La manière conventionnelle d'apprendre Haskell est de lire deux livres.
fr: En premier ["Learn You a Haskell"](http://learnyouahaskell.com) 
fr: et ensuite ["Real World Haskell"](http://www.realworldhaskell.org).
fr: Je pense aussi que c'est la bonne manière de s'y prendre.
fr: Mais apprendre même un tout petit peu d'Haskell est presque impossible sans se plonger réellement dans ces livres.

en: On the other hand, this article is a very brief and dense overview of all major aspects of Haskell.
en: I also added some informations I lacked while I learned Haskell.
fr: Cet article fait un résumé très dense et rapide des aspect majeurs d'Haskell.
fr: J'y ai aussi rajouté des informations qui m'ont manqué pendant l'apprentissage de ce langage.

fr: Pour les francophones ; je suis désolé. 
fr: Je n'ai pas eu le courage de tout retraduire en français.
fr: Sachez cependant que si vous êtes plusieurs à insister, je ferai certainement l'effort de traduire l'article en entier.
fr: Et si vous vous sentez d'avoir une bonne âme je ne suis pas contre un peu d'aide.
fr: Les sources de cet article sont sur [gihub](http://github.com/yogsototh/learn_haskell.git).

en: The article contains five parts:
fr: Cet article contient cinq parties :

en: - Introduction: a short example to show Haskell can be friendly.
en: - Basic Haskell: Haskell syntax, and some essential notions.
en: - Hard Difficulty Part:
en:     - Functional style; a progressive example, from imperative to functional style
en:     - Types; types and a standard binary tree example
en:     - Infinite Structure; manipulate an infinite binary tree!
en: - Hell Difficulty Part:
en:     - Deal with IO; A very minimal example
en:     - IO trick explained; the hidden detail I lacked to understand IO
en:     - Monads; incredible how we can generalize
en: - Appendix:
en:     - More on infinite tree; a more math oriented discussion about infinite trees

fr: - Introduction : un exemple rapide pour montrer qu'Haskell peut être facile.
fr: - Les bases d'Haskell : La syntaxe et des notions essentielles
fr: - Partie difficile : 
fr:     - Style fonctionnel : un exemple progressif, du style impératif au style fonctionnel ;
fr:     - Types : la syntaxe et un exemple d'arbre binaire ;
fr:     - Structure infinie : manipulons un arbre infini !
fr: - Partie de difficulté infernale :
fr:     - Utiliser les IO : un exemple très minimal ;
fr:     - Le truc des IO révélé : les détails cachés d'IO qui m'ont manqués
fr:     - Les monades : incroyable à quel point on peut généraliser
fr: - Appendice :
fr:     - Revenons sur les arbres infinis : une discussion plus mathématique sur la manipulation d'arbres infinis.

en:  > Note: Each time you'll see a separator with a filename ending in `.lhs`, 
en:  > you could click the filename to get this file. 
en:  > If you save the file as `filename.lhs`, you can run it with 
en:  > <pre>
en:  > runhaskell filename.lhs
en:  > </pre>
en:  >
en:  > Some might not work, but most will.
en:  > You should see a link just below.

fr:  > Note: Chaque fois que vous voyez un séparateur avec un nom de fichier se terminant par `lhs`, vous pouvez cliquer sur le nom de fichier et télécharger le fichier. 
fr:  > Si vous sauvegardez le fichier sour le nom `filename.lhs`, vous pouvez l'exécuter avec :
fr:  > <pre>
fr:  > runhaskell filename.lhs
fr:  > </pre>
fr:  >
fr:  > Certains ne marcheront pas, mais la majorité vous donneront un résultat.
fr:  > Vous devriez voir un lien juste en dessous.

enddiv

<hr/><a href="code/01_basic/10_Introduction/00_hello_world.lhs" class="cut">01_basic/10_Introduction/<strong>00_hello_world.lhs</strong></a>

<h2 id="introduction">Introduction</h2>

<h3 id="install">Install</h3>

blogimage("Haskell-logo.png", "Haskell logo")

- [Haskell Platform](http://www.haskell.org/platform) is the standard way to install Haskell.

Tools:

- `ghc`: Compiler similar to gcc for `C`.
- `ghci`: Interactive Haskell (REPL)
- `runhaskell`: Execute a program without compiling it. Convenient but very slow compared to compiled programs.

<h3 id="don-t-be-afraid">Don't be afraid</h3>

blogimage("munch_TheScream.jpg","The Scream")

Many book/articles about Haskell start by introducing some esoteric formula (quick sort, Fibonacci, etc...).
I will do the exact opposite.
At first I won't show you any Haskell super power.
I will start with similarities between Haskell and other programming languages.
Let's jump to the mandatory "Hello World".

<div class="codehighlight">
<code class="haskell">
main = putStrLn "Hello World!"
</code>
</div>
To run it, you can save this code in a `hello.hs` and:

<code class="zsh">
~ runhaskell ./hello.hs
Hello World!
</code>

You could also download the literate Haskell source.
You should see a link just above the introduction title.
Download this file as `00_hello_world.lhs` and:

<code class="zsh">
~ runhaskell 00_hello_world.lhs
Hello World!
</code>

<a href="code/01_basic/10_Introduction/00_hello_world.lhs" class="cut">01_basic/10_Introduction/<strong>00_hello_world.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/10_hello_you.lhs" class="cut">01_basic/10_Introduction/<strong>10_hello_you.lhs</strong></a>

Now, a program asking your name and replying "Hello" using the name you entered:

<div class="codehighlight">
<code class="haskell">
main = do
    print "What is your name?"
    name <- getLine
    print ("Hello " ++ name ++ "!")
</code>
</div>
First, let us compare with a similar program in some imperative languages:

<code class="python">
# Python
print "What is your name?"
name = raw_input()
print "Hello %s!" % name
</code>

<code class="ruby">
# Ruby
puts "What is your name?"
name = gets.chomp
puts "Hello #{name}!"
</code>

<code class="c">
// In C
#include <stdio.h>
int main (int argc, char **argv) {
    char name[666]; // <- An Evil Number!
    // What if my name is more than 665 character long?
    printf("What is your name?\n"); 
    scanf("%s", name);
    printf("Hello %s!\n", name);
    return 0;
}
</code>

The structure is the same, but there are some syntax differences.
A major part of this tutorial will be dedicated to explaining why.

In Haskell, there is a `main` function and every object has a type.
The type of `main` is `IO ()`.
This means, `main` will cause side effects.

Just remember that Haskell can look a lot like mainstream imperative languages.

<a href="code/01_basic/10_Introduction/10_hello_you.lhs" class="cut">01_basic/10_Introduction/<strong>10_hello_you.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/20_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>20_very_basic.lhs</strong></a>

<h3 id="very-basic-haskell">Very basic Haskell</h3>

blogimage("picasso_owl.jpg","Picasso minimal owl")

Before continuing you need to be warned about some essential properties of Haskell.

_Functional_

Haskell is a functional language.
If you have an imperative language background, you'll have to learn a lot of new things.
Hopefully many of these new concepts will help you to program even in imperative languages.

_Smart Static Typing_

Instead of being in your way like in `C`, `C++` or `Java`, the type system is here to help you.

_Purity_

Generally your functions won't modify anything in the outside world.
This means, it can't modify the value of a variable, can't get user input, can't write on the screen, can't launch a missile.
On the other hand, parallelism will be very easy to achieve.
Haskell makes it clear where effects occur and where you are pure.
Also, it will be far easier to reason about your program.
Most bugs will be prevented in the pure parts of your program.

Furthermore pure functions follow a fundamental law in Haskell:

 > Applying a function with the same parameters always returns the same value.

_Laziness_

Laziness by default is a very uncommon language design.
By default, Haskell evaluates something only when it is needed.
In consequence, it provides a very elegant way to manipulate infinite structures for example.

A last warning on how you should read Haskell code.
For me, it is like reading scientific papers.
Some parts are very clear, but when you see a formula, just focus and read slower.
Also, while learning Haskell, it _really_ doesn't matter much if you don't understand syntax details.
If you meet a `>>=`, `<$>`, `<-` or any other weird symbol, just ignore them and follows the flow of the code.

<h4 id="function-declaration">Function declaration</h4>

You might be used to declare functions like this:

In `C`:

<code class="c">
int f(int x, int y) {
    return x*x + y*y;
}
</code>

In Javascript:

<code class="javascript">
function f(x,y) {
    return x*x + y*y;
}
</code>

in Python:

<code class="python">
def f(x,y):
    return x*x + y*y
</code>

in Ruby:

<code class="ruby">
def f(x,y)
    x*x + y*y
end
</code>

In Scheme:

<code class="scheme">
(define (f x y)
    (+ (* x x) (* y y)))
</code>

Finally, the Haskell way is:

<code class="haskell">
f x y = x*x + y*y
</code>

Very clean. No parenthesis, no `def`.

Don't forget, Haskell uses functions and types a lot.
It is thus very easy to define them.
The syntax was particularly well thought for these objects.

<h4 id="a-type-example">A Type Example</h4>

The usual way is to declare the type of your function.
This is not mandatory.
The compiler is smart enough to discover it for you.

Let's play a little.

<div class="codehighlight">
<code class="haskell">
-- We declare the type using ::
f :: Int -> Int -> Int
f x y = x*x + y*y

main = print (f 2 3)
</code>
</div>
~~~
~ runhaskell 20_very_basic.lhs
13
~~~

<a href="code/01_basic/10_Introduction/20_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>20_very_basic.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/21_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>21_very_basic.lhs</strong></a>

Now try

<div class="codehighlight">
<code class="haskell">
f :: Int -> Int -> Int
f x y = x*x + y*y

main = print (f 2.3 4.2)
</code>
</div>
You get this error:

~~~
21_very_basic.lhs:6:23:
    No instance for (Fractional Int)
      arising from the literal `4.2'
    Possible fix: add an instance declaration for (Fractional Int)
    In the second argument of `f', namely `4.2'
    In the first argument of `print', namely `(f 2.3 4.2)'
    In the expression: print (f 2.3 4.2)
~~~

The problem: `4.2` isn't an Int.

<a href="code/01_basic/10_Introduction/21_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>21_very_basic.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/22_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>22_very_basic.lhs</strong></a>

The solution, 
don't declare the type for `f`.
Haskell will infer the most general type for us:

<div class="codehighlight">
<code class="haskell">
f x y = x*x + y*y

main = print (f 2.3 4.2)
</code>
</div>
It works! 
Great, we don't have to declare a new function for every single type.
For example, in `C`, you'll have to declare a function for `int`, for `float`, for `long`, for `double`, etc...

But, what type should we declare?
To discover the type Haskell has found for us, just launch ghci:

<pre><span class="low">
%</span> ghci<span class="low"><code>
GHCi, version 7.0.4: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Loading package ffi-1.0 ... linking ... done.
Prelude></code></span> let f x y = x*x + y*y
<span class="low"><code>Prelude></code></span> :type f
<code>f :: Num a => a -> a -> a</code>
</pre>

Uh? What is this strange type?

~~~
Num a => a -> a -> a
~~~

First, let's focus on the right part `a -> a -> a`.
To understand it, just look at a list of progressive examples: 

| The&nbsp;written&nbsp;type | Its meaning |
| `Int`            | the type `Int`                              |
| `Int -> Int`     | the type function from `Int` to `Int`       |
| `Float -> Int`   | the type function from `Float` to `Int`     |
| `a -> Int`       | the type function from any type to `Int`    |
| `a -> a`         | the type function from any type `a` to the same type `a`  |
| `a -> a -> a`    | the type function of two arguments of any type `a` to the same type `a`  |

In the type `a -> a -> a`, the letter `a` is a _type variable_. 
It means `f` is a function with two arguments and both arguments and the result have the same type.
The type variable `a` could take many different type value.
For example `Int`, `Integer`, `Float`...

So instead of having a forced type like in `C` with declaring the function for `int`, `long`, `float`, `double`, etc... 
We declare only one function like in a dynamically typed language.

Generally `a` can be any type. 
For example a `String`, an `Int`, but also more complex types, like `Trees`, other functions, etc...
But here our type is prefixed with `Num a => `. 

`Num` is a _type class_.
A type class can be understood as a set of types.
`Num` contains only types which behave like numbers.
More precisely, `Num` is class containing types who implement a specific list of functions, and in particular `(+)` and `(*)`.

Type classes are a very powerful language construct.
We can do some incredibly powerful stuff with this.
More on this later.

Finally, `Num a => a -> a -> a` means:

Let `a` be a type belonging to the `Num` type class.
This is a function from type `a` to (`a -> a`).

Yes, strange. 
In fact, in Haskell no function really has two arguments.
Instead all functions have only one argument.
But we will note that taking two arguments is equivalent to taking one argument and returning a function taking the second argument as parameter.

More precisely `f 3 4` is equivalent to `(f 3) 4`. 
Note `f 3` is a function:

~~~
f :: Num a :: a -> a -> a

g :: Num a :: a -> a
g = f 3

g y ⇔ 3*3 + y*y
~~~

Another notation exists for functions. 
The lambda notation allows us to create functions without assigning them a name.
We call them anonymous function.
We could have written:

~~~
g = \y -> 3*3 + y*y
~~~

The `\` is used because it looks like `λ` and is ASCII.

If you are not used to functional programming your brain should start to heat up.
It is time to make a real application.

<a href="code/01_basic/10_Introduction/22_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>22_very_basic.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/23_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>23_very_basic.lhs</strong></a>

But just before that, we should verify the type system works as expected:

<div class="codehighlight">
<code class="haskell">
f :: Num a => a -> a -> a
f x y = x*x + y*y

main = print (f 3 2.4)
</code>
</div>
It works, because, `3` is a valid representation both for Fractional numbers like Float and for Integer.
As `2.4` is a Fractional number, `3` is then interpreted as being also a Fractional number.

<a href="code/01_basic/10_Introduction/23_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>23_very_basic.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/24_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>24_very_basic.lhs</strong></a>

If we force our function to work with different types, it will fail:

<div class="codehighlight">
<code class="haskell">
f :: Num a => a -> a -> a
f x y = x*x + y*y

x :: Int
x = 3
y :: Float
y = 2.4
main = print (f x y) -- won't work because type x ≠ type y
</code>
</div>
The compiler complains. 
The two parameters must have the same type.

If you believe it is a bad idea, and the compiler should make the transformation 
from a type to another for you, you should really watch this great (and funny) video:
[WAT](https://www.destroyallsoftware.com/talks/wat)

<a href="code/01_basic/10_Introduction/24_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>24_very_basic.lhs</strong> </a>

<h2 id="essential-haskell">Essential Haskell</h2>

blogimage("kandinsky_gugg.jpg","Kandinsky Gugg")

I suggest you to skim this part.
Think of it like a reference.
Haskell has a lot of features.
Many informations are missing here.
Get back here if notation feels strange.

I use the `⇔` symbol to state that two expression are equivalent.
It is a meta notation, `⇔` does not exists in Haskell.
I will also use `⇒` to show what is the return of an expression.

<h3 id="notations">Notations</h3>

<h5 id="arithmetic">Arithmetic</h5>

~~~
3 + 2 * 6 / 3 ⇔ 3 + ((2*6)/3)
~~~

<h5 id="logic">Logic</h5>

~~~
True || False ⇒ True
True && False ⇒ False
True == False ⇒ False
True /= False ⇒ True  (/=) is the operator for different
~~~

<h5 id="powers">Powers</h5>

~~~
x^n     for n an integral (understand Int or Integer)
x**y    for y any kind of number (Float for example)
~~~

`Integer` have no limit except the capacity of your machine:

~~~
4^103
102844034832575377634685573909834406561420991602098741459288064
~~~

Yeah!
And also rational numbers FTW!
But you need to import the module `Data.Ratio`:

~~~
$ ghci
....
Prelude> :m Data.Ratio
Data.Ratio> (11 % 15) * (5 % 3)
11 % 9
~~~

<h5 id="lists">Lists</h5>

~~~
[]                      ⇔ empty list
[1,2,3]                 ⇔ List of integral
["foo","bar","baz"]     ⇔ List of String
1:[2,3]                 ⇔ [1,2,3], (:) prepend one element
1:2:[]                  ⇔ [1,2]
[1,2] ++ [3,4]          ⇔ [1,2,3,4], (++) concatenate
[1,2,3] ++ ["foo"]      ⇔ ERROR String ≠ Integral
[1..4]                  ⇔ [1,2,3,4]
[1,3..10]               ⇔ [1,3,5,7,9]
[2,3,5,7,11..100]       ⇔ ERROR! I am not so smart!
[10,9..1]               ⇔ [10,9,8,7,6,5,4,3,2,1]
~~~

<h5 id="strings">Strings</h5>

In Haskell strings are list of `Char`.

~~~
'a' :: Char
"a" :: [Char]
""  ⇔ []
"ab" ⇔ ['a','b'] ⇔  'a':"b" ⇔ 'a':['b'] ⇔ 'a':'b':[]
"abc" ⇔ "ab"++"c"
~~~

 > _Remark_:
 > In real code you shouldn't use list of char to represent text.
 > You should mostly use `Data.Text` instead.
 > If you want to represent stream of ASCII char, you should use `Data.ByteString`.

<h5 id="tuples">Tuples</h5>

The type of couple is `(a,b)`.
Elements in a tuple can have different type.

~~~
-- All these tuple are valid
(2,"foo")
(3,'a',[2,3])
((2,"a"),"c",3)

fst (x,y)       ⇒  x
snd (x,y)       ⇒  y

fst (x,y,z)     ⇒  ERROR: fst :: (a,b) -> a
snd (x,y,z)     ⇒  ERROR: snd :: (a,b) -> b
~~~

<h5 id="deal-with-parentheses">Deal with parentheses</h5>

To remove some parentheses you can use two functions: `($)` and `(.)`.

~~~
-- By default:
f g h x         ⇔  (((f g) h) x)

-- the $ replace parenthesis from the $
-- to the end of the expression
f g $ h x       ⇔  f g (h x) ⇔ (f g) (h x)
f $ g h x       ⇔  f (g h x) ⇔ f ((g h) x)
f $ g $ h x     ⇔  f (g (h x))

-- (.) the composition function
(f . g) x       ⇔  f (g x)
(f . g . h) x   ⇔  f (g (h x))
~~~

<hr/><a href="code/01_basic/20_Essential_Haskell/10a_Functions.lhs" class="cut">01_basic/20_Essential_Haskell/<strong>10a_Functions.lhs</strong></a>

<h3 id="useful-notations-for-functions">Useful notations for functions</h3>

Just a reminder:

~~~
x :: Int            ⇔ x is of type Int
x :: a              ⇔ x can be of any type
x :: Num a => a     ⇔ x can be any type a
                      such that a belongs to Num type class 
f :: a -> b         ⇔ f is a function from a to b
f :: a -> b -> c    ⇔ f is a function from a to (b→c)
f :: (a -> b) -> c  ⇔ f is a function from (a→b) to c
~~~

Defining the type of a function before its declaration isn't mandatory.
Haskell infers the most general type for you.
But it is considered a good practice to do so.

_Infix notation_

<div class="codehighlight">
<code class="haskell">
square :: Num a => a -> a  
square x = x^2
</code>
</div>
Note `^` use infix notation. 
For each infix operator there its associated prefix notation.
You just have to put it inside parenthesis.

<div class="codehighlight">
<code class="haskell">
square' x = (^) x 2

square'' x = (^2) x
</code>
</div>
We can remove `x` in the left and right side!
It's called η-reduction.

<div class="codehighlight">
<code class="haskell">
square''' = (^2)
</code>
</div>
Note we can declare function with `'` in their name.
Here:

 > `square` ⇔  `square'` ⇔ `square''` ⇔ `square '''`

_Tests_

An implementation of the absolute function.

<div class="codehighlight">
<code class="haskell">
absolute :: (Ord a, Num a) => a -> a
absolute x = if x >= 0 then x else -x
</code>
</div>
Note: the `if .. then .. else` Haskell notation is more like the
`¤?¤:¤` C operator. You cannot forget the `else`.

Another equivalent version:

<div class="codehighlight">
<code class="haskell">
absolute' x
    | x >= 0 = x
    | otherwise = -x
</code>
</div>
 > Notation warning: indentation is _important_ in Haskell.
 > Like in Python, a bad indentation could break your code!

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = do
      print $ square 10
      print $ square' 10
      print $ square'' 10
      print $ square''' 10
      print $ absolute 10
      print $ absolute (-10)
      print $ absolute' 10
      print $ absolute' (-10)
</code>
</div>
</div>

<a href="code/01_basic/20_Essential_Haskell/10a_Functions.lhs" class="cut">01_basic/20_Essential_Haskell/<strong>10a_Functions.lhs</strong> </a>

<h2 id="hard-part">Hard Part</h2>

The hard part can now begin.

<h3 id="functional-style">Functional style</h3>

blogimage("hr_giger_biomechanicallandscape_500.jpg","Biomechanical Landscape by H.R. Giger")

In this section, I will give a short example of the impressive refactoring ability provided by Haskell.
We will select a problem and solve it using a standard imperative way.
Then I will make the code evolve.
The end result will be both more elegant and easier to adapt.

Let's solve the following problem:

 > Given a list of integers, return the sum of the even numbers in the list.
 >
 > example:
 > `[1,2,3,4,5] ⇒  2 + 4 ⇒  6`

To show differences between the functional and imperative approach,
I'll start by providing an imperative solution (in Javascript):

<code class="javascript">
function evenSum(list) {
    var result = 0;
    for (var i=0; i< list.length ; i++) {
        if (list[i] % 2 ==0) {
            result += list[i];
        }
    }
    return result;
}
</code>

But, in Haskell we don't have variables, nor for loop.
One solution to achieve the same result without loops is to use recursion.

 > _Remark_:
 > Recursion is generally perceived as slow in imperative languages.
 > But it is generally not the case in functional programming.
 > Most of the time Haskell will handle recursive functions efficiently.

Here is a `C` version of the recursive function.
Note that for simplicity, I assume the int list ends with the first `0` value.

<code class="c">
int evenSum(int *list) {
    return accumSum(0,list);
}

int accumSum(int n, int *list) {
    int x;
    int *xs;
    if (*list == 0) { // if the list is empty
        return n;
    } else {
        x = list[0]; // let x be the first element of the list
        xs = list+1; // let xs be the list without x
        if ( 0 == (x%2) ) { // if x is even
            return accumSum(n+x, xs);
        } else {
            return accumSum(n, xs);
        }
    }
}
</code>

Keep this code in mind. We will translate it into Haskell.
But before, I need to introduce three simple but useful functions we will use:

<code class="haskell">
even :: Integral a => a -> Bool
head :: [a] -> a
tail :: [a] -> [a]
</code>

`even` verifies if a number is even.

<code class="haskell">
even :: Integral a => a -> Bool
even 3  ⇒ False
even 2  ⇒ True
</code>

`head` returns the first element of a list:

<code class="haskell">
head :: [a] -> a
head [1,2,3] ⇒ 1
head []      ⇒ ERROR
</code>

`tail` returns all elements of a list, except the first:

<code class="haskell">
tail :: [a] -> [a]
tail [1,2,3] ⇒ [2,3]
tail [3]     ⇒ []
tail []      ⇒ ERROR
</code>

Note that for any non empty list `l`,
`l ⇔ (head l):(tail l)`

<hr/><a href="code/02_Hard_Part/11_Functions.lhs" class="cut">02_Hard_Part/<strong>11_Functions.lhs</strong></a>

The first Haskell solution.
The function `evenSum` returns the sum of all even numbers in a list:

<div class="codehighlight">
<code class="haskell">
-- Version 1
evenSum :: [Integer] -> Integer

evenSum l = accumSum 0 l

accumSum n l = if l == []
                  then n
                  else let x = head l 
                           xs = tail l 
                       in if even x
                              then accumSum (n+x) xs
                              else accumSum n xs
</code>
</div>
To test a function you can use `ghci`:

<pre>
% ghci
<span class="low">GHCi, version 7.0.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude&gt;</span> :load 11_Functions.lhs 
<span class="low">[1 of 1] Compiling Main             ( 11_Functions.lhs, interpreted )
Ok, modules loaded: Main.
*Main&gt;</span> evenSum [1..5]
6
</pre>

Here is an example of execution[^2]: 

[^2]: I know I'm cheating. But I will talk about non-strict later.

<pre>
*Main> evenSum [1..5]
accumSum 0 [1,2,3,4,5]
<span class="yellow">1 is odd</span>
accumSum 0 [2,3,4,5]
<span class="yellow">2 is even</span>
accumSum (0+2) [3,4,5]
<span class="yellow">3 is odd</span>
accumSum (0+2) [4,5]
<span class="yellow">4 is even</span>
accumSum (0+2+4) [5]
<span class="yellow">5 is odd</span>
accumSum (0+2+4) []
<span class="yellow">l == []</span>
0+2+4
0+6
6
</pre>

Coming from an imperative language all should seem right.
In reality many things can be improved.
First, we can generalize the type.

<code class="haskell">
evenSum :: Integral a => [a] -> a
</code>

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = do print $ evenSum [1..10]
</code>
</div>
</div>

<a href="code/02_Hard_Part/11_Functions.lhs" class="cut">02_Hard_Part/<strong>11_Functions.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/12_Functions.lhs" class="cut">02_Hard_Part/<strong>12_Functions.lhs</strong></a>

Next, we can use sub functions using `where` or `let`.
This way our `accumSum` function won't pollute the global namespace.

<div class="codehighlight">
<code class="haskell">
-- Version 2
evenSum :: Integral a => [a] -> a

evenSum l = accumSum 0 l
    where accumSum n l = 
            if l == []
                then n
                else let x = head l 
                         xs = tail l 
                     in if even x
                            then accumSum (n+x) xs
                            else accumSum n xs
</code>
</div>
<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = print $ evenSum [1..10]
</code>
</div>
</div>

<a href="code/02_Hard_Part/12_Functions.lhs" class="cut">02_Hard_Part/<strong>12_Functions.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/13_Functions.lhs" class="cut">02_Hard_Part/<strong>13_Functions.lhs</strong></a>

Next, we can use pattern matching.

<div class="codehighlight">
<code class="haskell">
-- Version 3
evenSum l = accumSum 0 l
    where 
        accumSum n [] = n
        accumSum n (x:xs) = 
             if even x
                then accumSum (n+x) xs
                else accumSum n xs
</code>
</div>
What is pattern matching? 
Use values instead of general parameter names[^021301].

[^021301]: For the brave, a more complete explanation of pattern matching can be found [here](http://www.cs.auckland.ac.nz/references/haskell/haskell-intro-html/patterns.html).

Instead of saying: `foo l = if l == [] then <x> else <y>`
You simply state:  

<code class="haskell">
foo [] =  <x>
foo l  =  <y>
</code>

But pattern matching goes even further.
It is also able to inspect the inner data of a complex value.
We can replace

<code class="haskell">
foo l =  let x  = head l 
             xs = tail l
         in if even x 
             then foo (n+x) xs
             else foo n xs
</code>

with

<code class="haskell">
foo (x:xs) = if even x 
                 then foo (n+x) xs
                 else foo n xs
</code>

This is a very useful feature.
It makes our code both terser and easier to read.

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = print $ evenSum [1..10]
</code>
</div>
</div>

<a href="code/02_Hard_Part/13_Functions.lhs" class="cut">02_Hard_Part/<strong>13_Functions.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/14_Functions.lhs" class="cut">02_Hard_Part/<strong>14_Functions.lhs</strong></a>

In Haskell you can simplify function definition by η-reducing them.
For example, instead of writing:

<code class="haskell">
f x = (some expresion) x
</code>

you can simply write

<code class="haskell">
f = some expression
</code>

We use this method to remove the `l`:

<div class="codehighlight">
<code class="haskell">
-- Version 4
evenSum :: Integral a => [a] -> a

evenSum = accumSum 0
    where 
        accumSum n [] = n
        accumSum n (x:xs) = 
             if even x
                then accumSum (n+x) xs
                else accumSum n xs
</code>
</div>
<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = print $ evenSum [1..10]
</code>
</div>
</div>

<a href="code/02_Hard_Part/14_Functions.lhs" class="cut">02_Hard_Part/<strong>14_Functions.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/15_Functions.lhs" class="cut">02_Hard_Part/<strong>15_Functions.lhs</strong></a>

<h4 id="higher-order-functions">Higher Order Functions</h4>

blogimage("escher_polygon.png","Escher")

To make things even better we should use higher order functions.
What are these beasts?
Higher order functions are functions taking functions as parameter.

Here are some examples:

<code class="haskell">
filter :: (a -> Bool) -> [a] -> [a]
map :: (a -> b) -> [a] -> [b]
foldl :: (a -> b -> a) -> a -> [b] -> a
</code>

Let's proceed by small steps.

<code class="haskell">
-- Version 5
evenSum l = mysum 0 (filter even l)
    where
      mysum n [] = n
      mysum n (x:xs) = mysum (n+x) xs
</code>

where

<code class="haskell">
filter even [1..10] ⇔  [2,4,6,8,10]
</code>

The function `filter` takes a function of type (`a -> Bool`) and a list of type `[a]`. It returns a list containing only elements for which the function returned `true`.

Our next step is to use another way to simulate a loop.
We will use the `foldl` function to accumulate a value.
The function `foldl` captures a general coding pattern:

<pre>
myfunc list = foo <span class="blue">initialValue</span> <span class="green">list</span>
    foo accumulated []     = accumulated
    foo tmpValue    (x:xs) = foo (<span class="yellow">bar</span> tmpValue x) xs
</pre>

Which can be replaced by:

<pre>
myfunc list = foldl <span class="yellow">bar</span> <span class="blue">initialValue</span> <span class="green">list</span>
</pre>

If you really want to know how the magic works.
Here is the definition of `foldl`.

<code class="haskell">
foldl f z [] = z
foldl f z (x:xs) = foldl f (f z x) xs
</code>

<code class="haskell">
foldl f z [x1,...xn]
⇔  f (... (f (f z x1) x2) ...) xn
</code>

But as Haskell is lazy, it doesn't evaluate `(f z x)` and pushes it to the stack.
This is why we generally use `foldl'` instead of `foldl`;
`foldl'` is a _strict_ version of `foldl`.
If you don't understand what lazy and strict means,
don't worry, just follow the code as if `foldl` and `foldl'` where identical.

Now our new version of `evenSum` becomes:

<code class="haskell">
-- Version 6
-- foldl' isn't accessible by default
-- we need to import it from the module Data.List
import Data.List
evenSum l = foldl' mysum 0 (filter even l)
  where mysum acc value = acc + value
</code>

Version we can simplify by using directly a lambda notation.
This way we don't have to create the temporary name `mysum`.

<div class="codehighlight">
<code class="haskell">
-- Version 7
-- Generally it is considered a good practice
-- to import only the necessary function(s)
import Data.List (foldl')
evenSum l = foldl' (\x y -> x+y) 0 (filter even l)
</code>
</div>
And of course, we note that

<code class="haskell">
(\x y -> x+y) ⇔ (+)
</code>

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = print $ evenSum [1..10]
</code>
</div>
</div>

<a href="code/02_Hard_Part/15_Functions.lhs" class="cut">02_Hard_Part/<strong>15_Functions.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/16_Functions.lhs" class="cut">02_Hard_Part/<strong>16_Functions.lhs</strong></a>

Finally

<code class="haskell">
-- Version 8
import Data.List (foldl')
evenSum :: Integral a => [a] -> a
evenSum l = foldl' (+) 0 (filter even l)
</code>

`foldl'` isn't the easiest function to intuit.
If you are not used to it, you should study it a bit.

To help you understand what's going on here, a step by step evaluation:

<pre>
  <span class="yellow">evenSum [1,2,3,4]</span>
⇒ foldl' (+) 0 (<span class="yellow">filter even [1,2,3,4]</span>)
⇒ <span class="yellow">foldl' (+) 0 <span class="blue">[2,4]</span></span>
⇒ <span class="blue">foldl' (+) (<span class="yellow">0+2</span>) [4]</span> 
⇒ <span class="yellow">foldl' (+) <span class="blue">2</span> [4]</span>
⇒ <span class="blue">foldl' (+) (<span class="yellow">2+4</span>) []</span>
⇒ <span class="yellow">foldl' (+) <span class="blue">6</span> []</span>
⇒ <span class="blue">6</span>
</pre>

Another useful higher order function is `(.)`.
The `(.)` function corresponds to the mathematical composition.

<code class="haskell">
(f . g . h) x ⇔  f ( g (h x))
</code>

We can take advantage of this operator to η-reduce our function:

<code class="haskell">
-- Version 9
import Data.List (foldl')
evenSum :: Integral a => [a] -> a
evenSum = (foldl' (+) 0) . (filter even)
</code>

Also, we could rename some parts to make it clearer:

<div class="codehighlight">
<code class="haskell">
-- Version 10 
import Data.List (foldl')
sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0
evenSum :: Integral a => [a] -> a
evenSum = sum' . (filter even)
 
</code>
</div>
It is time to discuss a bit.
What did we gain by using higher order functions?

At first, you can say it is terseness.
But in fact, it has more to do with better thinking.
Suppose we want to modify slightly our function.
We want to get the sum of all even square of element of the list.

~~~
[1,2,3,4] ▷ [1,4,9,16] ▷ [4,16] ▷ 20
~~~

Update the version 10 is extremely easy:

<div class="codehighlight">
<code class="haskell">
squareEvenSum = sum' . (filter even) . (map (^2))
squareEvenSum' = evenSum . (map (^2))
squareEvenSum'' = sum' . (map (^2)) . (filter even)
</code>
</div>
We just had to add another "transformation function"[^0216].

[^0216]: You should remark `squareEvenSum''` is more efficient that the two other versions. The order of `(.)` is important.

~~~
map (^2) [1,2,3,4] ⇔ [1,4,9,16]
~~~

The `map` function simply apply a function to all element of a list.

We didn't had to modify anything _inside_ the function definition.
It feels more modular.
But in addition you can think more mathematically about your function.
You can then use your function as any other one.
You can compose, map, fold, filter using your new function.

To modify version 1 is left as an exercise to the reader ☺.

If you believe we reached the end of generalization, then know you are very wrong.
For example, there is a way to not only use this function on lists but on any recursive type.
If you want to know how, I suggest you to read this quite fun article: [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire by Meijer, Fokkinga and Paterson](http://eprints.eemcs.utwente.nl/7281/0
1/db-utwente-40501F46.pdf).

This example should show you how great pure functional programming is.
Unfortunately, using pure functional programming isn't well suited to all usages.
Or at least such a language hasn't been found yet.

One of the great powers of Haskell is the ability to create DSLs
(Domain Specific Language)
making it easy to change the programming paradigm.

In fact, Haskell is also great when you want to write imperative style programming.
Understanding this was really hard for me when learning Haskell.
A lot of effort has been done to explain to you how much functional approach is superior.
Then when you start the imperative style of Haskell, it is hard to understand why and how.

But before talking about this Haskell super-power, we must talk about another
essential aspect of Haskell: _Types_.

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = print $ evenSum [1..10]
</code>
</div>
</div>

<a href="code/02_Hard_Part/16_Functions.lhs" class="cut">02_Hard_Part/<strong>16_Functions.lhs</strong> </a>

<h3 id="types">Types</h3>

blogimage("salvador-dali-the-madonna-of-port-lligat.jpg","Dali, the madonna of port Lligat")

 > %tldr
 >
 > - `type Name = AnotherType` is just an alias and the compiler doesn't do any difference between `Name` and `AnotherType`.
 > - `data Name = NameConstructor AnotherType` make a difference.
 > - `data` can construct structures which can be recursives.
 > - `deriving` is magic and create functions for you.

In Haskell, types are strong and static.

Why is this important? It will help you _greatly_ to avoid mistakes.
In Haskell, most bugs are caught during the compilation of your program.
And the main reason is because of the type inference during compilation.
It will be easy to detect where you used the wrong parameter at the wrong place for example.

<h4 id="type-inference">Type inference</h4>

Static typing is generally essential to reach fast execution time.
But most statically typed languages are bad at generalizing concepts.
Haskell's saving grace is that it can _infer_ types.

Here is a simple example.
The `square` function in Haskell:

<code class="haskell">
square x = x * x
</code>

This function can `square` any Numeral type.
You can provide `square` with an `Int`, an `Integer`, a `Float` a `Fractional` and even `Complex`. Proof by example:

~~~
% ghci
GHCi, version 7.0.4:
...
Prelude> let square x = x*x
Prelude> square 2
4
Prelude> square 2.1
4.41
Prelude> -- load the Data.Complex module
Prelude> :m Data.Complex
Prelude Data.Complex> square (2 :+ 1)
3.0 :+ 4.0
~~~

`x :+ y` is the notation for the complex (<i>x + ib</i>).

Now compare with the amount of code necessary in C:

<code class="c">
int     int_square(int x) { return x*x; }

float   float_square(float x) {return x*x; }

complex complex_square (complex z) {
    complex tmp;
    tmp.real = z.real * z.real - z.img * z.img;
    tmp.img = 2 * z.img * z.real;
}

complex x,y;
y = complex_square(x);
</code>

For each type, you need to write a new function.
The only way to work around this problem is to use some meta-programming trick.
For example using the pre-processor.
In C++ there is a better way, the C++ templates:

<code class="c++">
#include <iostream>
#include <complex>
using namespace std;

template<typename T>
T square(T x)
{
    return x*x;
}

int main() {
    // int
    int sqr_of_five = square(5);
    cout << sqr_of_five << endl;
    // double
    cout << (double)square(5.3) << endl;
    // complex
    cout << square( complex<double>(5,3) )
         << endl;
    return 0;
}
</code>

C++ does a far better job than C.
For more complex function the syntax can be hard to follow:
look at
[this article](http://bartoszmilewski.com/2009/10/21/what-does-haskell-have-to-do-with-c/)
for example.

In C++ you must declare that a function can work with different types.
In Haskell this is the opposite.
The function will be as general as possible by default.

Type inference gives Haskell the feeling of freedom that dynamically
typed languages provide.
But unlike dynamically typed languages, most errors are caught before the execution.
Generally, in Haskell:

 > "if it compiles it certainly does what you intended"

<hr/><a href="code/02_Hard_Part/21_Types.lhs" class="cut">02_Hard_Part/<strong>21_Types.lhs</strong></a>

<h4 id="type-construction">Type construction</h4>

You can construct your own types.
First you can use aliases or type synonyms.

<div class="codehighlight">
<code class="haskell">
type Name   = String
type Color  = String

showInfos :: Name ->  Color -> String
showInfos name color =  "Name: " ++ name
                        ++ ", Color: " ++ color
name :: Name
name = "Robin"
color :: Color
color = "Blue"
main = putStrLn $ showInfos name color
</code>
</div>
<a href="code/02_Hard_Part/21_Types.lhs" class="cut">02_Hard_Part/<strong>21_Types.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/22_Types.lhs" class="cut">02_Hard_Part/<strong>22_Types.lhs</strong></a>

But it doesn't protect you much.
Try to swap the two parameter of `showInfos` and run the program:

<code class="haskell">
    putStrLn $ showInfos color name
</code>

It will compile and execute.
In fact you can replace Name, Color and String everywhere.
The compiler will treat them as completely identical.

Another method is to create your own types using the keyword `data`.

<div class="codehighlight">
<code class="haskell">
data Name   = NameConstr String
data Color  = ColorConstr String

showInfos :: Name ->  Color -> String
showInfos (NameConstr name) (ColorConstr color) =
      "Name: " ++ name ++ ", Color: " ++ color

name  = NameConstr "Robin"
color = ColorConstr "Blue"
main = putStrLn $ showInfos name color
</code>
</div>
Now if you switch parameters of `showInfos`, the compiler complains!
A possible mistake you could never do again.
The only price is to be more verbose. 

Also remark constructor are functions:

<code class="haskell">
NameConstr  :: String -> Name
ColorConstr :: String -> Color
</code>

The syntax of `data` is mainly:

<code class="haskell">
data TypeName =   ConstructorName  [types]
                | ConstructorName2 [types]
                | ...
</code>

Generally the usage is to use the same name for the
DataTypeName and DataTypeConstructor.

Example:

<code class="haskell">
data Complex = Num a => Complex a a
</code>

Also you can use the record syntax:

<code class="haskell">
data DataTypeName = DataConstructor {
                      field1 :: [type of field1]
                    , field2 :: [type of field2]
                    ...
                    , fieldn :: [type of fieldn] }
</code>

And many accessors are made for you.
Furthermore you can use another order when setting values.

Example:

<code class="haskell">
data Complex = Num a => Complex { real :: a, img :: a}
c = Complex 1.0 2.0
z = Complex { real = 3, img = 4 }
real c ⇒ 1.0
img z ⇒ 4
</code>

<a href="code/02_Hard_Part/22_Types.lhs" class="cut">02_Hard_Part/<strong>22_Types.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/23_Types.lhs" class="cut">02_Hard_Part/<strong>23_Types.lhs</strong></a>

<h4 id="recursive-type">Recursive type</h4>

You already encountered a recursive type: lists.
You can re-create lists, but with a more verbose syntax:

<code class="haskell">
data List a = Empty | Cons a (List a)
</code>

If you really want to use an easier syntax you can use an infix name for constructors.

<code class="haskell">
infixr 5 :::
data List a = Nil | a ::: (List a)
</code>

The number after `infixr` is the priority.

If you want to be able to print (`Show`), read (`Read`), test equality (`Eq`) and compare (`Ord`) your new data structure you can tell Haskell to derive the appropriate functions for you.

<div class="codehighlight">
<code class="haskell">
infixr 5 :::
data List a = Nil | a ::: (List a) 
              deriving (Show,Read,Eq,Ord)
</code>
</div>
When you add `deriving (Show)` to your data declaration, Haskell create a `show` function for you.
We'll see soon how you can use your own `show` function.

<div class="codehighlight">
<code class="haskell">
convertList [] = Nil
convertList (x:xs) = x ::: convertList xs
</code>
</div>
<div class="codehighlight">
<code class="haskell">
main = do
      print (0 ::: 1 ::: Nil)
      print (convertList [0,1])
</code>
</div>
This prints:

~~~
0 ::: (1 ::: Nil)
0 ::: (1 ::: Nil)
~~~

<a href="code/02_Hard_Part/23_Types.lhs" class="cut">02_Hard_Part/<strong>23_Types.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/30_Trees.lhs" class="cut">02_Hard_Part/<strong>30_Trees.lhs</strong></a>

<h4 id="trees">Trees</h4>

blogimage("magritte-l-arbre.jpg","Magritte, l'Arbre")

We'll just give another standard example: binary trees.

<div class="codehighlight">
<code class="haskell">
import Data.List

data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                              deriving (Show)
</code>
</div>
We will also create a function which turns a list into an ordered binary tree.

<div class="codehighlight">
<code class="haskell">
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))
</code>
</div>
Look at how elegant this function is.
In plain English:

- an empty list will be converted to an empty tree.
- a list `(x:xs)` will be converted to a tree where:
  - The root is `x`
  - Its left subtree is the tree created from members of the list `xs` which are strictly inferior to `x` and
  - the right subtree is the tree created from members of the list `xs` which are strictly superior to `x`.

<div class="codehighlight">
<code class="haskell">
main = print $ treeFromList [7,2,4,8]
</code>
</div>
You should obtain the following:

~~~
Node 7 (Node 2 Empty (Node 4 Empty Empty)) (Node 8 Empty Empty)
~~~

This is an informative but quite unpleasant representation of our tree.

<a href="code/02_Hard_Part/30_Trees.lhs" class="cut">02_Hard_Part/<strong>30_Trees.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/31_Trees.lhs" class="cut">02_Hard_Part/<strong>31_Trees.lhs</strong></a>

Just for fun, let's code a better display for our trees.
I simply had fun making a nice function to display trees in a general way.
You can safely skip this part if you find it too difficult to follow.

We have a few changes to make.
We remove the `deriving (Show)` from the declaration of our `BinTree` type.
And it might also be useful to make our BinTree an instance of (`Eq` and `Ord`).
We will be able to test equality and compare trees.

<div class="codehighlight">
<code class="haskell">
data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                  deriving (Eq,Ord)
</code>
</div>
Without the `deriving (Show)`, Haskell doesn't create a `show` method for us.
We will create our own version of `show`.
To achieve this, we must declare that our newly created type `BinTree a`
is an instance of the type class `Show`.
The general syntax is:

<code class="haskell">
instance Show (BinTree a) where
   show t = ... -- You declare your function here
</code>

Here is my version of how to show a binary tree.
Don't worry about the apparent complexity.
I made a lot of improvements in order to display even stranger objects.

<div class="codehighlight">
<code class="haskell">
-- declare BinTree a to be an instance of Show
instance (Show a) => Show (BinTree a) where
  -- will start by a '<' before the root
  -- and put a : a begining of line
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    -- treeshow pref Tree
    --   shows a tree and starts each line with pref
    -- We don't display the Empty tree
    treeshow pref Empty = ""
    -- Leaf
    treeshow pref (Node x Empty Empty) =
                  (pshow pref x)

    -- Right branch is empty
    treeshow pref (Node x left Empty) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    -- Left branch is empty
    treeshow pref (Node x Empty right) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- Tree with left and right children non empty
    treeshow pref (Node x left right) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- shows a tree using some prefixes to make it nice
    showSon pref before next t =
                  pref ++ before ++ treeshow (pref ++ next) t

    -- pshow replaces "\n" by "\n"++pref
    pshow pref x = replace '\n' ("\n"++pref) (show x)

    -- replaces one char by another string
    replace c new string =
      concatMap (change c new) string
      where
          change c new x
              | x == c = new
              | otherwise = x:[] -- "x"
</code>
</div>
The `treeFromList` method remains identical.

<div class="codehighlight">
<code class="haskell">
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))
</code>
</div>
And now, we can play:

<div class="codehighlight">
<code class="haskell">
main = do
  putStrLn "Int binary tree:"
  print $ treeFromList [7,2,4,8,1,3,6,21,12,23]
</code>
</div>
~~~
Int binary tree:
< 7
: |--2
: |  |--1
: |  `--4
: |     |--3
: |     `--6
: `--8
:    `--21
:       |--12
:       `--23
~~~

Now it is far better!
The root is shown by starting the line with the `<` character.
And each following line starts with a `:`.
But we could also use another type.

<div class="codehighlight">
<code class="haskell">
  putStrLn "\nString binary tree:"
  print $ treeFromList ["foo","bar","baz","gor","yog"]
</code>
</div>
~~~
String binary tree:
< "foo"
: |--"bar"
: |  `--"baz"
: `--"gor"
:    `--"yog"
~~~

As we can test equality and order trees, we can
make tree of trees!

<div class="codehighlight">
<code class="haskell">
  putStrLn "\nBinary tree of Char binary trees:"
  print ( treeFromList
           (map treeFromList ["baz","zara","bar"]))
</code>
</div>
~~~
Binary tree of Char binary trees:
< < 'b'
: : |--'a'
: : `--'z'
: |--< 'b'
: |  : |--'a'
: |  : `--'r'
: `--< 'z'
:    : `--'a'
:    :    `--'r'
~~~

This is why I chose to prefix each line of tree display by `:` (except for the root).

blogimage("yo_dawg_tree.jpg","Yo Dawg Tree")

<div class="codehighlight">
<code class="haskell">
  putStrLn "\nTree of Binary trees of Char binary trees:"
  print $ (treeFromList . map (treeFromList . map treeFromList))
             [ ["YO","DAWG"]
             , ["I","HEARD"]
             , ["I","HEARD"]
             , ["YOU","LIKE","TREES"] ]
</code>
</div>
Which is equivalent to

<code class="haskell">
print ( treeFromList (
          map treeFromList
             [ map treeFromList ["YO","DAWG"]
             , map treeFromList ["I","HEARD"]
             , map treeFromList ["I","HEARD"]
             , map treeFromList ["YOU","LIKE","TREES"] ]))
</code>

and gives:

~~~
Binary tree of Binary trees of Char binary trees:
< < < 'Y'
: : : `--'O'
: : `--< 'D'
: :    : |--'A'
: :    : `--'W'
: :    :    `--'G'
: |--< < 'I'
: |  : `--< 'H'
: |  :    : |--'E'
: |  :    : |  `--'A'
: |  :    : |     `--'D'
: |  :    : `--'R'
: `--< < 'Y'
:    : : `--'O'
:    : :    `--'U'
:    : `--< 'L'
:    :    : `--'I'
:    :    :    |--'E'
:    :    :    `--'K'
:    :    `--< 'T'
:    :       : `--'R'
:    :       :    |--'E'
:    :       :    `--'S'
~~~

Notice how duplicate trees aren't inserted;
there is only one tree corresponding to `"I","HEARD"`.
We have this for (almost) free, because we have declared Tree to be an instance of `Eq`.

See how awesome this structure is.
We can make trees containing not only integers, strings and chars, but also other trees.
And we can even make a tree containing a tree of trees!

<a href="code/02_Hard_Part/31_Trees.lhs" class="cut">02_Hard_Part/<strong>31_Trees.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/40_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>40_Infinites_Structures.lhs</strong></a>

<h3 id="infinite-structures">Infinite Structures</h3>

blogimage("escher_infinite_lizards.jpg","Escher")

It is often stated that Haskell is _lazy_.

In fact, if you are a bit pedantic, you should state that [Haskell is _non-strict_](http://www.haskell.org/haskellwiki/Lazy_vs._non-strict).
Laziness is just a common implementation for non-strict languages.

Then what does not-strict means? From the Haskell wiki:

 > Reduction (the mathematical term for evaluation) proceeds from the outside in.
 >
 > so if you have `(a+(b*c))` then you first reduce `+` first, then you reduce the inner `(b*c)`

For example in Haskell you can do:

<div class="codehighlight">
<code class="haskell">
-- numbers = [1,2,..]
numbers :: [Integer]
numbers = 0:map (1+) numbers

take' n [] = []
take' 0 l = []
take' n (x:xs) = x:take' (n-1) xs

main = print $ take' 10 numbers
</code>
</div>
And it stops.

How?

Instead of trying to evaluate `numbers` entirely,
it evaluates elements only when needed.

Also, note in Haskell there is a notation for infinite lists

~~~
[1..]   ⇔ [1,2,3,4...]
[1,3..] ⇔ [1,3,5,7,9,11...]
~~~

And most functions will work with them.
Also, there is a built-in function `take` which is equivalent to our `take'`.

<a href="code/02_Hard_Part/40_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>40_Infinites_Structures.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/41_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>41_Infinites_Structures.lhs</strong></a>

<div style="display:none">

This code is mostly the same as the previous one.

<div class="codehighlight">
<code class="haskell">
import Debug.Trace (trace)
import Data.List
data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                  deriving (Eq,Ord)
</code>
</div>
<div class="codehighlight">
<code class="haskell">
-- declare BinTree a to be an instance of Show
instance (Show a) => Show (BinTree a) where
  -- will start by a '<' before the root
  -- and put a : a begining of line
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    treeshow pref Empty = ""
    treeshow pref (Node x Empty Empty) = 
                  (pshow pref x)

    treeshow pref (Node x left Empty) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    treeshow pref (Node x Empty right) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    treeshow pref (Node x left right) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- show a tree using some prefixes to make it nice
    showSon pref before next t = 
                  pref ++ before ++ treeshow (pref ++ next) t

    -- pshow replace "\n" by "\n"++pref
    pshow pref x = replace '\n' ("\n"++pref) (" " ++ show x)

    -- replace on char by another string
    replace c new string =
      concatMap (change c new) string
      where
          change c new x 
              | x == c = new
              | otherwise = x:[] -- "x"

</code>
</div>
</div>

Suppose we don't mind having an ordered binary tree.
Here is an infinite binary tree:

<div class="codehighlight">
<code class="haskell">
nullTree = Node 0 nullTree nullTree
</code>
</div>
A complete binary tree where each node is equal to 0.
Now I will prove you can manipulate this object using the following function:

<div class="codehighlight">
<code class="haskell">
-- take all element of a BinTree 
-- up to some depth
treeTakeDepth _ Empty = Empty
treeTakeDepth 0 _     = Empty
treeTakeDepth n (Node x left right) = let
          nl = treeTakeDepth (n-1) left
          nr = treeTakeDepth (n-1) right
          in
              Node x nl nr
</code>
</div>
See what occurs for this program:

<code class="haskell">
main = print $ treeTakeDepth 4 nullTree
</code>

This code compiles, runs and stops giving the following result:

~~~
<  0
: |-- 0
: |  |-- 0
: |  |  |-- 0
: |  |  `-- 0
: |  `-- 0
: |     |-- 0
: |     `-- 0
: `-- 0
:    |-- 0
:    |  |-- 0
:    |  `-- 0
:    `-- 0
:       |-- 0
:       `-- 0
~~~

Just to heat up your neurones a bit more,
let's make a slightly more interesting tree:

<div class="codehighlight">
<code class="haskell">
iTree = Node 0 (dec iTree) (inc iTree)
        where
           dec (Node x l r) = Node (x-1) (dec l) (dec r) 
           inc (Node x l r) = Node (x+1) (inc l) (inc r) 
</code>
</div>
Another way to create this tree is to use a higher order function.
This function should be similar to `map`, but should work on `BinTree` instead of list.
Here is such a function:

<div class="codehighlight">
<code class="haskell">
-- apply a function to each node of Tree
treeMap :: (a -> b) -> BinTree a -> BinTree b
treeMap f Empty = Empty
treeMap f (Node x left right) = Node (f x) 
                                     (treeMap f left) 
                                     (treeMap f right)
</code>
</div>
_Hint_: I won't talk more about this here. 
If you are interested by the generalization of `map` to other data structures,
search for functor and `fmap`.

Our definition is now:

<div class="codehighlight">
<code class="haskell">
infTreeTwo :: BinTree Int
infTreeTwo = Node 0 (treeMap (\x -> x-1) infTreeTwo) 
                    (treeMap (\x -> x+1) infTreeTwo) 
</code>
</div>
Look at the result for 

<code class="haskell">
main = print $ treeTakeDepth 4 infTreeTwo
</code>

~~~
<  0
: |-- -1
: |  |-- -2
: |  |  |-- -3
: |  |  `-- -1
: |  `-- 0
: |     |-- -1
: |     `-- 1
: `-- 1
:    |-- 0
:    |  |-- -1
:    |  `-- 1
:    `-- 2
:       |-- 1
:       `-- 3
~~~

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
main = do
  print $ treeTakeDepth 4 nullTree
  print $ treeTakeDepth 4 infTreeTwo
</code>
</div>
</div>

<a href="code/02_Hard_Part/41_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>41_Infinites_Structures.lhs</strong> </a>

<h2 id="hell-difficulty-part">Hell Difficulty Part</h2>

Congratulations for getting so far!
Now, some of the really hardcore stuff can start.

If you are like me, you should get the functional style.
You should also understand a bit more the advantages of laziness by default.
But you also don't really understand where to start in order to make a real
program.
And in particular:

- How do you deal with effects?
- Why is there a strange imperative-like notation for dealing with IO?

Be prepared, the answers might be complex.
But they all be very rewarding.

<hr/><a href="code/03_Hell/01_IO/01_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>01_progressive_io_example.lhs</strong></a>

<h3 id="deal-with-io">Deal With IO</h3>

blogimage("magritte_carte_blanche.jpg","Magritte, Carte blanche")

 > %tldr
 >
 > A typical function doing `IO` looks a lot like an imperative program:
 >
 > ~~~
 > f :: IO a
 > f = do
 >   x <- action1
 >   action2 x
 >   y <- action3
 >   action4 x y
 > ~~~
 >
 > - To set a value to an object we use `<-` .
 > - The type of each line is `IO *`;
 >   in this example:
 >   - `action1     :: IO b`
 >   - `action2 x   :: IO ()`
 >   - `action3     :: IO c`
 >   - `action4 x y :: IO a`
 >   - `x :: b`, `y :: c`
 > - Few objects have the type `IO a`, this should help you choose.
 >   In particular you cannot use pure functions directly here.
 >   To use pure functions you could do `action2 (purefunction x)` for example.

In this section, I will explain how to use IO, not how it works.
You'll see how Haskell separates the pure from the impure parts of the program.

Don't stop because you're trying to understand the details of the syntax.
Answers will come in the next section.

What to achieve?

 > Ask a user to enter a list of numbers.
 > Print the sum of the numbers

<div class="codehighlight">
<code class="haskell">
toList :: String -> [Integer]
toList input = read ("[" ++ input ++ "]")

main = do
  putStrLn "Enter a list of numbers (separated by comma):"
  input <- getLine
  print $ sum (toList input)
</code>
</div>
It should be straightforward to understand the behavior of this program.
Let's analyze the types in more detail.

~~~
putStrLn :: String -> IO ()
getLine  :: IO String
print    :: Show a => a -> IO ()
~~~

Or more interestingly, we note that each expression in the `do` block has a type of `IO a`.

<pre>
main = do
  putStrLn "Enter ... " :: <span class="high">IO ()</span>
  getLine               :: <span class="high">IO String</span>
  print Something       :: <span class="high">IO ()</span>
</pre>

We should also pay attention to the effect of the `<-` symbol.

~~~
do
 x <- something
~~~

If `something :: IO a` then `x :: a`.

Another important note about using `IO`.
All lines in a do block must be of one of the two forms:

~~~
action1             :: IO a
                    -- in this case, generally a = ()
~~~

or

~~~
value <- action2    -- where
                    -- bar z t :: IO b
                    -- value   :: b
~~~

These two kinds of line will correspond to two different ways of sequencing actions.
The meaning of this sentence should be clearer by the end of the next section.

<a href="code/03_Hell/01_IO/01_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>01_progressive_io_example.lhs</strong> </a>

<hr/><a href="code/03_Hell/01_IO/02_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>02_progressive_io_example.lhs</strong></a>

Now let's see how this program behaves.
For example, what occur if the user enter something strange?
Let's try:

~~~
    % runghc 02_progressive_io_example.lhs
    Enter a list of numbers (separated by comma):
    foo
    Prelude.read: no parse
~~~

Argh! An evil error message and a crash! 
The first evolution will be to answer with a more friendly message.

In order to do this, we must detect that something went wrong.
Here is one way to do this.
Use the type `Maybe`.
It is a very common type in Haskell.

<div class="codehighlight">
<code class="haskell">
import Data.Maybe
</code>
</div>
What is this thing? `Maybe` is a type which takes one parameter.
Its definition is:

<code class="haskell">
data Maybe a = Nothing | Just a
</code>

This is a nice way to tell there was an error while trying to create/compute
a value.
The `maybeRead` function is a great example of this. 
This is a function similar to the function `read`[^1],
but if something goes wrong the returned value is `Nothing`.
If the value is right, it returns `Just <the value>`.
Don't try to understand too much of this function. 
I use a lower level function than `read`; `reads`.

[^1]: Which itself is very similar to the javascript `eval` on a string containing JSON).

<div class="codehighlight">
<code class="haskell">
maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
                  [(x,"")]    -> Just x
                  _           -> Nothing
</code>
</div>
Now to be a bit more readable, we define a function which goes like this:
If the string has the wrong format, it will return `Nothing`.
Otherwise, for example for "1,2,3", it will return `Just [1,2,3]`.

<div class="codehighlight">
<code class="haskell">
getListFromString :: String -> Maybe [Integer]
getListFromString str = maybeRead $ "[" ++ str ++ "]"
</code>
</div>
We simply have to test the value in our main function.

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = do
  putStrLn "Enter a list of numbers (separated by comma):"
  input <- getLine
  let maybeList = getListFromString input in
      case maybeList of
          Just l  -> print (sum l)
          Nothing -> error "Bad format. Good Bye."
</code>
</div>
In case of error, we display a nice error message.

Note that the type of each expression in the main's do block remains of the form `IO a`.
The only strange construction is `error`. 
I'll say `error msg` will simply take the needed type (here `IO ()`).

One very important thing to note is the type of all the functions defined so far.
There is only one function which contains `IO` in its type: `main`. 
This means main is impure.
But main uses `getListFromString` which is pure.
It is then clear just by looking at declared types which functions are pure and
which are impure.

Why does purity matter?
I certainly forget many advantages, but the three main reasons are:

- It is far easier to think about pure code than impure one.
- Purity protects you from all the hard to reproduce bugs due to side effects.
- You can evaluate pure functions in any order or in parallel without risk.

This is why you should generally put as most code as possible inside pure functions.

<a href="code/03_Hell/01_IO/02_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>02_progressive_io_example.lhs</strong> </a>

<hr/><a href="code/03_Hell/01_IO/03_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>03_progressive_io_example.lhs</strong></a>

Our next evolution will be to prompt the user again and again until she enters a valid answer.

We keep the first part:

<div class="codehighlight">
<code class="haskell">
import Data.Maybe

maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
                  [(x,"")]    -> Just x
                  _           -> Nothing
getListFromString :: String -> Maybe [Integer]
getListFromString str = maybeRead $ "[" ++ str ++ "]"
</code>
</div>
Now, we create a function which will ask the user for an list of integers
until the input is right.

<div class="codehighlight">
<code class="haskell">
askUser :: IO [Integer]
askUser = do
  putStrLn "Enter a list of numbers (separated by comma):"
  input <- getLine
  let maybeList = getListFromString input in
      case maybeList of
          Just l  -> return l
          Nothing -> askUser
</code>
</div>
This function is of type `IO [Integer]`. 
Such a type means that we retrieved a value of type `[Integer]` through some IO actions.
Some people might explain while waving their hands: 

 > «This is an `[Integer]` inside an `IO`»

If you want to understand the details behind all of this, you'll have to read the next section.
But sincerely, if you just want to _use_ IO.
Just practice a little and remember to think about the type.

Finally our main function is quite simpler:

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = do
  list <- askUser
  print $ sum list
</code>
</div>
We have finished with our introduction to `IO`.
This was quite fast. Here are the main things to remember:

- in the `do` bloc, each expression must have the type `IO a`.
  You are then limited in the number of expressions available.
  For example, `getLine`, `print`, `putStrLn`, etc...
- Try to externalize the pure functions as much as possible.
- the `IO a` type means: an IO _action_ which returns an element of type `a`.
  `IO` represents actions; under the hood, `IO a` is the type of a function.
  Read the next section if you are curious.

If you practice a bit, you should be able to _use_ `IO`.

 > _Exercises_:
 > 
 > - Make a program that sums all of its arguments. Hint: use the function `getArgs`.

<a href="code/03_Hell/01_IO/03_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>03_progressive_io_example.lhs</strong> </a>

<h3 id="io-trick-explained">IO trick explained</h3>

blogimage("magritte_pipe.jpg","Magritte, ceci n'est pas une pipe")

 > Here is a %tldr for this section.
 >
 > To separate pure and impure parts,
 > `main` is defined as a function
 > which modifies the state of the world
 >
 > ~~~
 > main :: World -> World
 > ~~~
 >
 > A function is guaranteed to have side effects only if it has this type.
 > But look at a typical main function:
 >
 > ~~~
 > main w0 =
 >     let (v1,w1) = action1 w0 in
 >     let (v2,w2) = action2 v1 w1 in
 >     let (v3,w3) = action3 v2 w2 in
 >     action4 v3 w3
 > ~~~
 >
 > We have a lot of temporary elements (here `w1`, `w2` and `w3`)
 > which must be passed on to the next action.
 >
 > We create a function `bind` or `(>>=)`.
 > With `bind` we don't need temporary names anymore.
 >
 > ~~~
 > main =
 >   action1 >>= action2 >>= action3 >>= action4
 > ~~~
 >
 > Bonus: Haskell has syntactical sugar for us:
 >
 > ~~~
 > main = do
 >   v1 <- action1
 >   v2 <- action2 v1
 >   v3 <- action3 v2
 >   action4 v3
 > ~~~

Why did we use this strange syntax, and what exactly is this `IO` type?
It looks a bit like magic.

For now let's just forget all about the pure parts of our program, and focus
on the impure parts:

<code class="haskell">
askUser :: IO [Integer]
askUser = do
  putStrLn "Enter a list of numbers (separated by commas):"
  input <- getLine
  let maybeList = getListFromString input in
      case maybeList of
          Just l  -> return l
          Nothing -> askUser

main :: IO ()
main = do
  list <- askUser
  print $ sum list
</code>

First remark; it looks like an imperative structure.
Haskell is powerful enough to make impure code look imperative.
For example, if you wish you could create a `while` in Haskell.
In fact, for dealing with `IO`, imperative style is generally more appropriate.

But you should had noticed the notation is a bit unusual.
Here is why, in detail.

In an impure language, the state of the world can be seen as a huge hidden global variable.
This hidden variable is accessible by all functions of your language.
For example, you can read and write a file in any function.
The fact that a file exists or not can be seen as different states of the world.

For Haskell this state is not hidden.
It is explicitly said `main` is a function that _potentially_ changes the state of the world.
Its type is then something like:

<code class="haskell">
main :: World -> World
</code>

Not all functions may have access to this variable.
Those which have access to this variable are impure.
Functions to which the world variable isn't provided are pure[^032001].

[^032001]: There are some _unsafe_ exceptions to this rule. But you shouldn't see such use on a real application except maybe for debugging purpose.

Haskell considers the state of the world as an input variable to `main`.
But the real type of main is closer to this one[^032002]:

[^032002]: For the curious the real type is `data IO a = IO {unIO :: State# RealWorld -> (# State# RealWorld, a #)}`. All the `#` as to do with optimisation and I swapped the fields in my example. But mostly, the idea is exactly the same.

<code class="haskell">
main :: World -> ((),World)
</code>

The `()` type is the null type.
Nothing to see here.

Now let's rewrite our main function with this in mind:

<code class="haskell">
main w0 =
    let (list,w1) = askUser w0 in
    let (x,w2) = print (sum list,w1) in
    x
</code>

First, we note that all functions which have side effects must have the type:

<code class="haskell">
World -> (a,World)
</code>

Where `a` is the type of the result.
For example, a `getChar` function should have the type `World -> (Char,World)`.

Another thing to note is the trick to fix the order of evaluation.
In Haskell, in order to evaluate `f a b`, you have many choices:

- first eval `a` then `b` then `f a b`
- first eval `b` then `a` then `f a b`.
- eval `a` and `b` in parallel then `f a b`

This is true, because we should work in a pure language.

Now, if you look at the main function, it is clear you must eval the first
line before the second one since, to evaluate the second line you have
to get a parameter given by the evaluation of the first line.

Such trick works nicely.
The compiler will at each step provide a pointer to a new real world id.
Under the hood, `print` will evaluate as:

- print something on the screen
- modify the id of the world
- evaluate as `((),new world id)`.

Now, if you look at the style of the main function, it is clearly awkward.
Let's try to do the same to the askUser function:

<code class="haskell">
askUser :: World -> ([Integer],World)
</code>

Before:

<code class="haskell">
askUser :: IO [Integer]
askUser = do
  putStrLn "Enter a list of numbers:"
  input <- getLine
  let maybeList = getListFromString input in
      case maybeList of
          Just l  -> return l
          Nothing -> askUser
</code>

After:

<code class="haskell">
askUser w0 =
    let (_,w1)     = putStrLn "Enter a list of numbers:" in
    let (input,w2) = getLine w1 in
    let (l,w3)     = case getListFromString input of
                      Just l   -> (l,w2)
                      Nothing  -> askUser w2
    in
        (l,w3)
</code>

This is similar, but awkward.
Look at all these temporary `w?` names.

The lesson, is, naive IO implementation in Pure functional languages is awkward!

Fortunately, there is a better way to handle this problem.
We see a pattern.
Each line is of the form:

<code class="haskell">
let (y,w') = action x w in
</code>

Even if for some line the first `x` argument isn't needed.
The output type is a couple, `(answer, newWorldValue)`.
Each function `f` must have a type similar to:

<code class="haskell">
f :: World -> (a,World)
</code>

Not only this, but we can also note that we always follow the same usage pattern:

<code class="haskell">
let (y,w1) = action1 w0 in
let (z,w2) = action2 w1 in
let (t,w3) = action3 w2 in
...
</code>

Each action can take from 0 to n parameters.
And in particular, each action can take a parameter from the result of a line above.

For example, we could also have:

<code class="haskell">
let (_,w1) = action1 x w0   in
let (z,w2) = action2 w1     in
let (_,w3) = action3 x z w2 in
...
</code>

And of course `actionN w :: (World) -> (a,World)`.

 > IMPORTANT, there are only two important patterns to consider:
 >
 > ~~~
 > let (x,w1) = action1 w0 in
 > let (y,w2) = action2 x w1 in
 > ~~~
 >
 > and
 >
 > ~~~
 > let (_,w1) = action1 w0 in
 > let (y,w2) = action2 w1 in
 > ~~~

leftblogimage("jocker_pencil_trick.jpg","Jocker pencil trick")

Now, we will do a magic trick.
We will make the temporary world symbol "disappear".
We will `bind` the two lines.
Let's define the `bind` function.
Its type is quite intimidating at first:

<code class="haskell">
bind :: (World -> (a,World))
        -> (a -> (World -> (b,World)))
        -> (World -> (b,World))
</code>

But remember that `(World -> (a,World))` is the type for an IO action.
Now let's rename it for clarity:

<code class="haskell">
type IO a = World -> (a, World)
</code>

Some example of functions:

<code class="haskell">
getLine :: IO String
print :: Show a => a -> IO ()
</code>

`getLine` is an IO action which takes a world as parameter and returns a couple `(String,World)`.
Which can be summarized as: `getLine` is of type `IO String`.
Which we also see as, an IO action which will return a String "embeded inside an IO".

The function `print` is also interesting.
It takes one argument which can be shown.
In fact it takes two arguments.
The first is the value to print and the other is the state of world.
It then returns a couple of type `((),World)`.
This means it changes the state of the world, but doesn't yield anymore data.

This type helps us simplify the type of `bind`:

<code class="haskell">
bind :: IO a
        -> (a -> IO b)
        -> IO b
</code>

It says that `bind` takes two IO actions as parameter and return another IO action.

Now, remember the _important_ patterns. The first was:

<code class="haskell">
let (x,w1) = action1 w0 in
let (y,w2) = action2 x w1 in
(y,w2)
</code>

Look at the types:

<code class="haskell">
action1  :: IO a
action2  :: a -> IO b
(y,w2)   :: IO b
</code>

Doesn't it seem familiar?

<code class="haskell">
(bind action1 action2) w0 =
    let (x, w1) = action1 w0
        (y, w2) = action2 x w1
    in  (y, w2)
</code>

The idea is to hide the World argument with this function. Let's go:
As an example imagine if we wanted to simulate:

<code class="haskell">
let (line1,w1) = getLine w0 in
let ((),w2) = print line1 in
((),w2)
</code>

Now, using the bind function:

<code class="haskell">
(res,w2) = (bind getLine (\l -> print l)) w0
</code>

As print is of type `(World -> ((),World))`, we know `res = ()` (null type).
If you didn't see what was magic here, let's try with three lines this time.

<code class="haskell">
let (line1,w1) = getLine w0 in
let (line2,w2) = getLine w1 in
let ((),w3) = print (line1 ++ line2) in
((),w3)
</code>

Which is equivalent to:

<code class="haskell">
(res,w3) = bind getLine (\line1 ->
             bind getLine (\line2 ->
               print (line1 ++ line2)))
</code>

Didn't you notice something?
Yes, no temporary World variables are used anywhere!
This is _MA_. _GIC_.

We can use a better notation.
Let's use `(>>=)` instead of `bind`.
`(>>=)` is an infix function like
`(+)`; reminder `3 + 4 ⇔ (+) 3 4`

<code class="haskell">
(res,w3) = getLine >>=
           \line1 -> getLine >>=
           \line2 -> print (line1 ++ line2)
</code>

Ho Ho Ho! Happy Christmas Everyone!
Haskell has made syntactical sugar for us:

<code class="haskell">
do
  x <- action1
  y <- action2
  z <- action3
  ...
</code>

Is replaced by:

<code class="haskell">
action1 >>= \x ->
action2 >>= \y ->
action3 >>= \z ->
...
</code>

Note you can use `x` in `action2` and `x` and `y` in `action3`.

But what about the lines not using the `<-`?
Easy, another function `blindBind`:

<code class="haskell">
blindBind :: IO a -> IO b -> IO b
blindBind action1 action2 w0 =
    bind action (\_ -> action2) w0
</code>

I didn't simplify this definition for clarity purpose.
Of course we can use a better notation, we'll use the `(>>)` operator.

And

<code class="haskell">
do
    action1
    action2
    action3
</code>

Is transformed into

<code class="haskell">
action1 >>
action2 >>
action3
</code>

Also, another function is quite useful.

<code class="haskell">
putInIO :: a -> IO a
putInIO x = IO (\w -> (x,w))
</code>

This is the general way to put pure values inside the "IO context".
The general name for `putInIO` is `return`.
This is quite a bad name when you learn Haskell. `return` is very different from what you might be used to.

<hr/><a href="code/03_Hell/01_IO/21_Detailled_IO.lhs" class="cut">03_Hell/01_IO/<strong>21_Detailled_IO.lhs</strong></a>

To finish, let's translate our example:

<code class="haskell">

askUser :: IO [Integer]
askUser = do
  putStrLn "Enter a list of numbers (separated by commas):"
  input <- getLine
  let maybeList = getListFromString input in
      case maybeList of
          Just l  -> return l
          Nothing -> askUser

main :: IO ()
main = do
  list <- askUser
  print $ sum list
</code>

Is translated into:

<div class="codehighlight">
<code class="haskell">
import Data.Maybe

maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
                  [(x,"")]    -> Just x
                  _           -> Nothing
getListFromString :: String -> Maybe [Integer]
getListFromString str = maybeRead $ "[" ++ str ++ "]"
askUser :: IO [Integer]
askUser = 
    putStrLn "Enter a list of numbers (sep. by commas):" >>
    getLine >>= \input ->
    let maybeList = getListFromString input in
      case maybeList of
        Just l -> return l
        Nothing -> askUser

main :: IO ()
main = askUser >>=
  \list -> print $ sum list
</code>
</div>
You can compile this code to verify it keeps working.

Imagine what it would look like without the `(>>)` and `(>>=)`.

<a href="code/03_Hell/01_IO/21_Detailled_IO.lhs" class="cut">03_Hell/01_IO/<strong>21_Detailled_IO.lhs</strong> </a>

<hr/><a href="code/03_Hell/02_Monads/10_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>10_Monads.lhs</strong></a>

<h3 id="monads">Monads</h3>

blogimage("dali_reve.jpg","Dali, reve. It represents a weapon out of the mouth of a tiger, itself out of the mouth of another tiger, itself out of the mouth of a fish itself out of a grenade. I could have choosen a picture of the Human centipede as it is a very good representation of what a monad really is. But just to thing about it, I find this disgusting and that wasn't the purpose of this document.")

Now the secret can be revealed: `IO` is a _monad_.
Being a monad means you have access to some syntactical sugar with the `do` notation.
But mainly, you have access to a coding pattern which will ease the flow of your code.

 > **Important remarks**:
 >
 > - Monad are not necessarily about effects!
 >   There are a lot of _pure_ monads.
 > - Monad are more about sequencing

For the Haskell language `Monad` is a type class.
To be an instance of this type class, you must provide the functions `(>>=)` and `return`.
The function `(>>)` will be derived from `(>>=)`.
Here is how the type class `Monad` is declared (mostly):

<code class="haskell">
class Monad m  where
  (>>=) :: m a -> (a -> m b) -> m b
  return :: a -> m a

  (>>) :: m a -> m b -> m b
  f >> g = f >>= \_ -> g

  -- You should generally safely ignore this function
  -- which I believe exists for historical reason
  fail :: String -> m a
  fail = error
</code>

 > Remarks:
 >
 > - the keyword `class` is not your friend.
 >   A Haskell class is _not_ a class like in object model.
 >   A Haskell class has a lot of similarities with Java interfaces.
 >   A better word should have been `typeclass`.
 >   That means a set of types.
 >   For a type to belong to a class, all functions of the class must be provided for this type.
 > - In this particular example of type class, the type `m` must be a type that takes an argument.
 >   for example `IO a`, but also `Maybe a`, `[a]`, etc...
 > - To be a useful monad, your function must obey some rules.
 >   If your construction does not obey these rules strange things might happens:
 >
 >   ~~~
 >   return a >>= k  ==  k a
 >   m >>= return  ==  m
 >   m >>= (\x -> k x >>= h)  ==  (m >>= k) >>= h
 >   ~~~

<h4 id="maybe-monad">Maybe is a monad</h4>

There are a lot of different types that are instance of `Monad`.
One of the easiest to describe is `Maybe`.
If you have a sequence of `Maybe` values, you can use monads to manipulate them.
It is particularly useful to remove very deep `if..then..else..` constructions.

Imagine a complex bank operation. You are eligible to gain about 700€ only
if you can afford to follow a list of operations without being negative.

<div class="codehighlight">
<code class="haskell">
deposit  value account = account + value
withdraw value account = account - value

eligible :: (Num a,Ord a) => a -> Bool
eligible account =
  let account1 = deposit 100 account in
    if (account1 < 0)
    then False
    else
      let account2 = withdraw 200 account1 in
      if (account2 < 0)
      then False
      else
        let account3 = deposit 100 account2 in
        if (account3 < 0)
        then False
        else
          let account4 = withdraw 300 account3 in
          if (account4 < 0)
          then False
          else
            let account5 = deposit 1000 account4 in
            if (account5 < 0)
            then False
            else
              True

main = do
  print $ eligible 300 -- True
  print $ eligible 299 -- False
</code>
</div>
<a href="code/03_Hell/02_Monads/10_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>10_Monads.lhs</strong> </a>

<hr/><a href="code/03_Hell/02_Monads/11_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>11_Monads.lhs</strong></a>

Now, let's make it better using Maybe and the fact that it is a Monad

<div class="codehighlight">
<code class="haskell">
deposit :: (Num a) => a -> a -> Maybe a
deposit value account = Just (account + value)

withdraw :: (Num a,Ord a) => a -> a -> Maybe a
withdraw value account = if (account < value) 
                         then Nothing 
                         else Just (account - value)

eligible :: (Num a, Ord a) => a -> Maybe Bool
eligible account = do
  account1 <- deposit 100 account 
  account2 <- withdraw 200 account1 
  account3 <- deposit 100 account2 
  account4 <- withdraw 300 account3 
  account5 <- deposit 1000 account4
  Just True

main = do
  print $ eligible 300 -- Just True
  print $ eligible 299 -- Nothing
</code>
</div>
<a href="code/03_Hell/02_Monads/11_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>11_Monads.lhs</strong> </a>

<hr/><a href="code/03_Hell/02_Monads/12_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>12_Monads.lhs</strong></a>

Not bad, but we can make it even better:

<div class="codehighlight">
<code class="haskell">
deposit :: (Num a) => a -> a -> Maybe a
deposit value account = Just (account + value)

withdraw :: (Num a,Ord a) => a -> a -> Maybe a
withdraw value account = if (account < value) 
                         then Nothing 
                         else Just (account - value)

eligible :: (Num a, Ord a) => a -> Maybe Bool
eligible account =
  deposit 100 account >>=
  withdraw 200 >>=
  deposit 100  >>=
  withdraw 300 >>=
  deposit 1000 >>
  return True

main = do
  print $ eligible 300 -- Just True
  print $ eligible 299 -- Nothing
</code>
</div>
We have proven that Monads are a good way to make our code more elegant.
Note this idea of code organization, in particular for `Maybe` can be used
in most imperative language.
In fact, this is the kind of construction we make naturally.

 > An important remark:
 > 
 > The first element in the sequence being evaluated to `Nothing` will stop
 > the complete evaluation. 
 > This means you don't execute all lines.
 > You have this for free, thanks to laziness.

You could also replay these example with the definition of `(>>=)` for `Maybe`
in mind:

<code class="haskell">
instance Monad Maybe where
    (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
    Nothing  >>= _  = Nothing
    (Just x) >>= f  = f x

    return x = Just x
</code>

The `Maybe` monad proved to be useful while being a very simple example.
We saw the utility of the `IO` monad.
But now a cooler example, lists.

<a href="code/03_Hell/02_Monads/12_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>12_Monads.lhs</strong> </a>

<hr/><a href="code/03_Hell/02_Monads/13_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>13_Monads.lhs</strong></a>

<h4 id="the-list-monad">The list monad</h4>

blogimage("golconde.jpg","Golconde de Magritte")

The list monad helps us to simulate non deterministic computations.
Here we go:

<div class="codehighlight">
<code class="haskell">
import Control.Monad (guard)

allCases = [1..10]

resolve :: [(Int,Int,Int)]
resolve = do
              x <- allCases
              y <- allCases
              z <- allCases
              guard $ 4*x + 2*y < z
              return (x,y,z)

main = do
  print resolve
</code>
</div>
MA. GIC. :

~~~
[(1,1,7),(1,1,8),(1,1,9),(1,1,10),(1,2,9),(1,2,10)]
~~~

For the list monad, there is also a syntactical sugar:

<div class="codehighlight">
<code class="haskell">
  print $ [ (x,y,z) | x <- allCases,
                      y <- allCases,
                      z <- allCases,
                      4*x + 2*y < z ]
</code>
</div>
I won't list all the monads, but there are many monads.
Using monads simplifies the manipulation of several notions in pure languages.
In particular, monad are very useful for:

- IO,
- non deterministic computation,
- generating pseudo random numbers,
- keeping configuration state,
- writing state,
- ...

If you have followed me until here, then you've done it!
You know monads[^03021301]!

[^03021301]: Well, you'll certainly need to practice a bit to get used to them and to understand when you can use them and create your own. But you already made a big step in this direction.

<a href="code/03_Hell/02_Monads/13_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>13_Monads.lhs</strong> </a>

<h2 id="appendix">Appendix</h2>

This section is not so much about learning Haskell.
It is just here to discuss some details further.

<hr/><a href="code/04_Appendice/01_More_on_infinite_trees/10_Infinite_Trees.lhs" class="cut">04_Appendice/01_More_on_infinite_trees/<strong>10_Infinite_Trees.lhs</strong></a>

<h3 id="more-on-infinite-tree">More on Infinite Tree</h3>

In the section [Infinite Structures](#infinite-structures) we saw some simple
constructions.
Unfortunately we removed two properties from our tree:

1. no duplicate node value
2. well ordered tree

In this section we will try to keep the first property.
Concerning the second one, we must relax it but we'll discuss how to
keep it as much as possible.

<div style="display:none">

This code is mostly the same as the one in the [tree section](#trees).

<div class="codehighlight">
<code class="haskell">
import Data.List
data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                  deriving (Eq,Ord)

-- declare BinTree a to be an instance of Show
instance (Show a) => Show (BinTree a) where
  -- will start by a '<' before the root
  -- and put a : a begining of line
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    treeshow pref Empty = ""
    treeshow pref (Node x Empty Empty) = 
                  (pshow pref x)

    treeshow pref (Node x left Empty) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    treeshow pref (Node x Empty right) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    treeshow pref (Node x left right) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- show a tree using some prefixes to make it nice
    showSon pref before next t = 
                  pref ++ before ++ treeshow (pref ++ next) t

    -- pshow replace "\n" by "\n"++pref
    pshow pref x = replace '\n' ("\n"++pref) (show x)

    -- replace on char by another string
    replace c new string =
      concatMap (change c new) string
      where
          change c new x 
              | x == c = new
              | otherwise = x:[] -- "x"

</code>
</div>
</div>

Our first step is to create some pseudo-random number list:

<div class="codehighlight">
<code class="haskell">
shuffle = map (\x -> (x*3123) `mod` 4331) [1..]
</code>
</div>
Just as a reminder, here is the definition of `treeFromList`

<div class="codehighlight">
<code class="haskell">
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList []    = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))
</code>
</div>
and `treeTakeDepth`:

<div class="codehighlight">
<code class="haskell">
treeTakeDepth _ Empty = Empty
treeTakeDepth 0 _     = Empty
treeTakeDepth n (Node x left right) = let
          nl = treeTakeDepth (n-1) left
          nr = treeTakeDepth (n-1) right
          in
              Node x nl nr
</code>
</div>
See the result of:

<div class="codehighlight">
<code class="haskell">
main = do
      putStrLn "take 10 shuffle"
      print $ take 10 shuffle
      putStrLn "\ntreeTakeDepth 4 (treeFromList shuffle)"
      print $ treeTakeDepth 4 (treeFromList shuffle)
</code>
</div>
~~~
% runghc 02_Hard_Part/41_Infinites_Structures.lhs
take 10 shuffle
[3123,1915,707,3830,2622,1414,206,3329,2121,913]
treeTakeDepth 4 (treeFromList shuffle)

< 3123
: |--1915
: |  |--707
: |  |  |--206
: |  |  `--1414
: |  `--2622
: |     |--2121
: |     `--2828
: `--3830
:    |--3329
:    |  |--3240
:    |  `--3535
:    `--4036
:       |--3947
:       `--4242
~~~

Yay! It ends! 
Beware though, it will only work if you always have something to put into a branch.

For example 

<code class="haskell">
treeTakeDepth 4 (treeFromList [1..]) 
</code>

will loop forever. 
Simply because it will try to access the head of `filter (<1) [2..]`.
But `filter` is not smart enought to understand that the result is the empty list.

Nonetheless, it is still a very cool example of what non strict programs have to offer.

Left as an exercise to the reader:

- Prove the existence of a number `n` so that `treeTakeDepth n (treeFromList shuffle)` will enter an infinite loop.
- Find an upper bound for `n`.
- Prove there is no `shuffle` list so that, for any depth, the program ends.

<a href="code/04_Appendice/01_More_on_infinite_trees/10_Infinite_Trees.lhs" class="cut">04_Appendice/01_More_on_infinite_trees/<strong>10_Infinite_Trees.lhs</strong> </a>

<hr/><a href="code/04_Appendice/01_More_on_infinite_trees/11_Infinite_Trees.lhs" class="cut">04_Appendice/01_More_on_infinite_trees/<strong>11_Infinite_Trees.lhs</strong></a>

<div style="display:none">

This code is mostly the same as the preceding one.

<div class="codehighlight">
<code class="haskell">
import Debug.Trace (trace)
import Data.List
data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                  deriving (Eq,Ord)
</code>
</div>
<div class="codehighlight">
<code class="haskell">
-- declare BinTree a to be an instance of Show
instance (Show a) => Show (BinTree a) where
  -- will start by a '<' before the root
  -- and put a : a begining of line
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    treeshow pref Empty = ""
    treeshow pref (Node x Empty Empty) = 
                  (pshow pref x)

    treeshow pref (Node x left Empty) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    treeshow pref (Node x Empty right) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    treeshow pref (Node x left right) = 
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- show a tree using some prefixes to make it nice
    showSon pref before next t = 
                  pref ++ before ++ treeshow (pref ++ next) t

    -- pshow replace "\n" by "\n"++pref
    pshow pref x = replace '\n' ("\n"++pref) (" " ++ show x)

    -- replace on char by another string
    replace c new string =
      concatMap (change c new) string
      where
          change c new x 
              | x == c = new
              | otherwise = x:[] -- "x"

treeTakeDepth _ Empty = Empty
treeTakeDepth 0 _     = Empty
treeTakeDepth n (Node x left right) = let
          nl = treeTakeDepth (n-1) left
          nr = treeTakeDepth (n-1) right
          in
              Node x nl nr
</code>
</div>
</div>

In order to resolve these problem we will modify slightly our
`treeFromList` and `shuffle` function.

A first problem, is the lack of infinite different number in our implementation of `shuffle`.
We generated only `4331` different numbers.
To resolve this we make a slightly better `shuffle` function.

<div class="codehighlight">
<code class="haskell">
shuffle = map rand [1..]
          where 
              rand x = ((p x) `mod` (x+c)) - ((x+c) `div` 2)
              p x = m*x^2 + n*x + o -- some polynome
              m = 3123    
              n = 31
              o = 7641
              c = 1237
</code>
</div>
This shuffle function has the property (hopefully) not to have an upper nor lower bound.
But having a better shuffle list isn't enough not to enter an infinite loop.

Generally, we cannot decide whether `filter (<x) xs` is empty.
Then to resolve this problem, I'll authorize some error in the creation of our binary tree.
This new version of code can create binary tree which don't have the following property for some of its nodes: 

 > Any element of the left (resp. right) branch must all be strictly inferior (resp. superior) to the label of the root.

Remark it will remains _mostly_ an ordered binary tree.
Furthermore, by construction, each node value is unique in the tree.

Here is our new version of `treeFromList`. We simply have replaced `filter` by `safefilter`.

<div class="codehighlight">
<code class="haskell">
treeFromList :: (Ord a, Show a) => [a] -> BinTree a
treeFromList []    = Empty
treeFromList (x:xs) = Node x left right
          where 
              left = treeFromList $ safefilter (<x) xs
              right = treeFromList $ safefilter (>x) xs
</code>
</div>
This new function `safefilter` is almost equivalent to `filter` but don't enter infinite loop if the result is a finite list.
If it cannot find an element for which the test is true after 10000 consecutive steps, then it considers to be the end of the search.

<div class="codehighlight">
<code class="haskell">
safefilter :: (a -> Bool) -> [a] -> [a]
safefilter f l = safefilter' f l nbTry
  where
      nbTry = 10000
      safefilter' _ _ 0 = []
      safefilter' _ [] _ = []
      safefilter' f (x:xs) n = 
                  if f x 
                     then x : safefilter' f xs nbTry 
                     else safefilter' f xs (n-1) 
</code>
</div>
Now run the program and be happy:

<div class="codehighlight">
<code class="haskell">
main = do
      putStrLn "take 10 shuffle"
      print $ take 10 shuffle
      putStrLn "\ntreeTakeDepth 8 (treeFromList shuffle)"
      print $ treeTakeDepth 8 (treeFromList $ shuffle)
</code>
</div>
You should realize the time to print each value is different.
This is because Haskell compute each value when it needs it.
And in this case, this is when asked to print it on the screen.

Impressively enough, try to replace the depth from `8` to `100`.
It will work without killing your RAM! 
The flow and the memory management is done naturally by Haskell.

Left as an exercise to the reader:

- Even with large constant value for `deep` and `nbTry`, it seems to work nicely. But in the worst case, it can be exponential.
  Create a worst case list to give as parameter to `treeFromList`.  
  _hint_: think about (`[0,-1,-1,....,-1,1,-1,...,-1,1,...]`).
- I first tried to implement `safefilter` as follow:
  <pre>
  safefilter' f l = if filter f (take 10000 l) == []
                    then []
                    else filter f l
  </pre>
  Explain why it doesn't work and can enter into an infinite loop.
- Suppose that `shuffle` is real random list with growing bounds.
  If you study a bit this structure, you'll discover that with probability 1,
  this structure is finite.
  Using the following code 
  (suppose we could use `safefilter'` directly as if was not in the where of safefilter)
  find a definition of `f` such that with probability `1`, 
  treeFromList' shuffle is infinite. And prove it.
  Disclaimer, this is only a conjecture.

<code class="haskell">
treeFromList' []  n = Empty
treeFromList' (x:xs) n = Node x left right
    where
        left = treeFromList' (safefilter' (<x) xs (f n)
        right = treeFromList' (safefilter' (>x) xs (f n)
        f = ???
</code>

<a href="code/04_Appendice/01_More_on_infinite_trees/11_Infinite_Trees.lhs" class="cut">04_Appendice/01_More_on_infinite_trees/<strong>11_Infinite_Trees.lhs</strong> </a>

## Thanks

Thanks to [`/r/haskell`](http://reddit.com/r/haskell) and 
[`/r/programming`](http://reddit.com/r/programming).
Your comment were most than welcome.

Particularly, I want to thank [Emm](https://github.com/Emm) a thousand times 
for the time he spent on correcting my English. 
Thank you man.
