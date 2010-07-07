-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-07T15:43:43+02:00
fr: title: N'utilisez pas de gradients avec Chrome
en: title: Do not use CSS gradient with Chrome
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - css
  - web
  - programming
-----

fr: Some [Reddit](http://reddit.com) users reported my website was really long to load and to scroll.
fr: They thinks it was because of the '1px shadow' I apply on all the text.
fr: I was a bit surprised, because I make some test into a really *slow* virtual machine. And all have always worked fine. In fact, what slow down so much are by order of importance:
en: Beaucoup d'utilisateurs de [Reddit](http://reddit.com) m'ont rapporter que mon site était très long à charger et à scroller.
en: Ils pensaient qu'il s'agissait d'un problème à cause des ombres que j'applique à quasiment tout le texte du site.
en: J'étais un peu surpris puisque je fais mes tests sur une machine vraiment très lente et je n'avais jamais détecté ces problèmes.
en: En réalité, ce qui ralenti le rendu de ce site est par ordre d'importance :

en: 1. Radial gradient on chrome (not in Safari on Mac)
en: 2. Box shadows on Firefox and chrome
fr: 1. Les dégradés sur chrome (pas dans Safari sur Mac)
fr: 2. les *box shadows* sur Firefox

en: ## Gradient
fr: ## les dégradés

en: On Safari on Mac there is absolutely no rendering time problem. But when I use chrome under Linux it is almost unusable.
fr: Sur Safari il n'y a absolument aucun problème avec les dégradés. Par contre sur chrome sous Linux le site devient quasiment inutilisable.

en: Safari and Chrome use webkit, when you access my website with javascript enabled, an additionnal browser specific CSS is loaded. Until now I switched only between: IE, Mozilla and Webkit. Now I added one more special case for Chrome. Now I continue to use gradient for Safari but no more on Chrome.
fr: Safari et Chrome utilisent *webkit* tous les deux. Lorsque vous accéder à ce blog avec javascript activé, un CSS spécifique à votre navigateur est ajouté. Jusqu'à maintenant je faisais un tri entre : IE, Mozilla et Webkit. Maintenant j'ai rajouté un cas particulier pour Chrome.
fr: Maintenant j'ai supprimé les gradients lorsque vous naviguer sur ce site en utilisant Chrome.

en: I didn't tried to verify the efficiency of all new CSS 3 features. But I advise you not to use **`-webkit-gradient`** on Chrome. At least when the host is a Linux.
fr: Je n'ai pas vérifier la vitesse de rendu de toutes les propriétés de CSS 3. Mais je vous conseille de ne pas utiliser **`-webkit-gradient`** avec Chrome. Au moins sous Linux.

en: ## Box Shadows
fr: ## Les ombres (box-shadow)

en: I also detected that **`-moz-box-shadow`** elements slow down the rendering on Firefox under Linux. But there was very few time rendering issue with Safari on Mac.
fr: J'ai aussi remarqué que **`-moz-box-shadow`** ralenti le rendu sous Firefox (et sous Linux). Alors que l'équivalent webkit ne pose aucun problème à Safari sous Mac.

en: ## Text Shadows
fr: ## Ombres de texte

en: Many tell me to use text-shadows sparingly. But I believe it was not the real reason of the slow down. This is why I'll get them back.
fr: Beaucoup d'utilisateurs mon dit d'utiliser text-shadows avec parcimonie. Mais je pense qu'il ne s'agissait pas là du problème du ralentissement du site. C'est pourquoi je vais les remettre.

en: ## Conclusion
fr: ## en conclusion

en: Do not use **`-webkit-gradient`** on Chrome browser yet.
en: Try to use **`-moz-box-shadow`** sparingly.
en: N'utilisez pas **`-webkit-gradient`** avec google Chrome pour l'instant.
en: Utilisez **`-moz-box-shadow`** avec parcimonie.
