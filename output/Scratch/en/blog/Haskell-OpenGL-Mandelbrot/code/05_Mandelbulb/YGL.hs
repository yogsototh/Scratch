-- The languages include needed because I wanted to use
-- (Point,Point,Point) instead of 
-- data Point3D = Point3D (Point,Point,Point) deriving ...
{-
The module YGL will contains most boilerplate
And display details.

To make things even nicer, we should separate
this file in many different parts.
Typically separate the display function.

-}
module YGL (
    -- Datas
    Point 
    , Time
    , Scalar
    , Color
    , Point3D
    , makePoint3D -- helper (x,y,z) -> Point3D
    , (-*<) -- scalar product on Point3D
    , Function3D
    -- Your world state must be an instance
    -- of the DisplayableWorld type class
    , DisplayableWorld (..)
    -- Datas related to DisplayableWorld
    , Camera (..)
    , YObject (..)
    , Box3D (..)
    , makeBox
    , hexColor
    , makeColor
    -- Datas related to user Input
    , InputMap
    , UserInput (Press,Ctrl,Alt,CtrlAlt)
    , inputMapFromList
    -- The main loop function to call
    , yMainLoop) where

import Numeric (readHex)
import Graphics.Rendering.OpenGL hiding (Color)
import Graphics.UI.GLUT hiding (Color)
import Data.IORef
import qualified Data.Map as Map
import Control.Monad (when)
import Data.Maybe (isNothing)

{-- Things start to be complex here.
- Just take the time to follow me.
--}

