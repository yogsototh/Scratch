-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2012-04-30T19:17:53+02:00
en: title: Haskell Working Program
en: subtitle: An OpenGL 3D extension of the Mandelbrot set
fr: title: Un programme Haskell fonctionnel
fr: subtitle: Une extension de l'ensemble de Mandelbrot en 3D et en OpenGL
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Haskell
  - programming
  - functional
  - tutorial
-----
blogimage("HGL_Plan.png","The plan in image")

begindiv(intro)

en: %tldr A progressive real world example.
fr: %tlal Un exemple progressif de programmation avec Haskell.


> <center><hr style="width:30%;float:left;border-color:#CCCCD0;margin-top:1em"/><span class="sc"><b>Table of Content</b></span><hr style="width:30%;float:right;border-color:#CCCCD0;margin-top:1em"/></center>
> 
> * This will be replaced by the ToC
> {:toc}
>

enddiv

## Introduction

TODO: write something nice after reading.

Steps: 

1. Mandelbrot set with Haskell OpenGL
2. Mandelbrot edges
3. 3D Mandelbrot because its fun
4. Clean the code from full impure and imperative to purer and purer.
5. Refactor the code to separate nicely important parts
6. Improve efficiency

From 1 to 3 it will be _dirtier_ and _dirtier_.
At 4, we will make some order in this mess!
Hopefuly for the best!

One of the goal of this article is to show some good properties of Haskell.
In particular, how to make some real world application with a pure functional language.

I know drawing a simple mandelbrot set isn't a "real world" application. 
But the idea is not to show you a real world application which would be hard to follows, but to give you a way to pass from the pure mindset to some real world application.

To this, I will show you how should progress an application.
It is not something easy to show.
This is why, I preferred work with a program that generate some image.

In a real world application, the first constraint would be to work with some framework.
And generally an imperative one.
Also, the imperative nature of OpenGL make it the perfect choice for an example.

<hr/><a href="code/01_Introduction/hglmandel.lhs" class="cut">01_Introduction/<strong>hglmandel.lhs</strong></a>

## First version

We can consider two parts.
The first being mostly some boilerplate[^1].
The second part, contain more interesting stuff.
Even in this part, there are some necessary boilerplate. 
But it is due to the OpenGL library this time.

[^1]: Generally in Haskell you need to declare a lot of import lines.
      This is something I find annoying.
      In particular, it should be possible to create a special file, Import.hs
      which make all the necessary import for you, as you generally need them all.
      I understand why this is cleaner to force the programmer not to do so,
      but, each time I do a copy/paste, I feel something is wrong.
      I believe this concern can be generalized to the lack of namespace in Haskell.

### Let's play the song of our people

<div class="codehighlight">
<code class="haskell">
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef
</code>
</div>

For efficiency reason, I won't use the default Haskell `Complex` data type.

<div class="codehighlight">
<code class="haskell">
newtype Complex = C (Float,Float) deriving (Show,Eq)
</code>
</div>

<div class="codehighlight">
<code class="haskell">
instance Num Complex where
    fromInteger n = C (fromIntegral n,0.0)
    C (x,y) * C (z,t) = C (z*x - y*t, y*z + x*t)
    C (x,y) + C (z,t) = C (x+z, y+t)
    abs (C (x,y))     = C (sqrt (x*x + y*y),0.0)
    signum (C (x,y))  = C (signum x , 0.0)
</code>
</div>

We declare some useful functions for manipulating complex numbers:

<div class="codehighlight">
<code class="haskell">
complex :: Float -> Float -> Complex
complex x y = C (x,y)

real :: Complex -> Float
real (C (x,y))    = x

im :: Complex -> Float
im   (C (x,y))    = y

magnitude :: Complex -> Float
magnitude = real.abs
</code>
</div>

### Let us start

Well, up until here we didn't made something useful.
Just a lot of boilerplate and default value.
Sorry but it is not completely the end.
We start by giving the main architecture of our program:

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = do
  -- GLUT need to be initialized
  (progname,_) <- getArgsAndInitialize
  -- We will use the double buffered mode (GL constraint)
  initialDisplayMode $= [DoubleBuffered]
  -- We create a window with some title
  createWindow "Mandelbrot Set with Haskell and OpenGL"
  -- Each time we will need to update the display
  -- we will call the function 'display'
  displayCallback $= display
  -- We enter the main loop
  mainLoop
</code>
</div>

The only interesting part is we declared that the function `display` will be used to render the graphics:

<div class="codehighlight">
<code class="haskell">
display = do
  clear [ColorBuffer] -- make the window black
  loadIdentity -- reset any transformation
  preservingMatrix drawMandelbrot
  swapBuffers -- refresh screen
</code>
</div>

Also here, there is only one interesting part, 
the draw will occurs in the function `drawMandelbrot`.

Now we must speak a bit about how OpenGL works.
We said that OpenGL is imperative by design.
In fact, you must write the list of actions in the right order.
No easy parallel drawing here.
Here is the function which will render something on the screen:

<div class="codehighlight">
<code class="haskell">
drawMandelbrot =
  -- We will print Points (not triangles for example) 
  renderPrimitive Points $ do
    mapM_ drawColoredPoint allPoints
  where
      drawColoredPoint (x,y,c) = do
          color c -- set the current color to c
          -- then draw the point at position (x,y,0)
          -- remember we're in 3D
          vertex $ Vertex3 x y 0 
</code>
</div>

The `mapM_` function is mainly the same as map but inside a monadic context.
More precisely, this can be transformed as a list of actions where the order is important:

~~~
drawMandelbrot = 
  renderPrimitive Points $ do
    color color1
    vertex $ Vertex3 x1 y1 0
    ...
    color colorN
    vertex $ Vertex3 xN yN 0
~~~

We also need some kind of global variables. 
In fact, global variable are a proof of some bad design. 
But remember it is our first try:

<div class="codehighlight">
<code class="haskell">
width = 320 :: GLfloat
height = 320 :: GLfloat
</code>
</div>

