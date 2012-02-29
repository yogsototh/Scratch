-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-02-08T15:17:53+02:00
en: title: Haskell the Hard Way
en: subtitle: Haskell will blow your mind
fr: title: Haskell comme un vrai!
fr: subtitle: Comment se faire griller les neurones
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Haskell
  - programming
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)

en: <%= tldr %>

fr: <%= tlal %>

> <center><sc><b>Table of Content</b></sc></center>
> 
> * Table of Content (generated)
> {:toc}

enddiv

<hr/><a href="code/00_preamble.lhs" class="cut">./<strong>00_preamble.lhs</strong></a>

begindiv(intro)

Bend his mind to Haskell can be hard.
It was for me.
In this article I will try to provide you what I lacked to learn Haskell.

Why should you care about learning Haskell?
You will learn far more than just a new language.
By learning Haskell you will learn a lot of new concept you certainly never heard about.

This article is not intented to be easy.
It will certainly be a bit hard to follow.
If you can't follow me you'll certainly have a far better and longer version in "Learn You a Haskell" and "Real World Haskell".
Try to follow me until the end.
Hopefully, you'll be rewarded by having learned a lot of new concepts.

This actual article contains three parts.

- Introduction: a fast short example to show Haskell can be friendly.
- Basic Haskell: Haskell syntax, and some essential notions.
- Hard Part: 
    - Functional style; an example from imperative to functional
    - Types; a standard binary tree example
    - Purity and IO; how the Haskell solution is incredible.
    - Monads; incredible how we can generalize
    - Other links.

 > Note: Each time you'll see a separator with a filename ending in `.lhs`, you could click the filename to get this file. If you save the file as `filename.lhs`, you can run it with 
 > <pre>
 > runhaskell filename.lhs
 > </pre>
 >
 > Some might not work, but most will.
 > You should see a link just below.

enddiv

<hr/><a href="code/01_basic/10_Introduction/00_hello_world.lhs" class="cut">01_basic/10_Introduction/<strong>00_hello_world.lhs</strong></a>

## Introduction

### Install

