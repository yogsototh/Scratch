-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-07T15:43:43+02:00
title: Do not use CSS gradient with Chrome
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - css
  - web
  - programming
-----

Beaucoup d'utilisateurs de [Reddit](http://reddit.com) m'ont rapporter que mon site était très long à charger et à scroller.
Ils pensaient qu'il s'agissait d'un problème à cause des ombres que j'applique à quasiment tout le texte du site.
J'étais un peu surpris puisque je fais mes tests sur une machine vraiment très lente et je n'avais jamais détecté ces problèmes.
En réalité, ce qui ralenti le rendu de ce site est par ordre d'importance :

1. Radial gradient on chrome (not in Safari on Mac)
2. Box shadows on Firefox and chrome

## Gradient

On Safari on Mac there is absolutely no rendering time problem. But when I use chrome under Linux it is almost unusable.

Safari and Chrome use webkit, when you access my website with javascript enabled, an additionnal browser specific CSS is loaded. Until now I switched only between: IE, Mozilla and Webkit. Now I added one more special case for Chrome. Now I continue to use gradient for Safari but no more on Chrome.

I didn't tried to verify the efficiency of all new CSS 3 features. But I advise you not to use **`-webkit-gradient`** on Chrome. At least when the host is a Linux.

## Box Shadows

I also detected that **`-moz-box-shadow`** elements slow down the rendering on Firefox under Linux. But there was very few time rendering issue with Safari on Mac.

## Text Shadows

Many tell me to use text-shadows sparingly. But I believe it was not the real reason of the slow down. This is why I'll get them back.

## Conclusion

Do not use **`-webkit-gradient`** on Chrome browser yet.
Try to use **`-moz-box-shadow`** sparingly.
N'utilisez pas **`-webkit-gradient`** avec google Chrome pour l'instant.
Utilisez **`-moz-box-shadow`** avec parcimonie.