And of course our list of colored points.
In OpenGL the default coordinate are from -1 to 1.

<div class="codehighlight">
<code class="haskell">
allPoints :: [(GLfloat,GLfloat,Color3 GLfloat)]
allPoints = [ (x/width,y/height,colorFromValue $ mandel x y) | 
                  x <- [-width..width], 
                  y <- [-height..height]]

</code>
</div>

We need a function which transform an integer value to some color:

<div class="codehighlight">
<code class="haskell">
colorFromValue n =
  let 
      t :: Int -> GLfloat
      t i = 0.5 + 0.5*cos( fromIntegral i / 10 )
  in
    Color3 (t n) (t (n+5)) (t (n+10))
</code>
</div>

And now the mandel function. 
Given two coordinates in pixels, it returns some integer value:

<div class="codehighlight">
<code class="haskell">
mandel x y = 
  let r = 2.0 * x / width
      i = 2.0 * y / height
  in
      f (complex r i) 0 64
</code>
</div>

It uses the main mandelbrot function for each complex \\(c\\).
The mandelbrot set is the set of complex number c such that the following sequence does not escape to infinity.

Let us define \\(f_c: \mathbb{C} \to \mathbb{C}\\)

$$ f_c(z) = z^2 + c $$

The sequence is: 

$$ 0 \rightarrow f_c(0) \rightarrow f_c(f_c(0)) \rightarrow \cdots \rightarrow f^n_c(0) \rightarrow \cdots $$

Of course, instead of trying to test the real limit, we just make a test after a finite number of occurrences.

<div class="codehighlight">
<code class="haskell">
f :: Complex -> Complex -> Int -> Int
f c z 0 = 0
f c z n = if (magnitude z > 2 ) 
          then n
          else f c ((z*z)+c) (n-1)
</code>
</div>

Well, if you download this lhs file, compile it and run it this is the result:

blogimage("hglmandel_v01.png","The mandelbrot set version 1")

A first very interesting property of this program is that the computation for all the points is done only once.
The proof is that it might be a bit long before a first image appears, but if you resize the window, it updates instantaneously.
This property is a direct consequence of purity.
If you look closely, you see that `allPoints` is a pure list.
Therefore, calling `allPoints` will always render the same result.
While Haskell doesn't garbage collect `allPoints` the result is reused for free.
We didn't specified this value should be saved for later use. 
It is saved for us.

See what occurs if we make the window bigger:

blogimage("hglmandel_v01_too_wide.png","The mandelbrot too wide, black lines and columns")

Yep, we see some black lines.
Why? Simply because we drawn less point than there is on the surface.
We can repair this by drawing little squares instead of just points.
But, instead we will do something a bit different and unusual.

<a href="code/01_Introduction/hglmandel.lhs" class="cut">01_Introduction/<strong>hglmandel.lhs</strong> </a>

<hr/><a href="code/02_Edges/HGLMandelEdge.lhs" class="cut">02_Edges/<strong>HGLMandelEdge.lhs</strong></a>

## Only the edges

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef
newtype Complex = C (Float,Float) deriving (Show,Eq)
instance Num Complex where
    fromInteger n = C (fromIntegral n,0.0)
    C (x,y) * C (z,t) = C (z*x - y*t, y*z + x*t)
    C (x,y) + C (z,t) = C (x+z, y+t)
    abs (C (x,y))     = C (sqrt (x*x + y*y),0.0)
    signum (C (x,y))  = C (signum x , 0.0)
complex :: Float -> Float -> Complex
complex x y = C (x,y)

real :: Complex -> Float
real (C (x,y))    = x

im :: Complex -> Float
im   (C (x,y))    = y

magnitude :: Complex -> Float
magnitude = real.abs
main :: IO ()
main = do
  -- GLUT need to be initialized
  (progname,_) <- getArgsAndInitialize
  -- We will use the double buffered mode (GL constraint)
  initialDisplayMode $= [DoubleBuffered]
  -- We create a window with some title
  createWindow "Mandelbrot Set with Haskell and OpenGL"
  -- Each time we will need to update the display
  -- we will call the function 'display'
  displayCallback $= display
  -- We enter the main loop
  mainLoop
display = do
   -- set the background color (dark solarized theme)
  clearColor $= Color4 0 0.1686 0.2117 1
  clear [ColorBuffer] -- make the window black
  loadIdentity -- reset any transformation
  preservingMatrix drawMandelbrot
  swapBuffers -- refresh screen

width = 320 :: GLfloat
height = 320 :: GLfloat
</code>
</div>

</div>

This time, instead of drawing all points, I'll simply want to draw the edges of the Mandelbrot set.
We change slightly the drawMandelbrot function.
We replace the `Points` by `LineLoop`

<div class="codehighlight">
<code class="haskell">
drawMandelbrot =
  -- We will print Points (not triangles for example) 
  renderPrimitive LineLoop $ do
    mapM_ drawColoredPoint allPoints
  where
      drawColoredPoint (x,y,c) = do
          color c -- set the current color to c
          -- then draw the point at position (x,y,0)
          -- remember we're in 3D
          vertex $ Vertex3 x y 0 
</code>
</div>

And now, we should change our list of points.
Instead of drawing every point of the visible surface, 
we will choose only point on the surface.

<div class="codehighlight">
<code class="haskell">
allPoints = positivePoints ++ 
      map (\(x,y,c) -> (x,-y,c)) (reverse positivePoints)
</code>
</div>

We only need to compute the positive point.
The mandelbrot set is symetric on the abscisse axis.

<div class="codehighlight">
<code class="haskell">
positivePoints :: [(GLfloat,GLfloat,Color3 GLfloat)]
positivePoints = do
              x <- [-width..width]
              let y = findMaxOrdFor (mandel x) 0 height 10 -- log height
              if y < 1 -- We don't draw point in the absciss
                 then []
                 else return (x/width,y/height,colorFromValue $ mandel x y)
</code>
</div>

