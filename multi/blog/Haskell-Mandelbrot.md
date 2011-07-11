-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-07-10T12:41:26+02:00
en: title: ASCII Haskell Mandelbrot
fr: title: Mandelbrot avec haskell
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
en: Here is the obfuscated code:
fr: Voici le code "obfusqué" :

<code class="zsh" file="animandel.hs">
a=27;b=79;c=C(-2.0,-1.0);d=C(1.0,1.0);e=C(-2.501,-1.003)
newtype C = C (Double,Double) deriving (Show,Eq)
instance Num C where C(x,y)*C(z,t)=C(z*x-y*t,y*z+x*t);C(x,y)+C(z,t)=C(x+z,y+t);abs(C(x,y))=C(sqrt(x*x+y*y),0.0)
r(C(x,y))=x;i(C(x,y))=y
f c z 0=0;f c z n=if(r(abs(z))>2)then n else f c ((z*z)+c) (n-1)
h j k = map (\z->(f (C z) (C(0,0)) 32,(fst z>l - q/2))) [(x,y)|y<-[p,(p+((o-p)/a))..o],x<-[m,(m + q)..l]] where o=i k;p=i j;m=r j;l=r k;q=(l-m)/b
u j k = concat $ map v $ h j k where v (i,p)=(" .,`'°\":;-+oO0123456789=!%*§&$@#"!!i):rst p;rst True="\n";rst False=""
main = putStrLn $ im 0 where cl n (C (x,y))=let cs=(1.1**n-1) in C ((x+cs*(r e))/cs+1,(y+cs*(i e))/cs+1);bl n=cl n c;tr n=cl n d;im n=u (bl n) (tr n)++"\x1b[H\x1b[25A"++im (n+1)
</code>

en: To launch it, you'll need to have [haskell](http://haskell.org) installed and to run:
fr: Pour le lancer, [haskell](http://haskell.org) doit être installé. Puis vous devez écrire dans un terminal :

<code class="zsh">ghc --make animandel.hs && animandel</code>

en: Here is some image after 50 iterations:
fr: Voici le résultat après 50 itérations.

<code class="zsh">
5555666666666666666666666666666655555555554O+++ :o022334444444444444444444444444
5555556666666666666666666666665555555555543210O-+O112333344444444444444444444444
55555555666666666666666666665555555555444333210o`O012333333444444444444444444444
4555555555566666666666666555555555544444333331O+°°,'0233333334444444444444444433
44444445555555556666555555555444444444433333210o-:O01122333333334444444444443333
44444444444444445555444444444444444444333332211O+ -o1112222223333333344433333222
444444444444433331133334444444444444433332221110o"+O0111222222222222222222222222
34444444443333330OO03333334444444443332222221100O+-oO001122222222221110-O1111122
22333333333332210--01223333333333322222222211000o-°+o00000122222111110o°;o001111
11OO112222222111O;;O111222222211OO111122211000Oo-" :+ooOOOO.O0000000OOo'°oOO0000
0O;+O01122211000O--O00011221110O+;O00000OO +oooo-: :-+oo++";oOO0000Ooo+;;+oooO00
o+"+oO00OO OOOOoo::ooOOOO°OO00Oo+"+ooOooo+;°---",' ,,";--: ;-+oo+ +++;;°°;;-++:;
,° °':°: ` "`".°°  °° "°".  :'",  '°`°":`°` ,,``     .   . .°°'°° ` ..     `'°. 
+-`-oo+oo+'+o+`--°°;-`+o+"+oo+oo-'-++;+++-:,:::"`    °::°° :-;;--,;-; "  " ;-;":
OO"-O0000000000Oo--oO0000000000O-:oO0000Oo::+++;;: ":"-++-';+oooOOoooo-::-oooo++
10;-111222222110O--O011222222111- 01111110oOOOoo-: :-ooooo`:OO000000OO+;;+OOO000
22122222222222110++0112222222222111222222221000O+:,;.O000001111111100Oo:-OO00000
3344444433333332-,°-2333333344444433322222221100o-;oO00011222222221111O'+0111111
444444444444333320023333444444444444433322221110O.:O0011222222222222211-01112222
44444444444444443333444444444444444444333332211O. -o1112222222223333333333322222
44444444445555555555555555444444444444433333210O-"oO1122223333333444444444433333
444555555555666666666666555555555444444433333' '`:+O0233333333444444444444444433
</code>

Here is the more readable version. I believe with this far more readable version, no more explanation is needed.

<code class="zsh">
nbvert = 30
nbhor = 79
zoomfactor = 1.01
init_bottom_left = C (-2.0,-2.0)
init_top_right   = C (3.0,2.0)
interrest        = C (-1.713,-0.000)

newtype Complex = C (Float,Float) deriving (Show,Eq)
instance Num Complex where
    fromInteger n     = C (fromIntegral n,0.0)
    C (x,y) * C (z,t) = C (z*x - y*t, y*z + x*t)
    C (x,y) + C (z,t) = C (x+z, y+t)
    abs (C (x,y))     = C (sqrt (x*x + y*y),0.0)
    signum (C (x,y))  = C (signum x , 0.0)

real :: Complex -> Float
real (C (x,y))    = x
im :: Complex -> Float
im   (C (x,y))    = y

cabs :: Complex -> Float
cabs = real.abs

f :: Complex -> Complex -> Int -> Int
f c z 0 = 0
f c z n = if (cabs z > 2) then n else f c ((z*z)+c) (n-1) 


bmandel bottomleft topright = map (\z -> (f (C z) (C(0,0)) 32, (fst z > right - hstep/2 ))) [(x,y) | y <- [bottom,(bottom + vstep)..top], x<-[left,(left + hstep)..right]]
    where
        top = im topright
        bottom = im bottomleft
        left = real bottomleft
        right = real topright
        vstep=(top-bottom)/nbvert
        hstep=(right-left)/nbhor

mandel :: (Complex,Complex) -> String
mandel (bottomleft,topright) = concat $ map treat $ bmandel bottomleft topright
    where
        treat (i,jump) = " .,:;rcuowijlbCUOW&$@#" !! (div (i*22) 32):rst jump
        rst True = "\n"
        rst False = ""

cdiv :: Complex -> Float -> Complex
cdiv (C(x,y)) r = C(x/r, y/r) 
cmul :: Complex -> Float -> Complex
cmul (C(x,y)) r = C(x*r, y*r) 

zoom :: Complex -> Complex -> Complex -> Float -> (Complex,Complex)
zoom bl tr center magn = (f bl, f tr)
    where
        f point = ((center `cmul` magn) + point ) `cdiv` (magn + 1)
    

main = do
    x <- getContents
    putStrLn $ infinitemandel 0
    where
        window n = zoom init_bottom_left init_top_right interrest (zoomfactor**n) 
        infinitemandel n = mandel (window n) ++ "\x1b[H\x1b[25A" ++ infinitemandel (n+1)
</code>
