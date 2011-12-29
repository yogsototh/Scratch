-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-12-28T15:14:40+02:00
title: Yesod tutorial for newbies
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - yesod
  - haskell
  - programming
  - web
-----
<%= blogimage("warp-benchmark.png","Title image") %>

begindiv(intro)

<%= tldr %> A simple yesod tutorial. You shouldn't need to know Haskell very well. 


> * Will be replaced by Table of Content
> {:toc}

enddiv

You want the best technology to handle your new web application?
Me too. After searching a lot, it appears if you focus only on technical aspect, Haskell is the way to go.

It is [extremely fast][warpbench].
It is secure by nature. Many typical programming bug are hard to make in Haskell.
Haskell is also a "high level of abstraction" language. You can organize your code clearly.

Actually there are three web frameworks in Haskell:

1. [Happstack](http://happstack.com)
2. [Snap](http://snapframework.com)
3. [Yesod](http://yesodweb.com)

It is very hard to choose between these three.
But my feeling goes to Yesod.
It appears to be the one with most part done for you.
As a beginner, let's stay away of the detail as most as possible.

The following tutorial contains some parts.

- Install → Install haskell and yesod. This can be long, but it is all automatic and this should be straightforward.
- Initialization → Initialize the project and configure it.
- Configure git → This is not mandatory, but it is a good practice.
- Verify the security → A first step to verify the yesod framework protect us from most common errors.
- Create a minimal blog → This is the "hello world" of web framework.
- Some tuning → Use html5 boilerplate for example.

[warpbench]: http://www.yesodweb.com/blog/2011/03/preliminary-warp-cross-language-benchmarks

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

## Protected echo

To verify the quality of the security of the yesod framework, let's look at a minimal echo application.

Our goal:

Accessing [`http://localhost:3000/echo/some%20text`], should display "some text" in an %html web page.

Let's take a look at the file `config/routes`:

<code class="zsh">
/static StaticR Static getStatic
/auth   AuthR   Auth   getAuth

/favicon.ico FaviconR GET
/robots.txt RobotsR GET

/ RootR GET
</code>

We want to add a route of the form `/echo/[anything]` somehow and do some action with this.
We add the following:

<pre>
/echo/#String EchoR GET
</pre>

This line contains three elements: the <sc>url</sc> pattern, a handler name, an HTTP method.
I am not particularly fan of the big R in the end of handler names. 
But this is the standard convention, then I use it.

If you save `config/routes`, you should see your terminal in which you launched `yesod devel` do things. 
And certainly break in error.

<pre>
Application.hs:31:1: Not in scope: `getEchoR'
</pre>

Why? Simply because we didn't written the code for the handler `EchoR`.
Now, let's do this. Edit the file `Handler/Root.hs` and append this:

<code class="haskell">
getEchoR :: String -> Handler RepHtml
getEchoR theText = do
    defaultLayout $ do
        [whamlet|<h1>#{theText}|]
</code>

After saving the file, you should see yesod recompile the application.
When the compilation is finished you'll see the message: `Starting devel application`.
You can now visit: [`http://localhost:3000/echo/Yesod%20rocks!`](http://localhost:3000/echo/Yesod%20rocks!)

TADA! It works.

Now, let's try to attack our website by entering name with special characters:

[`http://localhost:3000/echo/<a href="badlink">I'm <script>alert("Bad!");`](http://localhost:3000/echo/<a href="badlink">I'm <script>alert("Bad!");)<% "</script>" %>

The special characters are protected for us. 
If you have a malicious user, he could not hide some bad script inside his name for example.

This is a direct consequence of _type safety_.
The URL string is put inside a URL type.
Then the interesting part in the URL is put inside a String type. To pass from URL type to String type some transformation are made. For example, replace all "`%20`" by space characters.
Then to show the String inside an HTML document, the string is put inside an HTML type. Some transformations occurs like replace "<code><</code>" by "`&lt;`".
Thanks to yesod, most of tedious string transformation job is done for us.

<code class="zsh">
"http://localhost:3000/echo/some%20text<a>" :: URL
                    ↓
              "some text<a>"                :: String
                    ↓
          "some text &lt;a&gt;"             :: HTML 
</code>

That was the first very minimal example, and we already 
verified Yesod protect us from many common errors.

For a first example it is nice, but we should now organize the code in a better way.

For example, we should have created another file inside the Handler directory. 
And we also should have created another template file.

<%= startTodo %>

 <ul><li>Explain how to separate the Handler files.
</li><li>Explain how to use another template.
</li></ul>

<%= endTodo %>

## Protected input

---

<%= startTodo %>

<ul>
  <li>      Display something, show it is protected.
  </li><li> Make the same as before, but with an input.
  </li><li> Create a minimal blog system.
  </li><li> Change template to html5 boilerplate.
  </li><li> Use Authentification.
  </li>
</ul>

<%= endTodo %>