This function is interresting. 
For those not used to the list monad here is a natural language version of this function:

~~~
positivePoints =
    for all x in the range [-width..width]
    let y be smallest number s.t. mandel x y > 0
    if y is on 0 then don't return a point
    else return the value corresonding to (x,y,color for (x+iy))
~~~

In fact using the list monad you write like if you consider only one element at a time and the computation is done non deterministically.
To find the smallest number such that mandel x y > 0 we create a simple dichotomic search:

<div class="codehighlight">
<code class="haskell">
findMaxOrdFor func minval maxval 0 = (minval+maxval)/2
findMaxOrdFor func minval maxval n = 
  if (func medpoint) /= 0 
       then findMaxOrdFor func minval medpoint (n-1)
       else findMaxOrdFor func medpoint maxval (n-1)
  where medpoint = (minval+maxval)/2
</code>
</div>

No rocket science here.
I know, due to the fact the mandelbrot set is not convex this approach does some errors. But the approximation will be good enough.
See the result now:

blogimage("HGLMandelEdges.png","The edges of the mandelbrot set")

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
colorFromValue n =
  let 
      t :: Int -> GLfloat
      t i = 0.5 + 0.5*cos( fromIntegral i / 10 )
  in
    Color3 (t n) (t (n+5)) (t (n+10))
</code>
</div>

<div class="codehighlight">
<code class="haskell">
mandel x y = 
  let r = 2.0 * x / width
      i = 2.0 * y / height
  in
      f (complex r i) 0 64
</code>
</div>

<div class="codehighlight">
<code class="haskell">
f :: Complex -> Complex -> Int -> Int
f c z 0 = 0
f c z n = if (magnitude z > 2 ) 
          then n
          else f c ((z*z)+c) (n-1)
</code>
</div>

</div>

<a href="code/02_Edges/HGLMandelEdge.lhs" class="cut">02_Edges/<strong>HGLMandelEdge.lhs</strong> </a>

<hr/><a href="code/03_Mandelbulb/Mandelbulb.lhs" class="cut">03_Mandelbulb/<strong>Mandelbulb.lhs</strong></a>

## 3D Mandelbrot?

Why only draw the edge? 
It is clearly not as nice as drawing the complete surface.
Yeah, I know, but, as we use OpenGL, why not show something in 3D.

But, complex number are only in 2D and there is no 3D equivalent to complex.
In fact, the only extension known are quaternions, 4D.
As I know almost nothing about quaternions, I will use some extended complex.
I am pretty sure this construction is not useful for numbers.
But it will be enough for us to create something nice.

As there is a lot of code, I'll give a high level view to what occurs:

 > - OpenGL Boilerplate
 >  
 >   - set some IORef for states  
 >   - Drawing: 
 > 
 >      - set doubleBuffer, handle depth, window size...
 >      - Use state to apply some transformations
 >  
 >   - Keyboard: hitting some key change the state of IORef
 > 
 > - Generate 3D Object
 >
 >   ~~~ 
 >   allPoints :: [ColoredPoint]  
 >   allPoints =
 >       for all (x,y), -width<x<width, 0<y<height
 >       Let z be the minimal depth such that
 >           mandel x y z > 0
 >       add the points 
 >              (x, y, z,color) 
 >              (x,-y, z,color) 
 >              (x, y,-z,color) 
 >              (x,-y,-z,color) 
 >           + neighbors to make triangles
 >   ~~~

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef
type ColoredPoint = (GLfloat,GLfloat,GLfloat,Color3 GLfloat)
</code>
</div>

</div>

We declare a new type `ExtComplex` (for exttended complex). 
An extension of complex numbers:

<div class="codehighlight">
<code class="haskell">
data ExtComplex = C (GLfloat,GLfloat,GLfloat) 
                  deriving (Show,Eq)
instance Num ExtComplex where
    -- The shape of the 3D mandelbrot 
    -- will depend on this formula
    C (x,y,z) * C (x',y',z') = C (x*x' - y*y' - z*z', 
                                  x*y' + y*x' + z*z', 
                                  x*z' + z*x' )
    -- The rest is straightforward
    fromInteger n = C (fromIntegral n, 0, 0)
    C (x,y,z) + C (x',y',z') = C (x+x', y+y', z+z')
    abs (C (x,y,z))     = C (sqrt (x*x + y*y + z*z), 0, 0)
    signum (C (x,y,z))  = C (signum x, 0, 0)
</code>
</div>

The most important part is the new multiplication instance.
Modifying this formula will change radically the shape of this somehow 3D mandelbrot.

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
extcomplex :: GLfloat -> GLfloat -> GLfloat -> ExtComplex
extcomplex x y z = C (x,y,z)

real :: ExtComplex -> GLfloat
real (C (x,y,z))    = x

im :: ExtComplex -> GLfloat
im   (C (x,y,z))    = y

strange :: ExtComplex -> GLfloat
strange (C (x,y,z)) = z

magnitude :: ExtComplex -> GLfloat
magnitude = real.abs
</code>
</div>

</div>

As we will use some 3D, we add some new directive in the boilerplate.
But mainly, we simply state that will use some depth buffer.
And also we will listen the keyboard.

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = do
  -- GLUT need to be initialized
  (progname,_) <- getArgsAndInitialize
  -- We will use the double buffered mode (GL constraint)
  -- We also Add the DepthBuffer (for 3D)
  initialDisplayMode $= 
      [WithDepthBuffer,DoubleBuffered,RGBMode]
  -- We create a window with some title
  createWindow "3D HOpengGL Mandelbrot"
  -- We add some directives
  depthFunc  $= Just Less
  -- matrixMode $= Projection
  windowSize $= Size 500 500
  -- Some state variables (I know it feels BAD)
  angle   <- newIORef ((35,0)::(GLfloat,GLfloat))
  zoom    <- newIORef (2::GLfloat)
  campos  <- newIORef ((0.7,0)::(GLfloat,GLfloat))
  -- Action to call when waiting
  idleCallback $= Just idle
  -- We will use the keyboard
  keyboardMouseCallback $= 
          Just (keyboardMouse angle zoom campos)
  -- Each time we will need to update the display
  -- we will call the function 'display'
  -- But this time, we add some parameters
  displayCallback $= display angle zoom campos
  -- We enter the main loop
  mainLoop
