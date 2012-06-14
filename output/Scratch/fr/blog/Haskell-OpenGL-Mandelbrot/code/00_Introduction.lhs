 ## Introduction

I wanted to go further than my 
[preceding article](/Scratch/en/blog/Haskell-the-Hard-Way/) in which I introduced Haskell. 

Instead of arguing that Haskell is better, because it is functional and "Functional Programming! Yeah!", I'll give an example of what benefit
functional programming can provide.
This article is more about functional paradigm than functional language.
The code organization can be used in most imperative language.
As Haskell is designed for functional paradigm, it is easier to talk about functional paradigm using it.
In reality, in the firsts sections I use an imperative paradigm.
As you can use functional paradigm in imperative language, 
you can also use imperative paradigm in functional languages.

This article is about creating a useful program.
It can interact with the user in real time.
It uses OpenGL, a library with imperative programming foundations.
But the final code will be quite clean. 
Most of the code will remain in the pure part (no `IO`).

I believe the main audience for this article are:

- Haskell programmer looking for an OpengGL tutorial.
- People interested in program organization (programming language agnostic).
- Fractal lovers and in particular 3D fractal.
- Game programmers (any language)

I wanted to talk about something cool. 
For example I always wanted to make a Mandelbrot set explorer.
I had written a [command line Mandelbrot set generator in Haskell](http://github.com/yogsototh/mandelbrot.git).
The cool part of this utility is that it use all the cores to make the computation (it uses the `repa` package)[^001].

[^001]: Unfortunately, I couldn't make this program to work on my Mac. More precisely, I couldn't make the [DevIL](http://openil.sourceforge.net/) library work on Mac to output the image. Yes I have done a `brew install libdevil`. But even a minimal program who simply write some `jpg` didn't worked.

This time, we will display the Mandelbrot set extended in 3D using OpenGL and Haskell.
You will be able to move it using your keyboard.
This object is a Mandelbrot set in the plan (z=0),
and something nice to see in 3D.

Here is what you'll end with:

blogfigure("GoldenMandelbulb.png","The entire Mandelbulb")
blogfigure("3DMandelbulbDetail.png","A Mandelbulb detail")
blogfigure("3DMandelbulbDetail2.png","Another detail of the Mandelbulb")

And here are the intermediate steps:

blogimage("HGL_Plan.png","The parts of the article")

From the 2nd section to the 4th it will be _dirtier_ and _dirtier_.
We start cleaning everything at the 5th section.
