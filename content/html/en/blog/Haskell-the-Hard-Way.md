-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-02-08T15:17:53+02:00
title: Learn Haskell Fast and Hard
subtitle: Blow your mind with Haskell
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Haskell
  - programming
  - functional
  - tutorial
-----
<%= blogimage("magritte_pleasure_principle.jpg","Magritte pleasure principle") %>

begindiv(intro)

<%= tldr %> A very short and dense tutorial for learning Haskell.


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
>       * <a href="#deal-with-parenthesis">Deal with parenthesis</a>
>   * <a href="#useful-notations-for-functions">Useful notations for functions</a>
> * <a href="#hard-part">Hard Part</a>
>   * <a href="#functional-style">Functional style</a>
>     * <a href="#higher-level-functions">Higher Level Functions</a>
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

I really believe all developer should learn Haskell.
I don't think all should be super Haskell ninjas,
but at least, they should discover what Haskell has to offer.
Learning Haskell open your mind.

Mainstream languages share the same foundations:

- variables
- loops
- pointers[^0001]
- data structures, objects and classes (for most)

[^0001]: Even if most recent languages try to hide them, they are present.

Haskell is very different.
This language use a lot of concepts I've never heard about before.
Many of those concept will help you become a better programmer.

But, learning Haskell can be hard.
It was for me.
In this article I try to provide what I lacked during my learning.

This article will certainly be hard to follow.
This is done on purpose.
There is no shortcut to learn Haskell.
It is hard and challenging. 
But I believe this is a good thing.
This is because it is hard that Haskell is interesting.

