module ExtComplex where

import Graphics.Rendering.OpenGL

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
