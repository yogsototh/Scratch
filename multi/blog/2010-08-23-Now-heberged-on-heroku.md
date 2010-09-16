-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-08-23T15:05:13+02:00
fr: title: Maintenant sur Heroku
fr: subtitle: Héberger un site web statique sur heroku
en: title: Now hosted by heroku
en: subtitle: Host static website on Heroku
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

en: The root of my files is `/output`. You only need to create a `config.ru`[^1] file:
fr: La racine de mes fichiers est '/output'. Vous devez simplement créer deux fichiers. Un fichier `config.ru`[^1] :

fr: [^1]: Je me suis complètement inspiré de cet [article](http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free).
en: [^1]: I was inspired by this [article](http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free). 

<code class="ruby" file="config.ru">
require 'rubygems'
require 'rack'
require 'rack/contrib'
require 'rack-rewrite'
require 'mime/types'

use Rack::ETag
module ::Rack
    class TryStatic < Static

        def initialize(app, options)
            super
            @try = ([''] + Array(options.delete(:try)) + [''])
        end

        def call(env)
            @next = 0
            while @next < @try.size && 404 == (resp = super(try_next(env)))[0] 
                @next += 1
            end
            404 == resp[0] ? @app.call : resp
        end

        private
        def try_next(env)
            env.merge('PATH_INFO' => env['PATH_INFO'] + @try[@next])
        end

    end
end

use Rack::TryStatic, 
    :root => "output",                              # static files root dir
    :urls => %w[/],                                 # match all requests 
    :try => ['.html', 'index.html', '/index.html']  # try these postfixes sequentially

errorFile='output/Scratch/en/error/404-not_found/index.html'
run lambda { [404, {
                "Last-Modified"  => File.mtime(errorFile).httpdate,
                "Content-Type"   => "text/html",
                "Content-Length" => File.size(errorFile).to_s
            }, File.read(errorFile)] }
</code>


en: and the `.gems` file needed to install `rack` middlewares.
fr: et un fichier `.gems` qui liste les gems nécessaires.

<code class="ruby" file=".gems">
rack
rack-rewrite
rack-contrib
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
