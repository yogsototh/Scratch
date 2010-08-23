-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-08-23T15:05:13+02:00
fr: title: Now heberged on heroku
fr: subtitle: Héberger un site web statique sur heroku
en: title: Now heberged on heroku
en: subtitle: Heberge static website on Heroku
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - blog
-----
fr: # Maintenant sur [Heroku](http://heroku.com)
en: # Now on [Heroku](http://heroku.com)

en: I now changed my hosting to [Heroku](http://heroku.com). 
en: I believe it will be far more reliable.
fr: J'ai changé mon hébergeur. Mobileme n'est absolument pas adapté à la diffusion de mon blog. C'est pourquoi je suis passé à [Heroku](http://heroku.com).

en: But as you should know my website is completely static.
en: I use [nanoc](http://nanoc.stoneship.org/) to generate it.
en: But here is the conf to make it work on heroku.
fr: Mais comme vous devez le savoir mon blog est un site complètement statique.
fr: J'utilise [nanoc](http://nanoc.stoneship.org/) pour l'engendrer.
fr: Avoir un site statique amène beaucoup d'avantages par rapport à un site dynamique. Surtout en terme de sécurité.
fr: Voici comment configurer un site statique sur heroku.

en: The root of my files is `/output`. You only need to create a `config.ru` file:
fr: La racine de mes fichiers est '/output'. Vous devez simplement créer deux fichiers. Un fichier `config.ru` :

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


en: and the `.gems` file needed to install `rack` middlewares.
fr: et un fichier `.gems` qui liste les gems nécessaires.

<code class="ruby" file=".gems">
rack
rack-rewrite
</code>

en: Now, just follow the heroku tutorial to create an application :
fr: Maintenant il suffit de suivre l'introduction rapide d'heroku pour créer une nouvelle application :

<code class="zsh">
git init
git add .
heroku create
git push heroku master
</code>

en: Now I'll should be able to redirect properly to my own 404 page for example.
en: I hope it is helpful.
fr: Maintenant je devrait être capable de rediriger correctement mes erreurs 404.
fr: J'espère que ça a pu vous être utile.