-- | A 1D point
type Point   = GLfloat 
-- | A Scalar value
type Scalar  = GLfloat
-- | The time type (currently its Int
type Time = Int
-- | A 3D Point mainly '(x,y,z)'
data Point3D = P (Point,Point,Point) deriving (Eq,Show,Read)
type Color = Color3 Scalar

xpoint :: Point3D -> Point
xpoint (P (x,_,_)) = x
ypoint :: Point3D -> Point
ypoint (P (_,y,_)) = y
zpoint :: Point3D -> Point
zpoint (P (_,_,z)) = z

makePoint3D :: (Point,Point,Point) -> Point3D
makePoint3D p = P p


instance Num Point3D where
    (+) (P (ax,ay,az)) (P (bx,by,bz)) = P (ax+bx,ay+by,az+bz)
    (-) (P (ax,ay,az)) (P (bx,by,bz)) = P (ax-bx,ay-by,az-bz)
    (*) (P (ax,ay,az)) (P (bx,by,bz)) = P ( ay*bz - az*by
                                , az*bx - ax*bz
                                , ax*by - ay*bx )
    abs (P (x,y,z)) = P (abs x,abs y, abs z)
    signum (P (x,y,z)) = P (signum x, signum y, signum z)
    fromInteger i = P (fromInteger i, 0, 0)

infixr 5 -*<
(-*<) :: Scalar -> Point3D -> Point3D
(-*<) s p = P (s*xpoint p, s*ypoint p, s*zpoint p)


toGLVector3 :: Point3D -> Vector3 GLfloat
toGLVector3 (P(x,y,z)) = Vector3 x y z

toGLVertex3 :: Point3D -> Vertex3 GLfloat
toGLVertex3 (P(x,y,z)) = Vertex3 x y z

toGLNormal3 :: Point3D -> Normal3 GLfloat
toGLNormal3 (P(x,y,z)) = Normal3 x y z

-- | The Box3D type represent a 3D bounding box
-- | Note if minPoint = (x,y,z) and maxPoint = (x',y',z')
-- | Then to have a non empty box you must have
-- | x<x' & y<y' & z<z'
data Box3D = Box3D {
         minPoint :: Point3D 
       , maxPoint :: Point3D
       , resolution :: Scalar }

makeBox :: (Point,Point,Point) -> (Point,Point,Point) -> Scalar -> Box3D
makeBox mini maxi res = Box3D {
      minPoint = makePoint3D mini
    , maxPoint = makePoint3D maxi
    , resolution = res  }

type Triangle3D = (Point3D,Point3D,Point3D,Color)
-- For a general purpose library we should add many other different atoms
-- corresponding to Quads for example.
data Atom = ColoredTriangle Triangle3D 
type Function3D = Point -> Point -> Maybe (Point,Color)
data YObject =   XYFunc Function3D Box3D
               | Atoms [Atom]

atoms :: YObject -> [Atom]
atoms (XYFunc f b) = getObject3DFromShapeFunction f b
atoms (Atoms atomList) = atomList

-- | We decalre the input map type we need here
-- | It is our API
type InputMap worldType = Map.Map UserInput (worldType -> worldType)
data UserInput = Press Char | Ctrl Char | Alt Char | CtrlAlt Char 
                 deriving (Eq,Ord,Show,Read)

-- | A displayable world 
class DisplayableWorld world where
    camera :: world -> Camera
    camera _ = defaultCamera 
    lights :: world -> [Light]
    lights _ = []
    objects :: world -> [YObject]
    objects _ = []
    winTitle :: world -> String
    winTitle _ = "YGL"

-- | the Camera type to know how to
-- | Transform the scene to see the right view.
data Camera = Camera {
          camPos  :: Point3D
        , camDir  :: Point3D
        , camZoom :: Scalar }

defaultCamera :: Camera
defaultCamera = Camera {
      camPos = makePoint3D (0,0,0)
    , camDir = makePoint3D (0,0,0)
    , camZoom = 1 }


-- Given a shape function and a delimited Box3D
-- return a list of Triangles to be displayed
getObject3DFromShapeFunction :: Function3D -> Box3D -> [Atom]
getObject3DFromShapeFunction shape box = do
  x <- [xmin,xmin+res..xmax]
  y <- [ymin,ymin+res..ymax]
  let 
    neighbors = [(x,y),(x+res,y),(x+res,y+res),(x,y+res)]
    -- zs are 3D points with found depth and color
    -- zs :: [ (Point,Point,Point,Maybe (Point,Color) ]
    zs = map (\(u,v) -> (u,v,shape u v)) neighbors
    -- ps are 3D opengl points + color value
    ps = zs
  -- If the point diverged too fast, don't display it
  if any (\(_,_,z) -> isNothing z) zs
  then []
  -- Draw two triangles
  --    3 - 2
  --    | / |
  --    0 - 1
  -- The order is important
  else 
    [ makeAtom (ps!!0) (ps!!2) (ps!!1)
    , makeAtom (ps!!0) (ps!!3) (ps!!2) ]
  where
    makeAtom (p0x,p0y,Just (p0z,c0)) (p1x,p1y,Just (p1z,_)) (p2x,p2y,Just (p2z,_)) =
        ColoredTriangle (makePoint3D (p0x,p0y,p0z)
                        ,makePoint3D (p1x,p1y,p1z)
                        ,makePoint3D (p2x,p2y,p2z)
                        ,c0)
    makeAtom _ _ _ = error "Somethings wrong here"

    -- some naming to make it 
    -- easier to read
    xmin = xpoint $ minPoint box
    xmax = xpoint $ maxPoint box
    ymin = ypoint $ minPoint box
    ymax = ypoint $ maxPoint box
    res = resolution box

inputMapFromList :: (DisplayableWorld world) => 
    [(UserInput,world -> world)] -> InputMap world
inputMapFromList = Map.fromList

{-- 
- We set our mainLoop function
- As you can see the code is _not_ pure 
- and not even functionnal friendly!
- But when called,
- it will look like a standard function.
--}
yMainLoop :: (DisplayableWorld worldType) =>
             InputMap worldType -- the mapping user input / world
             -> (Time -> worldType -> worldType)
             -> worldType -- the world state
             -> IO ()     -- into IO () for obvious reason
yMainLoop inputActionMap 
          worldTranformer
          world = do
  -- The boilerplate
  _ <- getArgsAndInitialize
  initialDisplayMode $= 
      [WithDepthBuffer,DoubleBuffered,RGBMode]
  _ <- createWindow $ winTitle world
  depthFunc  $= Just Less
  windowSize $= Size 500 500
  -- The state variables for the world (I know it feels BAD)
  worldRef <- newIORef world
  -- Action to call when waiting
  idleCallback $= Just (idle worldTranformer worldRef)
  -- the keyboard will update the world
  keyboardMouseCallback $= 
          Just (keyboardMouse inputActionMap worldRef)
  -- We generate one frame using the callback
  displayCallback $= display worldRef
  normalize $= Enabled
  -- Lights
  lighting $= Enabled
  ambient (Light 0) $= Color4 0 0 0 1
  diffuse (Light 0) $= Color4 0.5 0.5 0.5 1
  specular (Light 0) $= Color4 1 1 1 1
  position (Light 0) $= Vertex4 1 1 0 1
  light (Light 0) $= Enabled
  colorMaterial $= Just (Front,AmbientAndDiffuse)
  materialDiffuse Front $= Color4 0.5 0.5 0.5 1 
  materialAmbient Front $= Color4 0.5 0.5 0.5 1 
  materialSpecular Front $= Color4 0.2 0.2 0.2 1 
  materialEmission Front $= Color4 0.3 0.3 0.3 1
  materialShininess Front $= 90.0
  -- We enter the main loop
  mainLoop

-- When no user input entered do nothing
idle :: (Time -> worldType -> worldType) -> IORef worldType -> IO ()
idle worldTranformer world = do
    w <- get world
    t <- get elapsedTime
    world $= worldTranformer t w
    postRedisplay Nothing

-- Get User Input
-- both cleaner, terser and more expendable than the preceeding code
keyboardMouse :: InputMap a -> IORef a
                 -> Key -> KeyState -> Modifiers -> Position -> IO()
keyboardMouse input world key state _ _ =
    when (state == Down) $
         let 
            charFromKey (Char c) = c
            -- To replace
            charFromKey _ = '#'

            transformator = Map.lookup (Press (charFromKey key)) input 
         in 
         mayTransform transformator
    where
        mayTransform Nothing = return ()
        mayTransform (Just transform) = do
            w <- get world
            world $= transform w


-- The function that will display datas
display :: (HasGetter g, DisplayableWorld world) => 
           g world -> IO ()
display worldRef = do
    -- BEWARE UGLINESS!!!!
    -- SHOULD NEVER MODIFY worldRef HERE!!!!
    --
    -- I SAID NEVER.
    w <- get worldRef
    -- NO REALLY, NEVER!!!!
    -- If someone write a line starting by
    -- w $= ... Shoot him immediately in the head
    --          and refere to competent authorities
    let cam = camera w
    -- set the background color (dark solarized theme)
    clearColor $= Color4 0 0.1686 0.2117 1
    clear [ColorBuffer,DepthBuffer]
    -- Transformation to change the view
    loadIdentity -- reset any transformation
    -- tranlate
    translate $ toGLVector3 (camPos cam)
    -- zoom
    scale (camZoom cam) (camZoom cam) (camZoom cam)
    -- rotate
    rotate (xpoint (camDir cam)) $ Vector3 1.0 0.0 (0.0::GLfloat)
    rotate (ypoint (camDir cam)) $ Vector3 0.0 1.0 (0.0::GLfloat)
    rotate (zpoint (camDir cam)) $ Vector3 0.0 0.0 (1.0::GLfloat)
    -- Now that all transformation were made
    -- We create the object(s)
    _ <- preservingMatrix $ mapM drawObject (objects w)
    swapBuffers -- refresh screen

-- Hexa style colors
scalarFromHex :: String -> Scalar
scalarFromHex = (/256) . fst . head . readHex 

hexColor :: [Char] -> Color
hexColor ('#':rd:ru:gd:gu:bd:bu:[]) = Color3 (scalarFromHex (rd:ru:[]))
                                             (scalarFromHex (gd:gu:[])) 
                                             (scalarFromHex (bd:bu:[]))
hexColor ('#':r:g:b:[]) = hexColor ('#':r:r:g:g:b:b:[])
hexColor _ = error "Bad color!!!!"

makeColor :: Scalar -> Scalar -> Scalar -> Color
makeColor x y z = Color3 x y z
---

-- drawObject :: (YObject obj) => obj -> IO()
drawObject :: YObject -> IO()
drawObject shape = do
  -- We will print only Triangles
  renderPrimitive Triangles $ do
    -- solarized base3 color
    -- color $ hexColor "#fdf603" 
    mapM_ drawAtom (atoms shape)

-- simply draw an Atom
drawAtom :: Atom -> IO ()
drawAtom atom@(ColoredTriangle (p0,p1,p2,c)) = do
    color c
    normal $ toGLNormal3 (getNormal atom)
    vertex $ toGLVertex3 p0
    vertex $ toGLVertex3 p1
    vertex $ toGLVertex3 p2

-- get the normal vector of an Atom
getNormal :: Atom -> Point3D
getNormal (ColoredTriangle (p0,p1,p2,_)) = (p1 - p0) * (p2 - p0)
