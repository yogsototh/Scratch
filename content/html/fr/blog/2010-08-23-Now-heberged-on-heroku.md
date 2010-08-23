-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-08-23T15:05:13+02:00
title: Now heberged on heroku
subtitle: Héberger un site web statique sur heroku
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - blog
-----
# Maintenant sur [Heroku](http://heroku.com)

J'ai changé mon hébergeur. Mobileme n'est absolument pas adapté à la diffusion de mon blog. C'est pourquoi je suis passé à [Heroku](http://heroku.com).

Mais comme vous devez le savoir mon blog est un site complètement statique.
J'utilise [nanoc](http://nanoc.stoneship.org/) pour l'engendrer.
Avoir un site statique amène beaucoup d'avantages par rapport à un site dynamique. Surtout en terme de sécurité.
Voici comment configurer un site statique sur heroku.

La racine de mes fichiers est '/output'. Vous devez simplement créer deux fichiers. Un fichier `config.ru` :

<code class="ruby" file="config.ru">
require 'rubygems'
require 'rack'
require 'rack-rewrite'

use Rack::Rewrite do
    rewrite %r{(.*)/$},"$1/index.html"
end
use Rack::Static, :urls => ["/"], :root => "output"
app = lambda { |env| [404, { 'Content-Type' => 'text/html' }, 'File Not Found'] }
run app
</code>


et un fichier `.gems` qui liste les gems nécessaires.

<code class="ruby" file=".gems">
rack
rack-rewrite
</code>

Maintenant il suffit de suivre l'introduction rapide d'heroku pour créer une nouvelle application :

<code class="zsh">
git init
git add .
heroku create
git push heroku master
</code>

Maintenant je devrait être capable de rediriger correctement mes erreurs 404.
J'espère que ça a pu vous être utile.
