-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-12-28T15:14:40+02:00
en: title: Yesod tutorial for newbies
fr: title: Tutoriel Yesod pour les nuls
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - yesod
  - haskell
  - programming
  - web
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)

en: <%= tldr %>

fr: <%= tlal %>

enddiv

Here it is. You searched for the best technology to handle your new web application. After searching a lot, you finally found the fastest, most reliable language to make it is Haskell.

It is [incredibly fast][warpbench], can handle extremely well parallel tasks, etc...

[warpbench]: http://www.yesodweb.com/blog/2011/03/preliminary-warp-cross-language-benchmarks

You start reading a bit about Haskell and you are ready to do some test. First you see you have three different choices of web framework. As you already know Haskell will be a new language to learn, you start slowly by adopting a framework.

The actual choices are:

1. [Happstack](http://happstack.com)
2. [Snap](http://snapframework.com)
3. [Yesod](http://yesodweb.com)

It is hard to get a real idea about which you should choose. But if you read a bit, it seems the one which went the farther is yesod. As it has a lot of module for you. The documentation seems good.

Snap and Happstack both seems simpler. The feeling is closer to the language but that means more work to do on your own. Of course, these are just feeling and you have to try it for yourself. Now you are ready to start a Yesod.

## Install

First you need to install [Haskell][haskell]. The recommended way to do this is to use the [Haskell Platform][haskellplatform].

[haskell]: http://www.haskell.org
[haskellplatform]: http://www.haskell.org/platform

Secondly you need to install yesod.

<code class="zsh">
> cabal update
> cabal install yesod cabal-dev
</code>

That is all. It should take some time to 
do this as cabal will download all 
package and then compile them.

## Initialization

Open a terminal and:

<code class="zsh">
> yesod init
</code>

I entered my name, the name of the project was `yosog` and the name of the Fondation was `Yosog`, then I chosen `sqlite`.

Perfect. Now you can start the development cycle:

<code class="zsh">
> cd yosog
> cabal-dev install && yesod --dev devel
</code>

This will compile the entire project. 
In the end you should now be able to see your local website by clicking this link:

[`http://localhost:3000`](http://localhost:3000)

Congratulation! You were able to see your yesod powered website.
For the rest of the tutorial, use another terminal and let this one open in a corner to see what occurs.

## Configure git

It is not mandatory for a tutorial, but it is a good practice to have a CVS.

To use `git` copy this `.gitignore` file into the `yosog` folder.

<code class="zsh" file=".gitignore">
cabal-dev
dist
.static-cache
static/tmp
*.sqlite3
</code>

Then initialize your git repository:

<code class="zsh">
> git init .
> git add .
> git commit -a -m "Initial yesod commit"
</code>

Now we are ready to modify our web application.

## A last point

What did we done:

1. We have a directory containing a bunch of files
2. We have a local web server on port 3000

If we modify a file inside this directory, yesod should try
to recompile as fast as possible the site. This way, you should
see the modification you done.

Instead of explaining the role of every file,
let's get straight to the point.

Inside the `yosog` the important files/directories for this tutorial are:

1. `config/routes`
2. `Handler/`
3. `templates/`
4. `static/`
5. `config/models`

Obviously:

- `config/routes`   is where you'll configure the map URL → Code.
- `Handler/`        contains the files that will contain the code called when a URL is accessed.
- `templates/`      contains HTML, JS and CSS templates. 
- `static/`         contains static files.
- `config/models`   is where you'll configure the persistent objects (database tables).

With these informations we should be able to do a lot.
Also note until here we don't even typed any line of Haskell.

## Let's really start

What could we start to change?

<code class="zsh">
> curl localhost:3000
</code>

<div style="background-color: #FCC; border: 2px solid #300">
<strong style="color: #A00">TODO</strong>
<ul style="margin-left: 2em">
<li> Display something, show it is protected.
</li><li>Make the same as before, but with an input.
</li><li>Create a minimal blog system.
</li><li>Change template to html5 boilerplate.
</li><li>Use Authentification.
</li>
</ul>
</div>