- [Haskell Platform](http://www.haskell.org/platform) is the standard way to install Haskell.

Tools:

- `ghc`: Compiler similar to gcc for `C`.
- `ghci`: Interactive Haskell (REPL)
- `runhaskell`: Execute a program without compiling it. Convenient but very slow compared to compiled program.

### Don't be afraid

At first I won't show you any Haskell super power.
I will show you similarities between Haskell and other programming languages.
We'll just start with the obligatory "Hello World".

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

You could also download the literate haskell source.
You should see a link just above the introduction title.
Download this file as `00_hello_world.lhs` and:

<code class="zsh">
~ runhaskell 00_hello_world.lhs
Hello World!
</code>

<hr/><a href="code/01_basic/10_Introduction/10_hello_you.lhs" class="cut">01_basic/10_Introduction/<strong>10_hello_you.lhs</strong></a>

Now, a program that ask your name and display `Hello <your name>!`.

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

In Haskell, there is a `main` function.
In Haskell every object has a type.
The type of `main` is `IO ()`.
This means, `main` will cause side effects.
`IO` is a ... . 
Wait! No! I won't say it now!
I am afraid to terrify you.
You might run away crying.
For now, I won't talk about what `IO` really is.

Just remember, Haskell can look a lot like other imperative languages.

<hr/><a href="code/01_basic/10_Introduction/20_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>20_very_basic.lhs</strong></a>

<h3>Very basic Haskell</h3>

Before continuing you need be warned.
You have to know some essential properties of Haskell. 

_Functional_

Haskell is a functional language.
If you come from imperative language, you'll have to re-learn a lot.
But you will discover many new concepts!

_Smart Static Typing_

Instead of being in your way like in `C`, `C++` or `Java`.
The type system is here to help you.

_Purity_

Generally your function won't modify anything of the outside world.
This means, it can't modify the value of a variable, can't get user input, can't write on the screen, can't launch a missile.
On the other hand, parallelism will be very easy to achieve.
Haskell makes it clear where effects occurs and where you are pure.

Furthermore there is an essential respected law in Haskell:

 > Applying a function with the same parameter always return the same value.

_Lazyness_

You can manipulate infinite structures. 
Inifinte lists, infinite trees etc...

A last warning on how you should read Haskell code.
For me, it is like reading scientific paper.
Some part are very clear, but when you see a formula, just focus and read slower.
Also, while learning Haskell, it _really_ doesn't matter much if you don't understand syntax details. If you cross a `>>=`, `<$>`, `<-` or any other weird symbol, just ignore them and follows the flow of the code.
I'll do my best to help you thought.

<h4>Function declaration</h4>

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

Don't forget, Haskell is mainly built on function and types.
It is thus very easy to define functions and types.
The syntax was particularly well thought for these objects.

The common usage is to declare the type of your function.
This is not mandatory.
The compiler is smart enough to discover it for you.

Let's play a little.

<div class="codehighlight">
<code class="haskell">
f :: Int -> Int -> Int
f x y = x*x + y*y

main = print (f 2 3)
</code>
</div>
~~~
~ runhaskell 20_very_basic.lhs
13
~~~

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
very_basic_2.lhs:6:23:
    No instance for (Fractional Int)
      arising from the literal `4.2'
    Possible fix: add an instance declaration for (Fractional Int)
    In the second argument of `f', namely `4.2'
    In the first argument of `print', namely `(f 2.3 4.2)'
    In the expression: print (f 2.3 4.2)
~~~

The problem, `2.3` isn't an Int.

<hr/><a href="code/01_basic/10_Introduction/22_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>22_very_basic.lhs</strong></a>

The solution, 
don't declare type and let Haskell find the most possible general type for us:

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

<pre>
% ghci
<span style="color: #999;">GHCi, version 7.0.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude&gt;</span> :load 22_very_basic.lhs<span style="color: #999;">  
[1 of 1] Compiling Main    ( 22_very_basic.lhs, interpreted )
Ok, modules loaded: Main.
*Main&gt;</span> :type f
f :: Num a => a -> a -> a
</pre>

Hey? What is this strange type?

~~~
Num a => a -> a -> a
~~~

First, `a` is a type variable. 
It means, that the first and the second argument will have the same type.
And furthermore, the result will also be of the same type.
The type variable `a` could take many different type value.
For example `Int`, `Integer`, `Float`...

So instead of having a forced type like in `C` with declaring the function for `int`, `long`, `float`, `double`, etc... 
We declare only one function like in a dynamic typed language.

Generally, without the type class constraint, `a` can be any type. 
For example a `String`, an `Int`, but also more complex types, like `Trees`, other functions, etc...
But here with have a `Num a => `. 

`Num` is a typeclass.
It contains only type which behave like numbers.
In fact, `Num` is class containing types who implement a specific list of functions, and in particular `(+)` and `(*)`.

Typeclass is a very powerful language construction.
We can do some incredibly powerful construction with this.
More on this later.

Finally, `Num a => a -> a -> a` means:

Let `a` be a type belonging to the `Num` typeclass.
This is a function from type `a` to (`a -> a`).

Yes, strange, in Haskell no function have two argument.
Instead all function have only one argument.

In fact `f 3 4` is equivalent to `(f 3) 4`. 
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

If you are not used to functional programming your brain should start to heat up.
It is time to make some real application.

<hr/><a href="code/01_basic/10_Introduction/23_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>23_very_basic.lhs</strong></a>

But just before that, we should verify, static typing really work as expected:

<div class="codehighlight">
<code class="haskell">
f :: Num a => a -> a -> a
f x y = x*x + y*y

main = print (f 3 2.4)
</code>
</div>
It works, because, `3` is a valid reprensation for both Frational numbers like Float and for Integer. As `2.4` is a Fractional number, `3` is then interpreted as being also a Fractional number.

<hr/><a href="code/01_basic/10_Introduction/24_very_basic.lhs" class="cut">01_basic/10_Introduction/<strong>24_very_basic.lhs</strong></a>

But if we force our function to work with different type, it will fail:

<div class="codehighlight">
<code class="haskell">
f :: Num a => a -> a -> a
f x y = x*x + y*y

x :: Int
x = 3
y :: Float
y = 2.4
main = print (f x y)
</code>
</div>
The comiler complains. 
The two parameter must have the same type.

If you believe it is a bad idea, and the compiler should make the transformation from a type to another for you, you should really watch this great (and funny) video:

[`http://www.destroyallsoftware.com/talks/wat`](https://www.destroyallsoftware.com/talks/wat)

<hr/><a href="code/01_basic/20_Essential_Haskell/00_notations.lhs" class="cut">01_basic/20_Essential_Haskell/<strong>00_notations.lhs</strong></a>

## Essential Haskell

This is the part that certainly will be the most boring.
Think of it like a reference.
Haskell has a lot of features. 
Many informations are missing here.
I suggest you to read this part as fast as possible. 
You could get back if notation seems strange for you.

I use the `⇔` symbol to state that two expression are equivalent.
It is a meta notation, `⇔` does not exists in Haskell.
I will also use `⇒` to show what is the return of an expression.

### Notations

<h5>Arithmetic</h5>

~~~
3 + 2 * 6 / 3 ⇔ 3 + ((2*6)/3)
~~~

<h5>Logic</h5>

~~~
True || False ⇒ True
True && False ⇒ False
True == False ⇒ False
True /= False ⇒ True  (/=) is the operator for different
~~~

<h5>Powers</h5>

~~~
x^n     for n an integral
x**y    for y any kind of number (Float for example)
~~~

Integer have no limit except the capacity of your machine:

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
Data.Ratio> (11%15) * (5%3)
11 % 9
~~~

<h5>Lists</h5>

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

<h5>Strings</h5>

In Haskell strings are list of `Char`.

~~~
'a' :: Char
"a" :: [Char]
""  ⇔ []
"ab" ⇔ ['a','b'] ⇔  'a':"b" ⇔ 'a':['b'] ⇔ 'a':'b':[]
"abc" ⇔ "ab"++"c"
~~~

In real code you shouldn't use list of char to represent text.
You should mostly use `Data.Text` instead.

<h5>Tuples</h5>

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

<hr/><a href="code/01_basic/20_Essential_Haskell/10a_Functions.lhs" class="cut">01_basic/20_Essential_Haskell/<strong>10a_Functions.lhs</strong></a>

### Useful notations for functions

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
You just have to put it inside parathesis.

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
abs x :: Num a => a -> a
abs = if x >= 0 then x else -x
</code>
</div>
Note: the `if .. then .. else` Haskell notation is more like the
`¤?¤:¤` C operator. You cannot forget the `else`.

Another equivalent version:

<div class="codehighlight">
<code class="haskell">
abs' x
     | x >= 0 = x
     | otherwise = -x
</code>
</div>
 > Notation warning: indentation is _important_ in Haskell.
 > Like in Python, a bad indendation could break your code!

<hr/><a href="code/02_Hard_Part/10_Functions.lhs" class="cut">02_Hard_Part/<strong>10_Functions.lhs</strong></a>

## Hard Part

The hard part could now begins.

### Functional style

In this section, I give a short example of the impressive refactoring ability provided by Haskell.
We will choose a problem and resolve it the standard way. 
Then I will make the code evolve.
The end result will be both more elegant and easier to adapt. 

Let's resolve the following problem:

 > Given a list of integer, return the sum of its even numbers.

To show differences between functional and imperative approach, 
I'll start by providing an imperative solution (in javascript):

<code class="javascript">
function evenSum(list) {
    var result = 0
    for (i=0; i< length(list) ; i++) {
        result += list[i];
    }
    return result;
}
</code>

But, in Haskell we don't have variables, nor for or while loop.
This is why we will use recursion[^0120101].
Here is a `C` version of the recursive function.
Note, for simplicity, I assume the int list should end with the first `null` value (`0`):

[^0120101]: Don't worry if you comme from imperative programming. Generally Haskell handles recursion efficiently.

<code class="c">
int evenSum(int *list) {
    return accumSum(0,list);
}

// In C I should have declared this 
// function before evenSum, but
// I find it easier this way
int accumSum(int n, int *list) {
    if (list == nil) { // if the list is empty
        return n;
    } else {
        x = list[0]; // let x be the first element of the list
        xs = list+1; // let xs be the list without its head
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

<div class="codehighlight">
<code class="haskell">
even :: Integral a => a -> Bool
head :: [a] -> a
tail :: [a] -> [a]
</code>
</div>
`even` verify if a number is even.

~~~
even :: Integral a => a -> Bool
even 3  ⇒ False
even 2  ⇒ True
~~~

`head` returns the first element of a list:

~~~
head :: [a] -> a
head [1,2,3] ⇒ 1
head []      ⇒ ERROR
~~~

`tail`, returns all element except the first of a list:

~~~
tail :: [a] -> [a]
tail [1,2,3] ⇒ [2,3]
tail [3]     ⇒ []
tail []      ⇒ ERROR
~~~

Remark that for any list `l`, 
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
<span style="color: #AAA">GHCi, version 7.0.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude&gt;</span> :l 11_Functions.lhs 
<span style="color: #AAA">[1 of 1] Compiling Main             ( 11_Functions.lhs, interpreted )
Ok, modules loaded: Main.
*Main&gt;</span> evenSum [1..5]
6
</pre>

Here is an example of execution[^2]: 

[^2]: I know I cheat. But I will talk about non-strict later.

~~~
*Main> evenSum [1..5]
accumSum 0 [1,2,3,4,5]
1 is odd 
accumSum 0 [2,3,4,5]
2 is even
accumSum 2 [3,4,5]
3 is odd 
accumSum 2 [4,5]
4 is even
accumSum 6 [5]
5 is odd 
accumSum 6 []
l == []
6
~~~

Comming from an imperative language all should seems right.
In reality many things can be improved.
First, we can generalize the type.

<code class="haskell">
evenSum :: Integral a => [a] -> a
</code>

<hr/><a href="code/02_Hard_Part/12_Functions.lhs" class="cut">02_Hard_Part/<strong>12_Functions.lhs</strong></a>

Next, we can use sub functions using `where` or `let`.
This way our `accumSum` function won't polute the global name space.

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

<div class="codehighlight">
<code class="haskell">
foo [] =  <x>
foo l  =  <y>
</code>
</div>
But pattern matching go even further. 
It is also able to inspect inside datas. 
We can replace

<div class="codehighlight">
<code class="haskell">
 foo l =  let x  = head l 
              xs = tail l
          in if even x 
              then foo (n+x) xs
              else foo n xs
</code>
</div>
by

<div class="codehighlight">
<code class="haskell">
 foo (x:xs) = if even x 
                  then foo (n+x) xs
                  else foo n xs
</code>
</div>
This is a very useful feature.
It makes our code both terse and easier to read.

<hr/><a href="code/02_Hard_Part/14_Functions.lhs" class="cut">02_Hard_Part/<strong>14_Functions.lhs</strong></a>

We also can currify a bit our definition by removing the `l`:

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
<hr/><a href="code/02_Hard_Part/15_Functions.lhs" class="cut">02_Hard_Part/<strong>15_Functions.lhs</strong></a>

<h3> Higher Level Functions </h3>

To make things even better we should use higher level functions.
What are these beast?
Higher level functions are functions taking another functions as parameters.

Here are some examples:

<div class="codehighlight">
<code class="haskell">
import Data.List
filter :: (a -> Bool) -> [a] -> [a]
map :: (a -> b) -> [a] -> [b]
foldl' :: (a -> b -> a) -> a -> [b] -> a
</code>
</div>
Let's proceed by small steps.

<div class="codehighlight">
<code class="haskell">
-- Version 5
evenSum l = mysum 0 (filter even l)
    where 
      mysum n [] = n
      mysum n (x:xs) = mysum xs (n+x) 
</code>
</div>
<div class="codehighlight">
<code class="haskell">
filter even [1..10] ⇔  [2,4,6,8,10]
</code>
</div>
Now you can use the `foldl'` to accumulate a value.
The function `foldl` capture a general coding pattern:

<code class="haskell">
myfunc list = foo initialValue list
    foo accumulated []     = accumulated
    foo tmpValue    (x:xs) = foo (bar tmpValue x) xs
</code>

Which can be replaced by:

<code class="haskell">
myfunc list = foldl bar initialValue list
</code>

<div class="codehighlight">
<code class="haskell">
-- Version 6
import Data.List
evenSum l = foldl' mysum 0 (filter even l)
  where mysum acc value = acc + value
</code>
</div>
For each element of the list, `foldl'` will add it to the next.
And finally add 0.

If you really want to know how the magic works.
Here is the definition of `foldl`.

<div class="codehighlight">
<code class="haskell">
foldl f z [] = z
foldl f z (x:xs) = foldl f (f z x) xs
</code>
</div>
But as Haskell is lazy, it doesn't evaluate `(f z x)` and push this in the stack.
`foldl'` is a strict version of `foldl`.
If you don't understand what "lazy" and "strict" means,
don't worry, just follow the code as if `fold` and `foldl'` where identical.

Here is what occurs:

~~~
evenSum [1,2,3,4]
⇒ foldl' mysum 0 (filter even [1,2,3,4])
⇒ foldl' mysum 0 [2,4]
⇒ foldl' mysum (mysum 0 2) [4]
⇒ foldl' mysum (0+2) [4]
⇒ foldl' mysum 2 [4]
⇒ foldl' mysum (mysum 2 4) []
⇒ foldl' mysum (2+4) []
⇒ foldl' mysum 6 []
⇒ 6
~~~

Beware! 
Most of the time you want to use `foldl'` and not `foldl`.

This is nice, but as `mysum` is a very simple function, giving it a name is a burden.
We can use anonymous functions or lambdas.

<div class="codehighlight">
<code class="haskell">
-- Version 7
evenSum l = foldl' (\x y -> x+y) (filter even l)
</code>
</div>
And of course, we remark 

<div class="codehighlight">
<code class="haskell">
(\x y -> x+y) ⇔ (+)
</code>
</div>
<hr/><a href="code/02_Hard_Part/16_Functions.lhs" class="cut">02_Hard_Part/<strong>16_Functions.lhs</strong></a>

Finaly

<div class="codehighlight">
<code class="haskell">
-- Version 8
import Data.List
evenSum :: Integral a => [a] -> a
evenSum l = foldl' (+) 0 (filter even l)
</code>
</div>
`foldl'` isn't the easiest function to intuit.
If you are not used to it, you should exercise a bit.

I would like to introduce another higher order function: `(.)`.
The `(.)` function correspond to the mathematical composition.

<div class="codehighlight">
<code class="haskell">
(f . g . h) x ⇔  f ( g (h x))
</code>
</div>
We can take advantage of this operator to curry a bit more our function:

<div class="codehighlight">
<code class="haskell">
-- Version 9
import Data.List
evenSum :: Integral a => [a] -> a
evenSum = (foldl' (+) 0) . (filter even)
</code>
</div>
Also, there already exists a `sum` function.

<div class="codehighlight">
<code class="haskell">
-- Version 10 
import Data.List
evenSum :: Integral a => [a] -> a
evenSum = sum . (filter even)
</code>
</div>
!!!!!
What power did we gain by using `foldl'`?
You have no more different case to test, it feels more like a mathematical function.
And it become far easier to compose the function with other ones.
!!!!!

Suppose we want to modify slightly our function.
We want to get the sum of all even square of element of the list.

~~~
[1,2,3,4] ~> [1,4,9,16] ~> [4,16] ~> 20
~~~

Update the version 10 is extremely easy:

<div class="codehighlight">
<code class="haskell">
squareEvenSum = sum . (filter even) . (map (^2))
</code>
</div>
We simply had to add another "transformation function".

~~~
map (^2) [1,2,3,4] ⇔ [1,4,9,16]
~~~

!!!!!
The main advantage is you didn't have to modify _inside_ the function definition, but you just had to use another function.
You encapsulate the function and you could use a "pipe-like" notation and way of thinking.
With the ability of not having to open the pipe to modify the behaviour of your program will fastly become a huge help to think about it.
!!!!!

To modify version 1 is left as an exercise to the reader.

If you believe we reached the end of generalization, then know you are very wrong. For example, there is a way to not only use this function on list but on any recursive type. If you want to know how, I suggest you to read this quite fun article: [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire by Meijer, Fokkinga and Paterson](http://eprints.eemcs.utwente.nl/7281/0
1/db-utwente-40501F46.pdf).

This example should show you how pure functional programming is
great. Unfortunately, using pure functional programming isn't well
suited for all usages. Or at least it isn't found yet.

One of the great power of Haskell, is the ability to create DSL 
(Domain Specific Language)
making it easy to change the programming paradigm.

In fact, Haskell is also great when you want to write imperative style
programming. Understand this was really hard for me when learning Haskell.
Because a lot of effort is provided to explain you how much functional
approach is superior. Than when you attack the imperative style of Haskell, it
is hard to understand why and how.

But before talking about this Haskell super-power, we must talk about another
essential aspect of Haskell; the _types_.

<hr/><a href="code/02_Hard_Part/20_Types.lhs" class="cut">02_Hard_Part/<strong>20_Types.lhs</strong></a>

## Types

In Haskell, types are strong and static.

Why is this important? It will help you _a lot_ not to make some mistake.
In fact, most bugs are catched during the compilation of your program.
And the main reason is because of the type inference during compilation.
It will be easy to detect where you used the bad parameter at the wrong place for example.

### Type inference

Static typing is generally essential to reach fast execution time.
But in common languages static typing has the price of bad generalization.
What saves Haskell is that types can be inferred.

Here are some examples on how to simulate a simple square function in Haskell
in other statically typed languages:

<div class="codehighlight">
<code class="haskell">
square x = x * x
</code>
</div>
This function can square any Numeral type.
You can provide square an Int, an Integer, a Float a Fractional and even Complex.

<div class="codehighlight">
<code class="haskell">
square 2
4
square 2.1
4.41
:m Data.Complex
(2 :+ 1) * (2 :+ 1) 
3.0 :+ 4.0
</code>
</div>
`x :+ y` is the notation for the complex (<i>x + ib</i>).

Now compare to the code necessary in C:

<code class="c">
int     int_square(int x) { return x*x; }
float   fl_square(float x) {return x*x; }
complex complex_square (complex z) {
    complex tmp; 
    tmp.real = z.real * z.real - z.img * z.img;
    tmp.img = 2 * z.img * z.real;
}
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

To be fair, there is also a definition of the multiplication of Complex in Haskell.
But it takes only one line.
Somewhere in the source of the module `Data.Complex`:

<div class="codehighlight">
<code class="haskell">
instance Num (Complex a) where
  ...
  (x:+y) * (x':+y')   =  (x*x'-y*y') :+ (x*y'+y*x')
  ...
</code>
</div>
The inference of type gives Haskell a feeling of the freedom that dynamic 
typed languages provide.

<hr/><a href="code/02_Hard_Part/21_Types.lhs" class="cut">02_Hard_Part/<strong>21_Types.lhs</strong></a>

<h3>Type construction</h3>

You can construct you own types.
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
<hr/><a href="code/02_Hard_Part/22_Types.lhs" class="cut">02_Hard_Part/<strong>22_Types.lhs</strong></a>

But it doesn't protect you much.
Try to replace the last line and run the program:

<code class="haskell">
    putStrLn $ showInfos color name
</code>

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

The syntax of `data` is generally:

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
data DataTypeName = DataConstrctor {
                      field1 :: [type of field1]
                    , field2 :: [type of field2]
                    ...
                    , fieldn :: [type of fieldn] }
</code>

And many accessor are made for you.
Furthermore you can use another order when setting values.

Example:

<code class="haskell">
data Complex = Num a => Complex { real :: a, img :: a}
c = Complex 1.0 2.0
z = Complex { real = 3, img = 4 }
real c ⇒ 1.0
img z ⇒ 4
</code>

<hr/><a href="code/02_Hard_Part/23_Types.lhs" class="cut">02_Hard_Part/<strong>23_Types.lhs</strong></a>

### Recursive type

You already encountered recursive types.
Typically, you can re-create lists, but with a more verbose syntax:

~~~
data List a = Empty | Cons a (List a)
~~~

If you really want to use an easier syntax you can use infix name for constructors.

~~~
infixr 5 :::
data List a = Nil | a ::: (List a)
~~~

The number after `infixr` is the priority.

If you want to be able to print (`Show`), read (`Read`), test equality (`Eq`) and compare (`Ord`) your new data structure you can tell Haskell to derive the appropriate function for you.

<div class="codehighlight">
<code class="haskell">
infixr 5 :::
data List a = Nil | a ::: (List a) 
              deriving (Show,Read,Eq,Ord)
</code>
</div>
When told to use deriving Show, Haskell create a `show` function for you.
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

<hr/><a href="code/02_Hard_Part/30_Trees.lhs" class="cut">02_Hard_Part/<strong>30_Trees.lhs</strong></a>

### Trees

Now we'll just give another typical example, binary trees.

<div class="codehighlight">
<code class="haskell">
import Data.List

data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                              deriving (Show)
</code>
</div>
To generate tree easily, we create a function who add an element to a `BinTree`.

<div class="codehighlight">
<code class="haskell">
treeInsert :: (Ord a) => BinTree a -> a -> BinTree a
treeInsert Empty x    = Node x Empty Empty
treeInsert (Node y left right) x
          | x == y    = (Node y left right)
          | x < y     = (Node y (treeInsert left x) right)
          | otherwise = (Node y left (treeInsert right x))
</code>
</div>
Now try this:

<div class="codehighlight">
<code class="haskell">
main = print $ foldl' treeInsert Empty [7,2,4,8]
</code>
</div>
You should obtain the following:

~~~
Node 7 (Node 2 Empty (Node 4 Empty Empty)) (Node 8 Empty Empty)
~~~

This is an informative but quite unpleasant representation of our tree.

<hr/><a href="code/02_Hard_Part/31_Trees.lhs" class="cut">02_Hard_Part/<strong>31_Trees.lhs</strong></a>

Just for fun, let's code a better display for our trees.
I simply had fun into making a nice function to display tree in a general way.
You can safely pass this part if you find it too difficult to follow.

We have few to change to make. 
First, as we will play a bit with string, we import the function `replace`
from `Data.String.Utils`.

<div class="codehighlight">
<code class="haskell">
import Data.List
</code>
</div>
We remove the `deriving (Show)` in the declaration of our `BinTree` type.
And it also might be useful to make our BinTree an instance of (Eq and Ord).
Now we can test equality and compare trees.

<div class="codehighlight">
<code class="haskell">
data BinTree a = Empty 
                 | Node a (BinTree a) (BinTree a) 
                  deriving (Eq,Ord)
</code>
</div>
Without the `deriving (Show)`, Haskell doesn't create a show method for us.
Now, we will create our version of show.
For this, we want our newly created type `BinTree a` to be an instance of
the type class `Show`.
To achieve this, the general syntax is:

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
The `treeInsert` method remain identical.

<div class="codehighlight">
<code class="haskell">
treeInsert :: (Ord a) => BinTree a -> a -> BinTree a
treeInsert Empty x    = Node x Empty Empty
treeInsert (Node y left right) x
          | x == y    = (Node y left right)
          | x < y     = (Node y (treeInsert left x) right)
          | otherwise = (Node y left (treeInsert right x))
</code>
</div>
To help creating tree, we define:

<div class="codehighlight">
<code class="haskell">
treeFromList list = foldl' treeInsert Empty list
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
  print $ treeFromList 
            (map treeFromList 
               [ map treeFromList ["Ia!","Ia!"]
               , map treeFromList ["cthul","hu"]
               , map treeFromList ["Fhtagn!"] ])
</code>
</div>
~~~
Binary tree of Binary trees of Char binary trees:
< < < 'I'
: : : |--'!'
: : : `--'a'
: |--< < 'F'
: |  : : |--'!'
: |  : : `--'h'
: |  : :    |--'a'
: |  : :    |  `--'g'
: |  : :    `--'t'
: |  : :       `--'n'
: `--< < 'c'
:    : : `--'t'
:    : :    |--'h'
:    : :    |  `--'l'
:    : :    `--'u'
:    : `--< 'h'
:    :    : `--'u'
~~~

Remark how you can't insert two identical tree;
there is only one tree corresponding to "Ia!".

Note how awesome this structure is.
We can make tree containing not only integer, string and char, but also other trees.
And we can even make a tree containing a tree of trees!

<hr/><a href="code/03_monads/00_Introduction.lhs" class="cut">03_monads/<strong>00_Introduction.lhs</strong></a>

# Hell Difficulty Part

<%= blogimage("hell_difficulty.jpg","Hell difficulty") %>

Congratulation to get so far!
Now, the real stuff will began.

If you are like me, you should get the functional style.
You should also understand a bit more the advantages of lazyness by default.
But you also don't really understand were to start to make a real program.
And in particular:

- How do you deal with effects?
- Why is there a strange imperative-like notation for dealing with IO?
- How could you deal with mutable data-structures?
- How could you easily parallelize?

I will try to answer each question.
Be prepared, answer might be difficult to get.
But they all be very rewarding.
Be prepared dear adventurer as you will reach the final and thoughest Haskell dungeon!

<hr/><a href="code/03_monads/01_IO/01_progressive_io_example.lhs" class="cut">03_monads/01_IO/<strong>01_progressive_io_example.lhs</strong></a>

<h2> Deal With IO </h2>

Start by resolving a simple example wich deal with user interaction.

 > Ask a user to enter a list of numbers.
 > Return the sum of the numbers

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
It should be straightforward.

<hr/><a href="code/03_monads/01_IO/02_progressive_io_example.lhs" class="cut">03_monads/01_IO/<strong>02_progressive_io_example.lhs</strong></a>

But what occurs if the user enter something strange?
Let's try:

~~~
% runghc 02_progressive_io_example.lhs
Enter a list of numbers (separated by comma):
foo
Prelude.read: no parse
~~~

Argh, an evil error message and a crash! 
Now we just want to put our own, more Human readable message.

For this, we must detect, something went wrong.
Here is one way to do this.
Use the type `Maybe`. It is a very common type in Haskell.

<div class="codehighlight">
<code class="haskell">
import Data.Maybe

maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
                  [(x,"")]    -> Just x
                  _           -> Nothing
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

[^1]: Which itself is very similar to the javascript `eval` on a string containing JSON).

<div class="codehighlight">
<code class="haskell">
getListFromString :: String -> Maybe [Integer]
getListFromString str = maybeRead $ "[" ++ str ++ "]"
</code>
</div>
Now to be a bit more readable, we define a function which goes like this:

If the string has the wrong format, it will return `Nothing`.
Otherwise, for example for "1,2,3", it will return `Just [1,2,3]`.

We simply test the value in our main function.

<div class="codehighlight">
<code class="haskell">
main = IO ()
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

One very important thing to note is the type of all the function used.
There is only one function which contains `IO` in its type: `main`. 
That means, all other functions are pure.

Why purity matters? As a pure function has no side effect, you can for example
evaluate its value in parallel on many different core without any problem.
And you have this by design of Haskell.

<hr/><a href="code/03_monads/01_IO/03_progressive_io_example.lhs" class="cut">03_monads/01_IO/<strong>03_progressive_io_example.lhs</strong></a>

Now how could we ask the user again and again util it enters the right answer? 

We keep this the first part:

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
Such a type means, that we retrieved a value of this type through some IO actions.
Sometimes you could see someone telling you while waving their hands: 

    "This is an `[Integer]` but inside an IO"

If you want to understand the details behind all of this, you have to continue.

Finally our main function is quite simpler:

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = do
  list <- askUser
  print $ sum list
</code>
</div>
<hr/><a href="code/03_monads/01_IO/04_progressive_io_example.lhs" class="cut">03_monads/01_IO/<strong>04_progressive_io_example.lhs</strong></a>

## `IO` trick explained.

Why did we used some strange syntax, and what exactly is this `IO` type.
It looks a bit like magic.

For now let's just forget about all the pure part of our program, and focus
on the impure part:

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

main :: IO ()
main = do
  list <- askUser
  print $ sum list
</code>
</div>
First noticiable thing: 
the structure of these function is very similar to the one of an imperative language.
The fact is, Haskell is powerful enough to recreate function to help code look like in an imperative language.
For example, if you wish you could create a `while` in Haskell.
In fact, for dealing with `IO`, imperative style is generally more appropriate.

But, you also see there are some light differences.
The notation is a bit strange.

This is here that reside the beauty of how Haskell handle IOs.

Imagine you want to write a pure language.
But, a completely pure language will have few utility in real life.
Wihout effect, you couldn't print anything on a screen, read the user input, etc...

You can imagine, in standard impure language, there is a hidden global variable.
For example, you could write something in a file.
Somebody else could modify this file.
And you could later read the content of the file.

Each time something changed in the external world, it was like a global variable had changed its value. 
This global variable can be represented as a World state.

Now, to have a pure language with some utility you could simply state the execution of your program will be an evaluation of the main function with the following type.

~~~
main :: World -> World
~~~

Which means, main instead of having a global variable accessible by all functions of you program.
Main will be given as parameter an id representing the state of the World on which you can access.
And it will certainly make some changes to it.

In reality, the real type is closer to

~~~
main :: World -> ((),World)
~~~

The `()` type is the null type.
Nothing to see here.

Now let's write our main function:

~~~
main w0 =
    let (list,w1) = askUser w0 in
    let (x,w2) = print (sum list,w1) in
    x 
~~~

Also remember, the order of evaluation is generally not fixed in Haskell.
For example in general to evaluate `f a b`, you have many choices: 

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

~~~
askUser :: World -> ([Integer],World)
~~~

The type has changed as we will modify the "World" we simulate this by
returning a world value different than the input "World" value.
This way we remain "pure" in the language. 
You could write a completely pure implementation and it will works.
In the real world, the evaluation will have some side effect each time a function
return another value of the world input.

Before:

<div class="codehighlight">
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
</div>
After:

<div class="codehighlight">
<code class="haskell">
askUser w0 =
    let (_,w1)     = putStrLn "Enter a list of numbers:"
        (input,w2) = getLine w1
        (l,w3)     = case getListFromString input of
                      Just l   -> (l,w2)
                      Nothing  -> askUser w2
    in
        (l,w3)
</code>
</div>
This is similar, but awkward. All these `let ... in`. Even if with Haskell
you could remove most, it's still awkard.

The lesson, is, naive IO implementation in Pure functional language is awkward!

Fortunately, some have found a better way to handle this problem.
We see a pattern.
Each line is of the form:

~~~
let (y,w') = action x w in
~~~

Even if for some line the first `x` argument isn't needed.
The output type is a couple, `(answer, newWorldValue)`.
Each function `f` must have a type of kind:

~~~
f :: World -> (a,World)
~~~

Not only this, but we can also remark we use them always 
with the following general pattern:

~~~
let (y,w1) = action1 x w0 in
let (z,w2) = action2 y w1 in
...
~~~

Now, we will make a magic trick. We will make the world variable "disappear".
We will `bind` the two lines. Let's define the `bind` function.

~~~
bind :: (World -> (a,World)) 
        -> (a -> (World -> (b,World))) 
        -> (World -> (b,World)) 
~~~

(World -> (a,World)) is the type for an IO action. Like getLine, printing something, etc... Now let's rename it for more clarity.

~~~
type IO a = World -> (a, World)
~~~

Some example of functions:

~~~
getLine :: IO String
print :: Show a => a -> IO ()
~~~

`getLine` is an IO action which take a world as parameter, then return a couple (String,World).
Which can be said as: `getLine` is of type IO String.
Which we also see as, an IO action which will return a String "embeded inside an IO".

The function `print` is also interresting.
It takes on argument which can be shown.
In fact it takes two arguments.
The first is the value to print and the other is the state of world.
It then return a couple of type `((),World)`. 
This means it changes the world state, but don't give anymore data.

We simplify the bind type:

~~~
bind :: IO a 
        -> (b -> IO b) 
        -> IO b
~~~

The function bind take two actions.

The type is quite intimidating. But stay with me here.
On a line like 

~~~
let (x,w1) = action1 w0 in
let (y,w2) = action2 x w1 in
(y,w2)
~~~

On the first line, action1 is of type `(World -> (a,World))`.
On the second line, action2 is of type `(a -> (World -> (b,World))`.

`bind`:

- take a function similar to all lines as first argument wich returns a `(a,World)`
- take a function with take an `a` as argument and returns a line wich return a `(b,World)`
- return a line wich returns a `(b,World)`.

~~~
(bind action1 action2) w0 =
    let (x, w1) = action1 w0
        (y, w2) = action2 x w1
    in  (y, w2)
~~~

The idea is to hide the World argument with this function. Let's go:
As example imagine if we wanted to simulate:

~~~
let (line1,w1) = getLine w0 in
let ((),w2) = print line1 in
((),w2)
~~~

Now, using the bind function:

~~~
(res,w2) = (bind getLine (\l -> print l)) w0
~~~

As print is of type (World -> ((),World)), we know res = () (null type).
If you didn't saw what was magic here, let's try with three lines this time.

~~~
let (line1,w1) = getLine w0 in
let (line2,w2) = getLine w1 in
let ((),w3) = print (line1 ++ line2) in
((),w3)
~~~

Which is equivalent to:

~~~
(res,w3) = bind getLine (\line1 ->
             bind getLine (\line2 -> 
               print (line1 ++ line2)))
~~~

Didn't you remark something?
Yes, there isn't anymore temporary World variable used anywhere!
This is _MA_. _GIC_.

We can make thinks look better. Let's call bind (>>=) which is an infix function.
Infix is like (+), 3 + 4 <=> "(+) 3 4"

~~~
(res,w3) = getLine >>=
            (\line1 -> getLine >>=
            (\line2 -> print (line1 ++ line2)))
~~~

Ho Ho Ho! Happy Christmas Everyone!
Haskell has made a syntactical sugar for us:

~~~
do
  y <- f x
  z <- g y
  t <- h y z
~~~

Is replaced by:

~~~
    (f     >>= (\y ->
     g y   >>= (\z ->
     h y z >>= (\t ->
      ...
    ))))
~~~

Which is perfect for IO.
Now we also just need a way to remove the last statement containing a World value.
Easy, just write a simple function return