The conventional method to learn Haskell is to read two books. 
First ["Learn You a Haskell"](http://learnyouahaskell.com) and just after ["Real World Haskell"](http://www.realworldhaskell.org).
I also believe this is the right way to go.
But, to learn what Haskell is all about, you'll have to read them in detail.

On the other hand, this article is a very hard and dense overview of all major aspects of Haskell.
I also added some informations I lacked while I learned Haskell.


The article contains five parts:

- Introduction: a fast short example to show Haskell can be friendly.
- Basic Haskell: Haskell syntax, and some essential notions.
- Hard Difficulty Part:
    - Functional style; an example from imperative to functional style
    - Types; types and a standard binary tree example
    - Infinite Structure; manipulate an infinite binary tree!
- Hell Difficulty Part:
    - Deal with IO; A very minimal example
    - IO trick explained; the hidden detail I lacked to understand IO
    - Monads; incredible how we can generalize
- Appendix:
    - More on infinite tree; a more math oriented discussion about infinite trees


 > Note: Each time you'll see a separator with a filename ending in `.lhs`, 
 > you could click the filename to get this file. 
 > If you save the file as `filename.lhs`, you can run it with 
 > <pre>
 > runhaskell filename.lhs
 > </pre>
 >
 > Some might not work, but most will.
 > You should see a link just below.


enddiv

<hr/><a href="code/01_basic/10_Introduction/00_hello_world.lhs" class="cut">01_basic/10_Introduction/<strong>00_hello_world.lhs</strong></a>

<h2 id="introduction">Introduction</h2>

<h3 id="install">Install</h3>

<%= blogimage("Haskell-logo.png", "Haskell logo") %>

- [Haskell Platform](http://www.haskell.org/platform) is the standard way to install Haskell.

Tools:

- `ghc`: Compiler similar to gcc for `C`.
- `ghci`: Interactive Haskell (REPL)
- `runhaskell`: Execute a program without compiling it. Convenient but very slow compared to compiled program.

<h3 id="don-t-be-afraid">Don't be afraid</h3>

<%= blogimage("munch_TheScream.jpg","The Scream") %>

Many book/articles about Haskell start by introducing some esoteric formula (quick sort, Fibonacci, etc...).
I will make the exact opposite.
At first I won't show you any Haskell super power.
I will start with similarities between Haskell and other programming languages.
Let's jump in the obligatory "Hello World".

<div class="codehighlight">
<code class="haskell">
main = print "Hello World!"
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

Now, a program asking your name and reply "Hello" using the name you entered:

<div class="codehighlight">
<code class="haskell">
main = do
    print "What is your name?"
    name <- getLine
    print ("Hello " ++ name ++ "!")
</code>
</div>
First, let us compare with a similar program in other imperative languages:

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
A major part of this tutorial will explain why.

In Haskell, there is a `main` function and every object has a type.
The type of `main` is `IO ()`.
This means, `main` will cause side effects.
`IO` is a ... . 
Wait! No! I won't say it now!
I am afraid to terrify you.
You might run away crying.
For now, I won't talk about what `IO` really is.

Just remember that Haskell can look a lot like other imperative languages.

<a href="code/01_basic/10_Introduction/10_hello_you.lhs" class="cut">01_basic/10_Introduction/<strong>10_hello_you.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/20_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>20_very_basic.lhs</strong></a>

<h3 id="very-basic-haskell">Very basic Haskell</h3>

<%= blogimage("picasso_owl.jpg","Picasso minimal owl") %>

Before continuing you need to be warned about some essential properties of Haskell. 

_Functional_

Haskell is a functional language.
If you come from imperative language, you'll have to learn a lot of new things.
Hopefully many of these new concepts will help you to program even in imperative languages.

_Smart Static Typing_

Instead of being in your way like in `C`, `C++` or `Java`, the type system is here to help you.

_Purity_

Generally your function won't modify anything of the outside world.
This means, it can't modify the value of a variable, can't get user input, can't write on the screen, can't launch a missile.
On the other hand, parallelism will be very easy to achieve.
Haskell makes it clear where effects occurs and where you are pure.
Also, it will be far easier to reason about your program.
Most bug will be prevented in pure part of your program.

Furthermore there is an essential respected law in Haskell:

 > Applying a function with the same parameter always return the same value.

_Lazyness_

This is a very uncommon feature.
By default, Haskell evaluate something only when it is needed.
As consequence, it provides a very elegant way to manipulate infinite structures for example. 

A last warning on how you should read Haskell code.
For me, it is like reading scientific papers.
Some part are very clear, but when you see a formula, just focus and read slower.
Also, while learning Haskell, it _really_ doesn't matter much if you don't understand syntax details.
If you cross a `>>=`, `<$>`, `<-` or any other weird symbol, just ignore them and follows the flow of the code.

<h4 id="function-declaration">Function declaration</h4>

You might be used to declare functions like this:

In `C`:

<code class="c">
int f(int x, int y) {
    return x*x + y*y;
}
</code>

In javascript:

<code class="javascript">
function f(x,y) {
    return x*x + y*y;
}
</code>

in Python:

<code class="python">
def f(x,y) =
    return x*x + y*y;
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

Finaly, the Haskell way is:

<code class="haskell">
f x y = x*x + y*y
</code>

Very clean. No parenthesis, no `def`.

Don't forget, Haskell use functions and types a lot.
It is thus very easy to define them.
The syntax was particularly well thought for these objects.

<h4 id="a-type-example">A Type Example</h4>

The common usage is to declare the type of your function.
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

The problem: `2.3` isn't an Int.

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
Great, we don't have to declare a new function for each different type.
For example, in `C`, you'll have to declare a function for `int`, for `float`, for `long`, for `double`, etc...

But, what type should we declare?
To discover the type Haskell as found for us, just launch ghci:

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

Hey? What is this strange type?

~~~
Num a => a -> a -> a
~~~

First, let's focus on the right part `a -> a -> a`.
To understand it, just look at a list of progressive examples: 

| The&nbsp;written&nbsp;type | It's meaning |
| `Int`            | the type `Int`                              |
| `Int -> Int`     | the type function from `Int` to `Int`.      |
| `Float -> Int`   | the type function from `Float` to `Int`.    |
| `a -> Int`       | the type function from any type to `Int`.   |
| `a -> a`         | the type function from any type `a` to the same type `a`.  |
| `a -> a -> a`    | the type function of two arguments of any type `a` to the same type `a`.  |

In the type `a -> a -> a`, the letter `a` is a _type variable_. 
It means `f` is a function with two argument and both argument and the result have the same type.
The type variable `a` could take many different type value.
For example `Int`, `Integer`, `Float`...

So instead of having a forced type like in `C` with declaring the function for `int`, `long`, `float`, `double`, etc... 
We declare only one function like in a dynamic typed language.

Generally `a` can be any type. 
For example a `String`, an `Int`, but also more complex types, like `Trees`, other functions, etc...
But here our type is prefixed with `Num a => `. 

`Num` is a _type class_.
A type class can be understood as a set of types.
`Num` contains only types which behave like numbers.
More precisely, `Num` is class containing types who implement a specific list of functions, and in particular `(+)` and `(*)`.

Type class is a very powerful language construction.
We can do some incredibly powerful stuff with this.
More on this later.

Finally, `Num a => a -> a -> a` means:

Let `a` be a type belonging to the `Num` type class.
This is a function from type `a` to (`a -> a`).

Yes, strange. 
In fact, in Haskell no function really have two arguments.
Instead all functions have only one argument.

More precisely `f 3 4` is equivalent to `(f 3) 4`. 
Note `f 3` is a function:

~~~
f :: Num a :: a -> a -> a

g :: Num a :: a -> a
g = f 3

g y ⇔ 3*3 + y*y
~~~

Another notation exists for function. 
The lambda notation permit us to create function without assigning them a name.
We call them anonymous function.
We could have written:

~~~
g = \y -> 3*3 + y*y
~~~

The `\` is used because it looks like `λ` and is ASCII.

If you are not used to functional programming your brain should start to heat up.
It is time to make some real application.

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
It works, because, `3` is a valid representation for both Fractional numbers like Float and for Integer.
As `2.4` is a Fractional number, `3` is then interpreted as being also a Fractional number.

<a href="code/01_basic/10_Introduction/23_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>23_very_basic.lhs</strong> </a>

<hr/><a href="code/01_basic/10_Introduction/24_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>24_very_basic.lhs</strong></a>

If we force our function to work with different type, it will fail:

<div class="codehighlight">
<code class="haskell">
f :: Num a => a -> a -> a
f x y = x*x + y*y

x :: Int
x = 3
y :: Float
y = 2.4
main = print (f x y) -- won't work because type x ‡ type y
</code>
</div>
The compiler complains. 
The two parameter must have the same type.

If you believe it is a bad idea, and the compiler should make the transformation 
from a type to another for you, you should really watch this great (and funny) video:
[WAT](https://www.destroyallsoftware.com/talks/wat)

<a href="code/01_basic/10_Introduction/24_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>24_very_basic.lhs</strong> </a>

<h2 id="essential-haskell">Essential Haskell</h2>

<%= blogimage("kandinsky_gugg.jpg","Kandinsky Gugg") %>

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
x^n     for n an integral
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

<h5 id="deal-with-parenthesis">Deal with parenthesis</h5>

To remove some parenthesis you can use two functions: `($)` and `(.)`.

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
It's called currying.

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

The hard part could now begins.

<h3 id="functional-style">Functional style</h3>

<%= blogimage("hr_giger_biomechanicallandscape_500.jpg","Biomechanical Landscape by H.R. Giger") %>

In this section, I give a short example of the impressive refactoring ability provided by Haskell.
We will choose a problem and resolve it using a standard imperative way. 
Then I will make the code evolve.
The end result will be both more elegant and easier to adapt. 

Let's resolve the following problem:

 > Given a list of integer, return the sum of its even numbers.
 > 
 > example:
 > `[1,2,3,4,5] ⇒  2 + 4 ⇒  6`

To show differences between functional and imperative approach, 
I'll start by providing an imperative solution (in javascript):

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

But, in Haskell we don't have variable, nor for loop.
One solution to achieve the same result without loop is to use recursion.

 > _Remark_:  
 > Recursion is generally perceived as slow in imperative language.
 > But it is generally not the case in functional programming.
 > Most of the time Haskell will handle recursive function efficiently.

Here is a `C` version of the recursive function.
Note, for simplicity, I assume the int list should end with the first `0` value.

<code class="c">
int evenSum(int *list) {
    return accumSum(0,list);
}

int accumSum(int n, int *list) {
    int x;
    int *xs;
    if (*list == NULL) { // if the list is empty
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

Keep this code in mind. We will translate it in Haskell.
But before, I need to introduce three simple but useful function we will use:

<code class="haskell">
even :: Integral a => a -> Bool
head :: [a] -> a
tail :: [a] -> [a]
</code>

`even` verify if a number is even.

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

`tail`, returns all element except the first of a list:

<code class="haskell">
tail :: [a] -> [a]
tail [1,2,3] ⇒ [2,3]
tail [3]     ⇒ []
tail []      ⇒ ERROR
</code>

Remark that for any non empty list `l`, 
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

[^2]: I know I cheat. But I will talk about non-strict later.

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

Coming from an imperative language all should seems right.
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
This way our `accumSum` function won't pollute the global name space.

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
Use value instead of general parameter name.

Instead of saying: `foo l = if l == [] then <x> else <y>`
You simply state:  

<code class="haskell">
foo [] =  <x>
foo l  =  <y>
</code>

But pattern matching go even further. 
It is also able to inspect inside data. 
We can replace

<code class="haskell">
foo l =  let x  = head l 
             xs = tail l
         in if even x 
             then foo (n+x) xs
             else foo n xs
</code>

by

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

We also can curry a bit our definition by removing the `l`:

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

<h4 id="higher-level-functions">Higher Level Functions</h4>

<%= blogimage("escher_polygon.png","Escher") %>

To make things even better we should use higher level functions.
What are these beast?
Higher level functions are functions taking function as parameter.

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
      mysum n (x:xs) = mysum xs (n+x) 
</code>

where

<code class="haskell">
filter even [1..10] ⇔  [2,4,6,8,10]
</code>

The function `filter` takes a function of type (`a -> Bool`) and a list of type `[a]`. It returns a list containing only elements for which the function returned `true`.

Our next step is to use another way to simulate loop. 
We will use the `foldl` to accumulate a value.
The function `foldl` capture a general coding pattern:

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

But as Haskell is lazy, it doesn't evaluate `(f z x)` and push this to the stack.
This is why we generally use `foldl'` instead of `foldl`;
`foldl'` is a _strict_ version of `foldl`.
If you don't understand what lazy and strict means,
don't worry, just follow the code as if `foldl` and `foldl'` where identical.

Now our new version of `evenSum` become:

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
And of course, we remark 

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
If you are not used to it, you should exercise a bit.

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
The `(.)` function correspond to the mathematical composition.

<code class="haskell">
(f . g . h) x ⇔  f ( g (h x))
</code>

We can take advantage of this operator to curry a bit more our function:

<code class="haskell">
-- Version 9
import Data.List (foldl')
evenSum :: Integral a => [a] -> a
evenSum = (foldl' (+) 0) . (filter even)
</code>

Also, we could rename a bit some part to make it clearer:

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

We didn't had to modify _inside_ the function definition.
It feels more modular.
But there is also you can think more mathematically about your function.
You could then use your function as any other one.
You could compose, map, fold, filter using your new function.

To modify version 1 is left as an exercise to the reader ☺.

If you believe we reached the end of generalization, then know you are very wrong.
For example, there is a way to not only use this function on list but on any recursive type.
If you want to know how, I suggest you to read this quite fun article: [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire by Meijer, Fokkinga and Paterson](http://eprints.eemcs.utwente.nl/7281/0
1/db-utwente-40501F46.pdf).

This example should show you how pure functional programming is great.
Unfortunately, using pure functional programming isn't well suited for all usages.
Or at least it isn't found yet.

One of the great power of Haskell, is the ability to create DSL 
(Domain Specific Language)
making it easy to change the programming paradigm.

In fact, Haskell is also great when you want to write imperative style programming.
Understanding this was really hard for me when learning Haskell.
A lot of effort is provided to explain you how much functional approach is superior. 
Then when you attack the imperative style of Haskell, it is hard to understand why and how.

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

<%= blogimage("salvador-dali-the-madonna-of-port-lligat.jpg","Dali, the madonna of port Lligat") %>

 > <%=tldr%>
 > 
 > - `type Name = AnotherType` is just an alias and the compiler doesn't do any difference between `Name` and `AnotherType`.
 > - `data Name = NameConstructor AnotherType` make a difference.
 > - `data` can construct structures which can be recursives.
 > - `deriving` is magic and create functions for you.

In Haskell, types are strong and static.

Why is this important? It will help you _a lot_ not to make some mistake.
In Haskell, most bugs are caught during the compilation of your program.
And the main reason is because of the type inference during compilation.
It will be easy to detect where you used the bad parameter at the wrong place for example.

<h4 id="type-inference">Type inference</h4>

Static typing is generally essential to reach fast execution time.
But most static typed language are bad to generalize concepts.
What saves Haskell is that it can _infere_ types.

Here is a simple example. 
The `square` function in Haskell:

<code class="haskell">
square x = x * x
</code>

This function can `square` any Numeral type.
You can provide `square` an `Int`, an `Integer`, a `Float` a `Fractional` and even `Complex`. Proof by example:

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

Now compare with the necessary C code:

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
class Number<T> {
    T value;
    square() {
        value = value*value;
    }
}

Number<int> i;
i.square;

Number<float> f;
f.square;

class Complex {
    int real;
    int img;
    Complex operator<*>(Complex z) {
        Complex result;
        result.real = real*z.real - img*z.img;
        result.img  = img*z.real + real*z.img;
        return res;
    }
}

Number<Complex> z;
z.square
</code>

Even with C++ templates you are forced to write a line for each type.

To be fair, there is also a definition of the multiplication of `Complex` in Haskell.
But it takes only one line.
Somewhere in the source of the module `Data.Complex`:

<code class="haskell">
instance Num (Complex a) where
  ...
  (x:+y) * (x':+y')   =  (x*x'-y*y') :+ (x*y'+y*x')
  ...
</code>

The inference of type gives Haskell a feeling of the freedom that dynamic 
typed languages provide. 
But unlike dynamic typed languages, most error are caught before the execution.
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

You already encountered recursive types: lists.
You can re-create lists, but with a more verbose syntax:

<code class="haskell">
data List a = Empty | Cons a (List a)
</code>

If you really want to use an easier syntax you can use infix name for constructors.

<code class="haskell">
infixr 5 :::
data List a = Nil | a ::: (List a)
</code>

The number after `infixr` is the priority.

If you want to be able to print (`Show`), read (`Read`), test equality (`Eq`) and compare (`Ord`) your new data structure you can tell Haskell to derive the appropriate function for you.

<div class="codehighlight">
<code class="haskell">
infixr 5 :::
data List a = Nil | a ::: (List a) 
              deriving (Show,Read,Eq,Ord)
</code>
</div>
When you add `deriving (Show)` to your data declaration, Haskell create a `show` function for you.
We'll see soon how you could use your own `show` function.

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
This print:

~~~
0 ::: (1 ::: Nil)
0 ::: (1 ::: Nil)
~~~

<a href="code/02_Hard_Part/23_Types.lhs" class="cut">02_Hard_Part/<strong>23_Types.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/30_Trees.lhs" class="cut">02_Hard_Part/<strong>30_Trees.lhs</strong></a>

<h4 id="trees">Trees</h4>

<%= blogimage("magritte-l-arbre.jpg","Magritte, l'Arbre") %>

We'll just give another standard example: binary trees.

<div class="codehighlight">
<code class="haskell">
import Data.List

data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                              deriving (Show)
</code>
</div>
Also we create a function which transform a list into an ordered binary tree.

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
- a list `(x:xs)` will be converted to the tree where:
  - The root is `x`
  - Its left subtree is the tree created from the list of the remaining element of `xs` which are strictly inferior to `x` and 
  - the right subtree is the tree created from the elements strictly superior to `x` of the list `xs`.

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
I simply had fun into making a nice function to display tree in a general way.
You can safely pass this part if you find it too difficult to follow.

We have few changes to make.
We remove the `deriving (Show)` in the declaration of our `BinTree` type.
And it also might be useful to make our BinTree an instance of (`Eq` and `Ord`).
We will be able to test equality and compare trees.

<div class="codehighlight">
<code class="haskell">
data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                  deriving (Eq,Ord)
</code>
</div>
Without the `deriving (Show)`, Haskell doesn't create a `show` method for us.
We will create our own version of show.
To achieve this, we must declare that our newly created type `BinTree a` 
is an instance of the type class `Show`.
The general syntax is:

<code class="haskell">
instance Show (BinTree a) where
   show t = ... -- You declare your function here
</code>

Here is my version on how to show a binary tree.
Don't worry about the apparent complexity.
I made a lot of improvement in order to display even strange objects.

<div class="codehighlight">
<code class="haskell">
-- declare BinTree a to be an instance of Show
instance (Show a) => Show (BinTree a) where
  -- will start by a '<' before the root
  -- and put a : a begining of line
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    -- treeshow pref Tree 
    --   show a tree and start each line with pref
    -- We don't display Empty tree
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

    -- Tree with left and right sons non empty
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
The `treeFromList` method remain identical.

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
The root is shown by starting by the `<` character.
And each other line start by a `:`.
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

This is why I chosen to prefix each line of tree display by `:` (except for the root).

<%= blogimage("yo_dawg_tree.jpg","Yo Dawg Tree") %>

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

Remark how duplicate trees aren't inserted;
there is only one tree corresponding to `"I","HEARD"`.
We have this for (almost) free, because we have declared Tree to be an instance of `Eq`.

See how awesome this structure is.
We can make tree containing not only integer, string and char, but also other trees.
And we can even make a tree containing a tree of trees!

<a href="code/02_Hard_Part/31_Trees.lhs" class="cut">02_Hard_Part/<strong>31_Trees.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/40_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>40_Infinites_Structures.lhs</strong></a>

<h3 id="infinite-structures">Infinite Structures</h3>

<%= blogimage("escher_infinite_lizards.jpg","Escher") %>

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

And most function will work with them. 
Also there exists the function `take` equivalent to our `take'`.

<a href="code/02_Hard_Part/40_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>40_Infinites_Structures.lhs</strong> </a>

<hr/><a href="code/02_Hard_Part/41_Infinites_Structures.lhs" class="cut">02_Hard_Part/<strong>41_Infinites_Structures.lhs</strong></a>

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
A complete binary tree were each node is equal to 0.
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

This code compile, run and stop giving the following result:

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

Just to heat your neurones a bit more,
let's make a slightly more interesting tree:

<div class="codehighlight">
<code class="haskell">
iTree = Node 0 (dec iTree) (inc iTree)
        where
           dec (Node x l r) = Node (x-1) (dec l) (dec r) 
           inc (Node x l r) = Node (x+1) (inc l) (inc r) 
</code>
</div>
Another way to create this tree is to use an higher order function.
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
If you are interested of the generalization of `map` to other data structure,
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

Congratulation to get so far!
Now, some of the really hardcore stuff could start.

If you are like me, you should get the functional style.
You should also understand a bit more the advantages of laziness by default.
But you also don't really understand were to start to make a real program.
And in particular:

- How do you deal with effects?
- Why is there a strange imperative-like notation for dealing with IO?

Be prepared, answer might be difficult to get.
But they all be very rewarding.

<hr/><a href="code/03_Hell/01_IO/01_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>01_progressive_io_example.lhs</strong></a>

<h3 id="deal-with-io">Deal With IO</h3>

<%= blogimage("magritte_carte_blanche.jpg","Magritte, Carte blanche") %>

 > <%=tldr%>
 > 
 > A typical function doing `IO` look a lot like an imperative language:
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
 > - Few objects have the type `IO a`, this should help you to choose.
 >   In particular you cannot use pure function directly here.
 >   To use pure function you could do `action2 (purefunction x)` for example.

In this section, I will explain how to use IO, not how they work.
You'll see how Haskell separate pure from impure part of the program.

Don't stop because you're trying to understand the details of the syntax.
Answer will come in the next section.

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

Or more interestingly, we remark each expression in the `do` block has a type of `IO a`.

<pre>
main = do
  putStrLn "Enter ... " :: <span class="high">IO ()</span>
  getLine               :: <span class="high">IO String</span>
  print Something       :: <span class="high">IO ()</span>
</pre>

We should also remark the effect of the `<-` symbol.

~~~
do
 x <- something
~~~

If `something :: IO a` then `x :: a`.

Another important remark to use `IO`.
All line in a do block must have one of the two forms:

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

These two kind of line will correspond to two different way of sequencing actions.
The meaning of this sentence should be clearer at the end of the next section.

<a href="code/03_Hell/01_IO/01_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>01_progressive_io_example.lhs</strong> </a>

<hr/><a href="code/03_Hell/01_IO/02_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>02_progressive_io_example.lhs</strong></a>

Now let's see how this behave.
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

For this, we must detect, something went wrong.
Here is one way to do this.
Use the type `Maybe`.
It is a very common type in Haskell.

<div class="codehighlight">
<code class="haskell">
import Data.Maybe
</code>
</div>
What is this thing? Maybe is a type which takes one parameter.
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
In case of error, we prompt a nice error message.

Remark the type of each expression in the main's do block remains of the form `IO a`.
The only strange construction is `error`. 
I'll say `error msg` will simply take the needed type (here `IO ()`).

One very important thing to note is the type of all the defined function.
There is only one function which contains `IO` in its type: `main`. 
That means main is impure. 
But main use `getListFromString` which is pure.
It is then clear just by looking at declared types where are pure and impure functions.

Why purity matters? 
I certainly forget many advantages, but the three main reason are:

- It is far easier to think about pure code than impure one.
- Purity protect you from all hard to reproduce bugs due to border effects.
- You can evaluate pure functions in any order or in parallel without risk.

This is why, you should generally put as most code as possible in pure functions.

<a href="code/03_Hell/01_IO/02_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>02_progressive_io_example.lhs</strong> </a>

<hr/><a href="code/03_Hell/01_IO/03_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>03_progressive_io_example.lhs</strong></a>

Our next evolution will be to ask the user again and again until it enters a valid answer.

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
Now, we create a function which will ask the user for an integer list
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
Such a type means, that we retrieved a value of type `[Integer]` through some IO actions.
Some people might explain while waving their hands: 

 > «This is an `[Integer]` inside an `IO`»

If you want to understand the details behind all of this, you'll have to read the next section.
But sincerely, if you just want to _use_ IO.
Just exercise a little and remember to think about the type.

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
This was quite a fast.  Here are the main things to remind:

- in the `do` bloc, each expression must have the type `IO a`.
  You are then limited in the number of expression you could use.
  For example, `getLine`, `print`, `putStrLn`, etc...
- Try to externalize the pure function as much as possible.  
- the `IO a` type means: an IO _action_ which return an element of type `a`.
  `IO` represent action; under the hood, `IO a` is the type of a function.
  Read the next section if you are curious.

If you exercise a bit, you should be able to _use_ `IO`.

 > _Exercises_:
 > 
 > - Make a program that sum all its argument. Hint: use the function `getArgs`.

<a href="code/03_Hell/01_IO/03_progressive_io_example.lhs" class="cut">03_Hell/01_IO/<strong>03_progressive_io_example.lhs</strong> </a>

<h3 id="io-trick-explained">IO trick explained</h3>

<%= blogimage("magritte_pipe.jpg","Magritte, ceci n'est pas une pipe") %>

 > Here is a <%=tldr%> for this section.
 > 
 > To separate pure from impure part, 
 > the main is defined as a function
 > which modify the state of the world
 > 
 > ~~~
 > main :: World -> World
 > ~~~
 > 
 > A function is granted to have side effect only if it gets this value.
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
 > which must be passed to the next action.
 >
 > We create a function `bind` or `(>>=)`. 
 > With `bind` we need no more temporary name.
 > 
 > ~~~
 > main =
 >   action1 >>= action2 >>= action3 >>= action4
 > ~~~
 >
 > Bonus: Haskell has a syntactical sugar for us:
 >
 > ~~~
 > main = do
 >   v1 <- action1 
 >   v2 <- action2 v1
 >   v3 <- action3 v2
 >   action4 v3
 > ~~~

Why did we used some strange syntax, and what exactly is this `IO` type.
It looks a bit like magic.

For now let's just forget about all the pure part of our program, and focus
on the impure part:

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
Haskell is powerful enough to make some pure code to look imperative.
For example, if you wish you could create a `while` in Haskell.
In fact, for dealing with `IO`, imperative style is generally more appropriate.

But, you should had remarked the notation is a bit unusual.
Here is why, in detail.

In an impure language, the state of the world can be seen as a huge hidden global variable. 
This hidden variable is accessible by all function of your language.
For example, you can read and write a file in any function.
The fact a file exists or not, can be seen as different state of the world.

For Haskell this state is not hidden.
It is explicitly said `main` is a function that _potentially_ change the state of the world.
It's type is then something like:

<code class="haskell">
main :: World -> World
</code>

Not all function could have access to this variable.
Those who have access to this variable can potentially be impure.
Functions whose the world variable isn't provided to should be pure[^032001].

[^032001]: There are some _unsafe_ exception to this rule. But you shouldn't see such usage on a real application except might be for some debugging purpose.

Haskell consider the state of the world is an input variable for `main`.
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

First, we remark, that all function which have side effect must have the type:

<code class="haskell">
World -> (a,World)
</code>

Where `a` is the type of result. 
For example, a `getChar` function should have the type `World -> (Char,World)`.

Another thing to remark is the trick to fix the order of evaluation.
In Haskell to evaluate `f a b`, you generally have many choices: 

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
Let's try to make the same to the askUser function:

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

The lesson, is, naive IO implementation in Pure functional language is awkward!

Fortunately, some have found a better way to handle this problem.
We see a pattern.
Each line is of the form:

<code class="haskell">
let (y,w') = action x w in
</code>

Even if for some line the first `x` argument isn't needed.
The output type is a couple, `(answer, newWorldValue)`.
Each function `f` must have a type of kind:

<code class="haskell">
f :: World -> (a,World)
</code>

Not only this, but we can also remark we use them always 
with the following general pattern:

<code class="haskell">
let (y,w1) = action1 w0 in
let (z,w2) = action2 w1 in
let (t,w3) = action3 w2 in
...
</code>

Each action can take 0 to some parameters.
And in particular, each action can take a parameter from the result of a line above.

For example, we could also have:

<code class="haskell">
let (_,w1) = action1 x w0   in
let (z,w2) = action2 w1     in
let (_,w3) = action3 x z w2 in
...
</code>

And of course `actionN w :: (World) -> (a,World)`.

 > IMPORTANT, there are only two important pattern for us:
 > 
 > ~~~
 > let (x,w1) = action1 w0 in
 > let (y,w2) - action2 w1 in
 > ~~~
 > 
 > and
 > 
 > ~~~ 
 > let (_,w1) = action1 w0 in
 > let (y,w2) = action2 w1 in
 > ~~~

<%= leftblogimage("jocker_pencil_trick.jpg","Jocker pencil trick") %>

Now, we will make a magic trick.
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

`getLine` is an IO action which take a world as parameter and return a couple `(String,World)`.
Which can be said as: `getLine` is of type `IO String`.
Which we also see as, an IO action which will return a String "embeded inside an IO".

The function `print` is also interresting.
It takes on argument which can be shown.
In fact it takes two arguments.
The first is the value to print and the other is the state of world.
It then return a couple of type `((),World)`. 
This means it changes the world state, but don't give anymore data.

This type help us simplify the type of `bind`:

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

Doesn't seem familiar?

<code class="haskell">
(bind action1 action2) w0 =
    let (x, w1) = action1 w0
        (y, w2) = action2 x w1
    in  (y, w2)
</code>

The idea is to hide the World argument with this function. Let's go:
As example imagine if we wanted to simulate:

<code class="haskell">
let (line1,w1) = getLine w0 in
let ((),w2) = print line1 in
((),w2)
</code>

Now, using the bind function:

<code class="haskell">
(res,w2) = (bind getLine (\l -> print l)) w0
</code>

As print is of type (World -> ((),World)), we know res = () (null type).
If you didn't saw what was magic here, let's try with three lines this time.

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

Didn't you remark something?
Yes, there isn't anymore temporary World variable used anywhere!
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
Haskell has made a syntactical sugar for us:

<code class="haskell">
do
  y <- action1
  z <- action2
  t <- action3
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

But what for line not using the `<-`?
Easy another function `blindBind`:

<code class="haskell">
blindBind :: IO a -> IO b -> IO b
blindBind action1 action2 w0 =
    bind action (\_ -> action2) w0
</code>

I didn't curried this definition for clarity purpose. Of course we can use a better notation, we'll use the `(>>)` operator.

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

This is the general way to put pure value inside the "IO context".
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
You can compile this code to verify it continues to work.

Imagine what it would look like without the `(>>)` and `(>>=)`.

<a href="code/03_Hell/01_IO/21_Detailled_IO.lhs" class="cut">03_Hell/01_IO/<strong>21_Detailled_IO.lhs</strong> </a>

<hr/><a href="code/03_Hell/02_Monads/10_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>10_Monads.lhs</strong></a>

<h3 id="monads">Monads</h3>

<%= blogimage("dali_reve.jpg","Dali, reve. It represent a weapon out of the mouth of a tiger, itself out of the mouth of another tiger, itself out of the mouth of a fish itsleft out of a grenade. I could have choosen a picture of the Human centipede as it is a very good representation of what a monad really is. But just to thing about it, I find this disgusting and that wasn't the purpose of this document.") %>

Now the secret can be revealed: `IO` is a _monad_.
Being a monad means you have access to some syntactical sugar with the `do` notation.
But mainly, you have access to some coding pattern which will ease the flow of your code.

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
 >   A Haskell class has a lot similarities with Java interfaces.
 >   A better word should have been `typeclass`.
 >   That means a set of types.
 >   For a type to belong to a class, all function of the class must be provided for this type.
 > - In this particular example of type class, the type `m` must be a type that take an argument. 
 >   for example `IO a`, but also `Maybe a`, `[a]`, etc...
 > - To be a useful monad, your function must obey some rule.
 >   If your construction does not obey these rules strange things might happens:
 >   
 >   ~~~
 >   return a >>= k  ==  k a
 >   m >>= return  ==  m
 >   m >>= (\x -> k x >>= h)  ==  (m >>= k) >>= h
 >   ~~~

<h4 id="maybe-monad">Maybe is a monad</h4>

There exists a lot of different type that are instance of `Monad`.
One of the easiest to describe is `Maybe`.
If you have a sequence of `Maybe` values, you could use monad to manipulate them.
It is particularly useful to remove very deep `if..then..else..` constructions.

Imagine a complex bank operation. You are eligible to gain about 700€ only
if you can afford to follow a list of operation without being negative.

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

Now, let's make it better using Maybe and the fact it is a Monad

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
We have proved Monad are nice to make our code more elegant.
Note this idea of code organization, in particular for `Maybe` can be used
in most imperative language.
In fact, this is the kind of construction we make naturally.

 > An important remark:
 > 
 > The first element in the sequence being evaluated to `Nothing` will stop
 > the complete evaluation. 
 > That means, you don't execute all lines. 
 > You have this for free, thanks to laziness.

The `Maybe` monad proved to be useful while being a very simple example.
We saw the utility of the `IO` monad.
But now a cooler example, lists.

<a href="code/03_Hell/02_Monads/12_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>12_Monads.lhs</strong> </a>

<hr/><a href="code/03_Hell/02_Monads/13_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>13_Monads.lhs</strong></a>

<h4 id="the-list-monad">The list monad</h4>

<%= blogimage("golconde.jpg","Golconde de Magritte") %>

The list monad help us to simulate non deterministic computation.
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
I won't list all the monads, but there is a lot of monads.
The usage of monad simplify the manipulation of some notion in pure languages.
In particular, monad are very useful for: 

- IO,
- non deterministic computation,
- generating pseudo random numbers, 
- keeping configuration state, 
- writing state,
- ...

If you have followed me until here, then you've done it! 
You know monads[^03021301]!

[^03021301]: Well, you'll certainly need to exercise a bit to be used to them and to understand when you can use them and create your own. But you already made a big step further.

<a href="code/03_Hell/02_Monads/13_Monads.lhs" class="cut">03_Hell/02_Monads/<strong>13_Monads.lhs</strong> </a>

<h2 id="appendix">Appendix</h2>

This section is not so much about learning Haskell.
It is just here to discuss some details further.

<hr/><a href="code/04_Appendice/01_More_on_infinite_trees/10_Infinite_Trees.lhs" class="cut">04_Appendice/01_More_on_infinite_trees/<strong>10_Infinite_Trees.lhs</strong></a>

<h3 id="more-on-infinite-tree">More on Infinite Tree</h3>

In the section [Infinite Structures](#infinite-structures) we saw some simple construction.
Unfortunately we removed two properties of our tree:

1. no duplicate node value
2. well ordered tree

In this section we will try to keep the first property.
Concerning the second one, we must relax this one but we'll discuss on how to
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
Just as reminder here are the definition of `treeFromList`

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
Beware thought, it will only work if you always have something to put into a branch.

For example 

<code class="haskell">
treeTakeDepth 4 (treeFromList [1..]) 
</code>

will loop forever. 
Simply because, it will try to access the head of `filter (<1) [2..]`.
But filter is not smart enought to understand that the result is the empty list.

Nonetheless, it is still a very cool example of what non strict program has to offer.

Left as an exercise to the reader:

- Could you prove that there exists some number `n` such that `treeTakeDepth n (treeFromList shuffle)` will enter in an infinite loop.
- Find an upper bound for `n`.
- Prove there is no `shuffle` list such that, for any depth, the program ends.

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

