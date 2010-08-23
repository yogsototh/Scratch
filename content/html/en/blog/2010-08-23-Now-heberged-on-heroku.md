-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-08-23T15:05:13+02:00
title: Now heberged on heroku
subtitle: Heberge static website on Heroku
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - blog
-----
# Now on [Heroku](http://heroku.com)

I now changed my hosting to [Heroku](http://heroku.com). 
I believe it will be far more reliable.

But as you should know my website is completely static.
I use [nanoc](http://nanoc.stoneship.org/) to generate it.
But here is the conf to make it work on heroku.

The root of my files is `/output`. You only need to create a `config.ru` file:

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


and the `.gems` file needed to install `rack` middlewares.

<code class="ruby" file=".gems">
rack
rack-rewrite
</code>

Now, just follow the heroku tutorial to create an application :

<code class="zsh">
git init
git add .
heroku create
git push heroku master
</code>

Now I'll should be able to redirect properly to my own 404 page for example.
I hope it is helpful.