</code>
</div>

The `idle` function necessary for animation.

<div class="codehighlight">
<code class="haskell">
idle = postRedisplay Nothing
</code>
</div>

We introduce some helper function to manipulate
standard `IORef`.

<div class="codehighlight">
<code class="haskell">
modVar v f = do
  v' <- get v
  v $= (f v')
mapFst f (x,y) = (f x,  y)
mapSnd f (x,y) = (  x,f y)
</code>
</div>

And we use them to code the function handling keyboard.
We will use the keys `hjkl` to rotate, 
`oi` to zoom and `sedf` to move.
Also, hitting space will reset the view.

<div class="codehighlight">
<code class="haskell">
keyboardMouse angle zoom pos key state modifiers position =
  kact angle zoom pos key state
  where 
    -- reset view when hitting space
    kact a z p (Char ' ') Down = do
          a $= (0,0)
          z $= 1
          p $= (0,0)
    -- use of hjkl to rotate
    kact a _ _ (Char 'h') Down = modVar a (mapFst (+0.5))
    kact a _ _ (Char 'l') Down = modVar a (mapFst (+(-0.5)))
    kact a _ _ (Char 'j') Down = modVar a (mapSnd (+0.5))
    kact a _ _ (Char 'k') Down = modVar a (mapSnd (+(-0.5)))
    -- use o and i to zoom
    kact _ s _ (Char 'o') Down = modVar s (*1.1)
    kact _ s _ (Char 'i') Down = modVar s (*0.9)
    -- use sdfe to move the camera
    kact _ _ p (Char 's') Down = modVar p (mapFst (+0.1))
    kact _ _ p (Char 'f') Down = modVar p (mapFst (+(-0.1)))
    kact _ _ p (Char 'd') Down = modVar p (mapSnd (+0.1))
    kact _ _ p (Char 'e') Down = modVar p (mapSnd (+(-0.1)))
    -- any other keys does nothing
    kact _ _ _ _ _ = return ()
</code>
</div>

Now, we will show the object using the display function.
Note, this time, display take some parameters.
Mainly, this function if full of boilerplate:

<div class="codehighlight">
<code class="haskell">
display angle zoom position = do
   -- set the background color (dark solarized theme)
  clearColor $= Color4 0 0.1686 0.2117 1
  clear [ColorBuffer,DepthBuffer]
  -- Transformation to change the view
  loadIdentity -- reset any transformation
  -- tranlate
  (x,y) <- get position
  translate $ Vector3 x y 0 
  -- zoom
  z <- get zoom
  scale z z z
  -- rotate
  (xangle,yangle) <- get angle
  rotate xangle $ Vector3 1.0 0.0 (0.0::GLfloat)
  rotate yangle $ Vector3 0.0 1.0 (0.0::GLfloat)
  -- Now that all transformation were made
  -- We create the object(s)
  preservingMatrix drawMandelbrot
  swapBuffers -- refresh screen
</code>
</div>

Not much to say about this function.
Mainly there are two parts: apply some transformations, draw the object.

### The 3D Mandelbrot

Now, that we talked about the OpenGL part, let's talk about how we 
generate the 3D points and colors.
First, we will set the number of detatils to 180 pixels in the three dimensions.

<div class="codehighlight">
<code class="haskell">
nbDetails = 200 :: GLfloat
width  = nbDetails
height = nbDetails
deep   = nbDetails
</code>
</div>

This time, instead of just drawing some line or some group of points,
we will show triangles.
The idea is that we should provide points three by three.

<div class="codehighlight">
<code class="haskell">
drawMandelbrot = do
  -- We will print Points (not triangles for example) 
  renderPrimitive Triangles $ do
    mapM_ drawColoredPoint allPoints
  where
      drawColoredPoint (x,y,z,c) = do
          color c
          vertex $ Vertex3 x y z
</code>
</div>

Now instead of providing only one point at a time, we will provide six ordered points. 
These points will be used to draw two triangles.

blogimage("triangles.png","Explain triangles")

Note in 3D the depth of the point is generally different.
The next function is a bit long. 
An approximative English version is:

~~~
forall x from -width to width
  forall y from -height to height
    forall the neighbors of (x,y)
      let z be the smalled depth such that (mandel x y z)>0
      let c be the color given by mandel x y z 
      add the point corresponding to (x,y,z,c)
~~~

Also, I added a test to hide points too far from the border.
In fact, this function show points close to the surface of the modified mandelbrot set. But not the mandelbrot set itself.

<code class="haskell">
depthPoints :: [ColoredPoint]
depthPoints = do
  x <- [-width..width]
  y <- [-height..height]
  let 
      depthOf x' y' = findMaxOrdFor (mandel x' y') 0 deep 7
      z1 = depthOf    x     y
      z2 = depthOf (x+1)    y
      z3 = depthOf (x+1) (y+1)
      z4 = depthOf    x  (y+1)
      c1 = mandel    x     y  (z1+1)
      c2 = mandel (x+1)    y  (z2+1)
      c3 = mandel (x+1) (y+1) (z3+1)
      c4 = mandel    x  (y+1) (z4+1)
      p1 = (   x /width,   y /height, z1/deep,colorFromValue c1)
      p2 = ((x+1)/width,   y /height, z2/deep,colorFromValue c2)
      p3 = ((x+1)/width,(y+1)/height, z3/deep,colorFromValue c3)
      p4 = (   x /width,(y+1)/height, z4/deep,colorFromValue c4)
  if (and $ map (>=57) [c1,c2,c3,c4])
  then []
  else [p1,p2,p3,p1,p3,p4]
</code>

If you look at the function above, you see a lot of common patterns.
Haskell is very efficient to make this better.
Here is a somehow less readable but more generic refactored function:

<div class="codehighlight">
<code class="haskell">
depthPoints :: [ColoredPoint]
depthPoints = do
  x <- [-width..width]
  y <- [0..height]
  let 
    neighbors = [(x,y),(x+1,y),(x+1,y+1),(x,y+1)]
    depthOf (u,v) = findMaxOrdFor (mandel u v) 0 deep 7
    -- zs are 3D points with found depth
    zs = map (\(u,v) -> (u,v,depthOf (u,v))) neighbors
    -- ts are 3D pixels + mandel value
    ts = map (\(u,v,w) -> (u,v,w,mandel u v (w+1))) zs
    -- ps are 3D opengl points + color value
    ps = map (\(u,v,w,c') -> 
        (u/width,v/height,w/deep,colorFromValue c')) ts
  -- If the point diverged too fast, don't display it
  if (and $ map (\(_,_,_,c) -> c>=57) ts)
  then []
  -- Draw two triangles
  else [ps!!0,ps!!1,ps!!2,ps!!0,ps!!2,ps!!3]
</code>
</div>

If you prefer the first version, then just imagine how hard it will be to change the enumeration of the point from (x,y) to (x,z) for example.

Also, we didn't searched for negative values. 
For simplicity, I mirror these values. 
I haven't even tested if this modified mandelbrot is symetric relatively to the plan {(x,y,z)|z=0}.

<div class="codehighlight">
<code class="haskell">
allPoints :: [ColoredPoint]
allPoints = planPoints ++ map inverseDepth  planPoints
  where 
      planPoints = depthPoints ++ map inverseHeight depthPoints
      inverseHeight (x,y,z,c) = (x,-y,z,c)
      inverseDepth (x,y,z,c) = (x,y,-z+1/deep,c)
</code>
</div>

I cheat by making these symmetry.
But it is faster and render a nice form.
For this tutorial it will be good enough.
Also, the dichotomic method I use is mostly right but false for some cases.

The rest of the program is very close to the preceeding one.

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
findMaxOrdFor func minval maxval 0 = (minval+maxval)/2
findMaxOrdFor func minval maxval n = 
  if (func medpoint) /= 0 
       then findMaxOrdFor func minval medpoint (n-1)
       else findMaxOrdFor func medpoint maxval (n-1)
  where medpoint = (minval+maxval)/2
</code>
</div>

I made the color slightly brighter

<div class="codehighlight">
<code class="haskell">
colorFromValue n =
  let 
      t :: Int -> GLfloat
      t i = 0.7 + 0.3*cos( fromIntegral i / 10 )
  in
    Color3 (t n) (t (n+5)) (t (n+10))
</code>
</div>

We only changed from `Complex` to `ExtComplex` of the main `f` function.

<div class="codehighlight">
<code class="haskell">
f :: ExtComplex -> ExtComplex -> Int -> Int
f c z 0 = 0
f c z n = if (magnitude z > 2 ) 
          then n
          else f c ((z*z)+c) (n-1)
</code>
</div>

</div>

We simply add a new dimenstion to the mandel function. Also we simply need to change the type signature of the function `f` from `Complex` to `ExtComplex`.

<div class="codehighlight">
<code class="haskell">
mandel x y z = 
  let r = 2.0 * x / width
      i = 2.0 * y / height
      s = 2.0 * z / deep
  in
      f (extcomplex r i s) 0 64
</code>
</div>

And here is the result (if you use 500 for `nbDetails`):

blogimage("mandelbrot_3D.png","A 3D mandelbrot like")

This image is quite nice.

<a href="code/03_Mandelbulb/Mandelbulb.lhs" class="cut">03_Mandelbulb/<strong>Mandelbulb.lhs</strong> </a>

<hr/><a href="code/04_Mandelbulb/Mandelbulb.lhs" class="cut">04_Mandelbulb/<strong>Mandelbulb.lhs</strong></a>

## Cleaning the code

The first thing to do is to separate the GLUT/OpenGL 
part from the computation of the shape.
Here is the cleaned version of the preceeding section.
Most boilerplate was put in external files.

- [`YBoiler.hs`](code/04_Mandelbulb/YBoiler.hs), the 3D rendering
- [`Mandel`](code/04_Mandelbulb/Mandel.hs), the mandel function
- [`ExtComplex`](code/04_Mandelbulb/ExtComplex.hs), the extended complexes

<div class="codehighlight">
<code class="haskell">
import YBoiler -- Most the OpenGL Boilerplate
import Mandel -- The 3D Mandelbrot maths
</code>
</div>

The `yMainLoop` takes two arguments:
the title of the window 
and a function from time to triangles

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = yMainLoop "3D Mandelbrot" (\_ -> allPoints)
</code>
</div>

We set some global constant (this is generally bad).

<div class="codehighlight">
<code class="haskell">
nbDetails = 200 :: GLfloat
width  = nbDetails
height = nbDetails
deep   = nbDetails
</code>
</div>

We then generate colored points from our function.
This is similar to the preceding section.

<div class="codehighlight">
<code class="haskell">
allPoints :: [ColoredPoint]
allPoints = planPoints ++ map inverseDepth  planPoints
  where 
      planPoints = depthPoints ++ map inverseHeight depthPoints
      inverseHeight (x,y,z,c) = (x,-y,z,c)
      inverseDepth (x,y,z,c) = (x,y,-z+1/deep,c)
</code>
</div>

<div class="codehighlight">
<code class="haskell">
depthPoints :: [ColoredPoint]
depthPoints = do
  x <- [-width..width]
  y <- [0..height]
  let 
    neighbors = [(x,y),(x+1,y),(x+1,y+1),(x,y+1)]
    depthOf (u,v) = findMaxOrdFor (ymandel u v) 0 deep 7
    -- zs are 3D points with found depth
    zs = map (\(u,v) -> (u,v,depthOf (u,v))) neighbors
    -- ts are 3D pixels + mandel value
    ts = map (\(u,v,w) -> (u,v,w,ymandel u v (w+1))) zs
    -- ps are 3D opengl points + color value
    ps = map (\(u,v,w,c') -> 
        (u/width,v/height,w/deep,colorFromValue c')) ts
  -- If the point diverged too fast, don't display it
  if (and $ map (\(_,_,_,c) -> c>=57) ts)
  then []
  -- Draw two triangles
  else [ps!!0,ps!!1,ps!!2,ps!!0,ps!!2,ps!!3]

findMaxOrdFor func minval maxval 0 = (minval+maxval)/2
findMaxOrdFor func minval maxval n = 
  if (func medpoint) /= 0 
       then findMaxOrdFor func minval medpoint (n-1)
       else findMaxOrdFor func medpoint maxval (n-1)
  where medpoint = (minval+maxval)/2

colorFromValue n =
  let 
      t :: Int -> GLfloat
      t i = 0.7 + 0.3*cos( fromIntegral i / 10 )
  in
    ((t n),(t (n+5)),(t (n+10)))

ymandel x y z = mandel (2*x/width) (2*y/height) (2*z/deep) 64
</code>
</div>

This code is cleaner but many things doesn't feel right.
First, all the user interaction code is outside our main file.
I feel it is okay to hide the detail for the rendering.
But I would have preferred to control the user actions.

On the other hand, we continue to handle a lot rendering details.
For example, we provide ordered vertices.
I feel, this should be externalized.

I would have preferred to make things a bit more general.

<a href="code/04_Mandelbulb/Mandelbulb.lhs" class="cut">04_Mandelbulb/<strong>Mandelbulb.lhs</strong> </a>

<hr/><a href="code/05_Mandelbulb/Mandelbulb.lhs" class="cut">05_Mandelbulb/<strong>Mandelbulb.lhs</strong></a>

## Functional organization?

Some points:

1. OpenGL and GLUT are linked to the C library.
   In particular the `mainLoop` function is a direct link to the C library (FFI).
   This function if so far from the pure spirit of functional languages.
   Could we make this better?
   We will have two choices, or create our own `mainLoop` function to make it more functional.
   Or deal with the imperative nature of the GLUT `mainLoop` function.
   As a goal of this article is to understand how to deal with existing library and particularly the one coming from imperative language we will continue to use the `mainLoop` function.
2. Or main problem come from user interaction.
   If you ask the Internet, about how to deal with user interaction with a functional paradigm, the main answer is to use _functional reactive programming_ (FRP).
   I read very few about FRP, and I might be completely wrong when I say that it is about creating a DSL where atoms are time functions.
   While I'm writing these lines, I don't know if I'll do something looking close to that.
   For now I'll simply try to resolve the first problem.

Then here is how I imagine things should go.
First, what the main loop should look like:

<code class="haskell">
functionalMainLoop =
    Read user inputs and provide a list of actions
    Apply all actions to the World
    Display one frame 
    repetere aeternum
</code>

Clearly, ideally we should provide only three parameters to this main loop function:

- an initial World state
- a mapping between the user interaction and function which modify the world
- a function taking two parameters: time and world state and render a new world without user interaction.

Here is a real working code, I've hidden most display functions.
The YGL, is a kind of framework to display 3D functions.
But it can easily be extended to many kind of representation.

<div class="codehighlight">
<code class="haskell">
import YGL -- Most the OpenGL Boilerplate
import Mandel -- The 3D Mandelbrot maths
</code>
</div>

We first set the mapping between user input and actions.
The type of each couple should be of the form
`(user input, f)` where (in a first time) `f:World -> World`.
It means, the user input will transform the world state.

<div class="codehighlight">
<code class="haskell">
-- Centralize all user input interaction
inputActionMap :: InputMap World
inputActionMap = inputMapFromList [
     (Press 'k' , rotate xdir 5)
    ,(Press 'i' , rotate xdir (-5))
    ,(Press 'j' , rotate ydir 5)
    ,(Press 'l' , rotate ydir (-5))
    ,(Press 'o' , rotate zdir 5)
    ,(Press 'u' , rotate zdir (-5))
    ,(Press 'f' , translate xdir 0.1)
    ,(Press 's' , translate xdir (-0.1))
    ,(Press 'e' , translate ydir 0.1)
    ,(Press 'd' , translate ydir (-0.1))
    ,(Press 'z' , translate zdir 0.1)
    ,(Press 'r' , translate zdir (-0.1))
    ,(Press '+' , zoom 1.1)
    ,(Press '-' , zoom (1/1.1))
    ,(Press 'h' , resize 1.2)
    ,(Press 'g' , resize (1/1.2))
    ]
</code>
</div>

And of course a type design the World State. 
The important part is that it is our World State type.
We could have used any kind of data type.

<div class="codehighlight">
<code class="haskell">
-- I prefer to set my own name for these types
data World = World {
      angle       :: Point3D
    , scale       :: Scalar
    , position    :: Point3D
    , shape       :: Scalar -> Function3D
    , box         :: Box3D
    , told        :: Time -- last frame time
    } 
</code>
</div>

The important part to glue our own type to the framework
is to make our type an instance of the type class `DisplayableWorld`.
We simply have to provide the definition of some functions.

<div class="codehighlight">
<code class="haskell">
instance DisplayableWorld World where
  winTitle _ = "The YGL Mandelbulb"
  camera w = Camera {
        camPos = position w, 
        camDir = angle w,
        camZoom = scale w }
  objects w = [XYFunc ((shape  w) res) defbox]
              where
                  res = resolution $ box w
                  defbox = box w
</code>
</div>

The `camera` function will retrieve an object of type `Camera` which contains
most necessary information to set our camera.
The `objects` function will returns a list of objects. 
Their type is `YObject`. Note the generation of triangles is no more in this file.
Until here we only used declarative pattern.

We also need to set all our transformation functions.
These function are used to update the world state.

<div class="codehighlight">
<code class="haskell">
xdir :: Point3D
xdir = makePoint3D (1,0,0)
ydir :: Point3D
ydir = makePoint3D (0,1,0)
zdir :: Point3D
zdir = makePoint3D (0,0,1)
</code>
</div>

Note `(-*<)` is scalar product.
Also note we could add Point3D as numbers. 

<div class="codehighlight">
<code class="haskell">
rotate :: Point3D -> Scalar -> World -> World
rotate dir angleValue world = 
  world {
     angle = (angle world) + (angleValue -*< dir) }

translate :: Point3D -> Scalar -> World -> World
translate dir len world = 
  world {
    position = (position world) + (len -*< dir) }

zoom :: Scalar -> World -> World
zoom z world = world {
    scale = z * scale world }

resize :: Scalar -> World -> World
resize r world = world {
    box = (box world) {
     resolution = sqrt ((resolution (box world))**2 * r) }}
</code>
</div>

The resize is used to generate the 3D function.
As I wanted the time spent to generate a more detailed view 
to grow linearly I use this not so straightforward formula.

The `yMainLoop` takes three arguments.

- A map between user Input and world transformation
- A timed world transformation
- An initial world state

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = yMainLoop inputActionMap idleAction initialWorld
</code>
</div>

Here is our initial world state.

<div class="codehighlight">
<code class="haskell">
-- We initialize the world state
-- then angle, position and zoom of the camera
-- And the shape function
initialWorld :: World
initialWorld = World {
   angle = makePoint3D (-30,-30,0)
 , position = makePoint3D (0,0,0)
 , scale = 0.8
 , shape = shapeFunc 
 , box = Box3D { minPoint = makePoint3D (-2,-2,-2)
               , maxPoint =  makePoint3D (2,2,2)
               , resolution =  0.16 }
 , told = 0
 }
</code>
</div>

We will define `shapeFunc` later.
Here is the function which transform the world even without user action.
Mainly it makes some rotation.

<div class="codehighlight">
<code class="haskell">
idleAction :: Time -> World -> World
idleAction tnew world = world {
    angle = (angle world) + (delta -*< zdir)
  , told = tnew
  }
  where 
      anglePerSec = 5.0
      delta = anglePerSec * elapsed / 1000.0
      elapsed = fromIntegral (tnew - (told world))
</code>
</div>

Now the function which will generate points in 3D.
The first parameter (`res`) is the resolution of the vertex generation.
More precisely, `res` is distance between two points on one direction.
We need it to "close" our shape.

The type `Function3D` is `Point -> Point -> Maybe Point`.
Because we consider partial functions
(for some `(x,y)` our function can be undefined).

<div class="codehighlight">
<code class="haskell">
shapeFunc :: Scalar -> Function3D
shapeFunc res x y = 
  let 
      z = findMaxOrdFor (ymandel x y) 0 1 20
  in
  if and [ findMaxOrdFor (ymandel (x+xeps) (y+yeps)) 0 1 20 < 0.000001 |
              val <- [res], xeps <- [-val,val], yeps<-[-val,val]]
      then Nothing 
      else Just (z,colorFromValue ((ymandel x y z) * 64))
</code>
</div>

With the color function.

<div class="codehighlight">
<code class="haskell">
colorFromValue :: Point -> Color
colorFromValue n =
  let 
      t :: Point -> Scalar
      t i = 0.7 + 0.3*cos( i / 10 )
  in
    makeColor (t n) (t (n+5)) (t (n+10))
</code>
</div>

The rest is similar to the preceding sections.

<div class="codehighlight">
<code class="haskell">
findMaxOrdFor :: (Fractional a,Num a,Num b,Eq b) => 
                 (a -> b) -> a -> a -> Int -> a
findMaxOrdFor _ minval maxval 0 = (minval+maxval)/2
findMaxOrdFor func minval maxval n = 
  if func medpoint /= 0 
       then findMaxOrdFor func minval medpoint (n-1)
       else findMaxOrdFor func medpoint maxval (n-1)
  where medpoint = (minval+maxval)/2

ymandel :: Point -> Point -> Point -> Point
ymandel x y z = fromIntegral (mandel x y z 64) / 64
</code>
</div>

I won't put how the magic occurs directly here.
But all the magic occurs in the file `YGL.hs`.
This file is commented a lot.

- [`YGL.hs`](code/05_Mandelbulb/YGL.hs), the 3D rendering framework
- [`Mandel`](code/05_Mandelbulb/Mandel.hs), the mandel function
- [`ExtComplex`](code/05_Mandelbulb/ExtComplex.hs), the extended complexes

<a href="code/05_Mandelbulb/Mandelbulb.lhs" class="cut">05_Mandelbulb/<strong>Mandelbulb.lhs</strong> </a>

<hr/><a href="code/06_Mandelbulb/Mandelbulb.lhs" class="cut">06_Mandelbulb/<strong>Mandelbulb.lhs</strong></a>

## Optimization

All feel good from the architecture point of vue.
More precisely, the separation between rendering and world behavior is clear.
But this is extremely slow now.
Because we compute the mandelbulb for each frame now.

Before we had

   Constant Function -> Constant List of Triangles -> Display

Now we have 

    World -> Function -> List of Objects -> Atoms -> Display

And the World state could change. 
Then it is no more straightforward for the compiler to understand
when not to recompute the entire list of atoms.

Then to optimize we will have to make things a little less separate.
We must control the flow of atom generation.

Mostly the program is the same as before, but instead of providing a 
function, we will provide the list of atoms directly.

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
import YGL -- Most the OpenGL Boilerplate
import Mandel -- The 3D Mandelbrot maths

-- Centralize all user input interaction
inputActionMap :: InputMap World
inputActionMap = inputMapFromList [
     (Press 'k' , rotate xdir 5)
    ,(Press 'i' , rotate xdir (-5))
    ,(Press 'j' , rotate ydir 5)
    ,(Press 'l' , rotate ydir (-5))
    ,(Press 'o' , rotate zdir 5)
    ,(Press 'u' , rotate zdir (-5))
    ,(Press 'f' , translate xdir 0.1)
    ,(Press 's' , translate xdir (-0.1))
    ,(Press 'e' , translate ydir 0.1)
    ,(Press 'd' , translate ydir (-0.1))
    ,(Press 'z' , translate zdir 0.1)
    ,(Press 'r' , translate zdir (-0.1))
    ,(Press '+' , zoom 1.1)
    ,(Press '-' , zoom (1/1.1))
    ,(Press 'h' , resize 1.2)
    ,(Press 'g' , resize (1/1.2))
    ]
</code>
</div>

</div>

<div class="codehighlight">
<code class="haskell">
data World = World {
      angle       :: Point3D
    , scale       :: Scalar
    , position    :: Point3D
    , box         :: Box3D
    , told        :: Time 
    -- We replace shape by cache
    , cache       :: [YObject]
    } 
</code>
</div>

<div class="codehighlight">
<code class="haskell">
instance DisplayableWorld World where
  winTitle _ = "The YGL Mandelbulb"
  camera w = Camera {
        camPos = position w, 
        camDir = angle w,
        camZoom = scale w }
  -- We update our objects instanciation
  objects = cache
</code>
</div>

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
xdir :: Point3D
xdir = makePoint3D (1,0,0)
ydir :: Point3D
ydir = makePoint3D (0,1,0)
zdir :: Point3D
zdir = makePoint3D (0,0,1)

rotate :: Point3D -> Scalar -> World -> World
rotate dir angleValue world = 
  world {
     angle = (angle world) + (angleValue -*< dir) }

translate :: Point3D -> Scalar -> World -> World
translate dir len world = 
  world {
    position = (position world) + (len -*< dir) }

zoom :: Scalar -> World -> World
zoom z world = world {
    scale = z * scale world }
</code>
</div>

<div class="codehighlight">
<code class="haskell">
main :: IO ()
main = yMainLoop inputActionMap idleAction initialWorld
</code>
</div>

</div>

Our initial world state is slightly changed:

<div class="codehighlight">
<code class="haskell">
-- We initialize the world state
-- then angle, position and zoom of the camera
-- And the shape function
initialWorld :: World
initialWorld = World {
   angle = makePoint3D (30,30,0)
 , position = makePoint3D (0,0,0)
 , scale = 1.0
 , box = Box3D { minPoint = makePoint3D (-2,-2,-2)
               , maxPoint =  makePoint3D (2,2,2)
               , resolution =  0.02 }
 , told = 0
 -- We declare cache directly this time
 , cache = objectFunctionFromWorld initialWorld
 }
</code>
</div>

We use the `YGL.getObject3DFromShapeFunction` function directly.
This way instead of providing `XYFunc`, we provide directly a list of Atoms.

<div class="codehighlight">
<code class="haskell">
objectFunctionFromWorld :: World -> [YObject]
objectFunctionFromWorld w = [Atoms atomList]
  where atomListPositive = 
          getObject3DFromShapeFunction (shapeFunc (resolution (box w))) (box w)
        atomList = atomListPositive ++ 
          map negativeTriangle atomListPositive
        negativeTriangle (ColoredTriangle (p1,p2,p3,c)) = 
              ColoredTriangle (negz p1,negz p2,negz p3,c)
              where negz (P (x,y,z)) = P (x,y,-z)
</code>
</div>

We know that resize is the only world change that necessitate to 
recompute the list of atoms (triangles). 
Then we update our world state accordingly.

<div class="codehighlight">
<code class="haskell">
resize :: Scalar -> World -> World
resize r world = 
  tmpWorld { cache = objectFunctionFromWorld tmpWorld }
  where 
      tmpWorld = world { box = (box world) {
              resolution = sqrt ((resolution (box world))**2 * r) }}
</code>
</div>

All the rest is exactly the same.

<div style="display:none">

<div class="codehighlight">
<code class="haskell">
idleAction :: Time -> World -> World
idleAction tnew world = 
      world {
        angle = (angle world) + (delta -*< zdir)
      , told = tnew
      }
  where 
      anglePerSec = 5.0
      delta = anglePerSec * elapsed / 1000.0
      elapsed = fromIntegral (tnew - (told world))

shapeFunc :: Scalar -> Function3D
shapeFunc res x y = 
  let 
      z = findMaxOrdFor (ymandel x y) 0 1 20
  in
  if and [ findMaxOrdFor (ymandel (x+xeps) (y+yeps)) 0 1 20 < 0.000001 |
              val <- [res], xeps <- [-val,val], yeps<-[-val,val]]
      then Nothing 
      else Just (z,colorFromValue ((ymandel x y z) * 64))

colorFromValue :: Point -> Color
colorFromValue n =
  let 
      t :: Point -> Scalar
      t i = 0.7 + 0.3*cos( i / 10 )
  in
    makeColor (t n) (t (n+5)) (t (n+10))

findMaxOrdFor :: (Fractional a,Num a,Num b,Eq b) => 
                 (a -> b) -> a -> a -> Int -> a
findMaxOrdFor _ minval maxval 0 = (minval+maxval)/2
findMaxOrdFor func minval maxval n = 
  if func medpoint /= 0 
       then findMaxOrdFor func minval medpoint (n-1)
       else findMaxOrdFor func medpoint maxval (n-1)
  where medpoint = (minval+maxval)/2

ymandel :: Point -> Point -> Point -> Point
ymandel x y z = fromIntegral (mandel x y z 64) / 64
</code>
</div>

</div>

- [`YGL.hs`](code/06_Mandelbulb/YGL.hs), the 3D rendering framework
- [`Mandel`](code/06_Mandelbulb/Mandel.hs), the mandel function
- [`ExtComplex`](code/06_Mandelbulb/ExtComplex.hs), the extended complexes

<a href="code/06_Mandelbulb/Mandelbulb.lhs" class="cut">06_Mandelbulb/<strong>Mandelbulb.lhs</strong> </a>

