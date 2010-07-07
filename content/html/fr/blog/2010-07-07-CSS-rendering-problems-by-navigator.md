-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-07T15:43:43+02:00
title: N'utilisez pas de gradients avec Chrome
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - css
  - web
  - programming
-----

Some [Reddit](http://reddit.com) users reported my website was really long to load and to scroll.
They thinks it was because of the '1px shadow' I apply on all the text.
I was a bit surprised, because I make some test into a really *slow* virtual machine. And all have always worked fine. In fact, what slow down so much are by order of importance:

1. Les dégradés sur chrome (pas dans Safari sur Mac)
2. les *box shadows* sur Firefox

## les dégradés

Sur Safari il n'y a absolument aucun problème avec les dégradés. Par contre sur chrome sous Linux le site devient quasiment inutilisable.

Safari et Chrome utilisent *webkit* tous les deux. Lorsque vous accéder à ce blog avec javascript activé, un CSS spécifique à votre navigateur est ajouté. Jusqu'à maintenant je faisais un tri entre : IE, Mozilla et Webkit. Maintenant j'ai rajouté un cas particulier pour Chrome.
Maintenant j'ai supprimé les gradients lorsque vous naviguer sur ce site en utilisant Chrome.

Je n'ai pas vérifier la vitesse de rendu de toutes les propriétés de CSS 3. Mais je vous conseille de ne pas utiliser **`-webkit-gradient`** avec Chrome. Au moins sous Linux.

## Les ombres (box-shadow)

J'ai aussi remarqué que **`-moz-box-shadow`** ralenti le rendu sous Firefox (et sous Linux). Alors que l'équivalent webkit ne pose aucun problème à Safari sous Mac.

## Ombres de texte

Beaucoup d'utilisateurs mon dit d'utiliser text-shadows avec parcimonie. Mais je pense qu'il ne s'agissait pas là du problème du ralentissement du site. C'est pourquoi je vais les remettre.

## en conclusion

