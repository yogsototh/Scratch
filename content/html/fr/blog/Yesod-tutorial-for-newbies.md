-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-12-28T15:14:40+02:00
title: Tutoriel Yesod pour les nuls
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


<%= tlal %> Un tutoriel pour yesod.

> * Table of Content (generated)
> {:toc}

enddiv

Do you want the best technology to handle your new web application?
Me too. After searching a lot, it appears you should choose Haskell.
Why? 

* [Extremely fast][warpbench].
* Secure by nature. Many typical programming bug are hard to make in Haskell.
* High abstraction level. 
* Handle asynchronous request better than any other system (better than node.js for example).
* Done to be parallelized. Thanks to purity.

Technically speaking, Haskell seems perfect for web development.
The only drawback you can found for Haskell certainly won't be technical but social. Like the difficulty to grasp Haskell, the few number of developer, etc...

But if you are here, lets pretend, the most important is the technical aspect.
You want the best of the best system to make your new web application.

Instead of reinvent the wheel, we should choose a web framework in Haskell.
Actually there are three choices:

1. [Happstack](http://happstack.com)
2. [Snap](http://snapframework.com)
3. [Yesod](http://yesodweb.com)

I don't think there is a real winner between these three framework.
The choice I made for yesod is highly subjective.
I had the feeling yesod help the newcomers the most.
It also appears the yesod developer are the most active.
But as I said before, I might be wrong has it was only feeling.

Now, what this article is all about? 
A missing tutorial in the yesod documentation.
The goal is to go as straight as possible to the best practice.

You'll then first install, initialize and configure your first yesod project.
Then a 5 minutes yesod tutorial to heat up and verify the awesomeness of yesod.
Then we clean up the 5 minutes tutorial to use the best practices.

[warpbench]: http://www.yesodweb.com/blog/2011/03/preliminary-warp-cross-language-benchmarks

## Install

First you need to install [Haskell][haskell]. The recommended way to do this is to download the [Haskell Platform][haskellplatform].

[haskell]: http://www.haskell.org
[haskellplatform]: http://www.haskell.org/platform

Then you need to install yesod.

<code class="zsh">
> cabal update
> cabal install yesod cabal-dev
</code>

That is all. It should take some time to 
do this as cabal will download all 
package and then compile them.

## Initialization

Open a terminal and type:

<code class="zsh">
> yesod init
</code>

Enter your name, name the project `yosog` and the name of the Foundation as `Yosog`, then choose `sqlite`.
Perfect. Now you can start the development cycle:

<code class="zsh">
> cd yosog
> cabal-dev install && yesod --dev devel
</code>

This will compile the entire project. Be patient it could take some time.
Once finished a server is launched and you could visit it by clicking this link:

[`http://localhost:3000`](http://localhost:3000)

Congratulation! Yesod works.

> Note: if something is messed up use the following command line:
> <code class="zsh">
> \rm -rf dist/* ; cabal-dev install && yesod --dev devel
> </code>

Until the end of the tutorial, use another terminal and let this one open in a corner to see what occurs.

## Configure git

This step is not mandatory for a tutorial, but I wanted to jump directly in good practice. There are many different choice of CVS, but for this tutorial I'll use `git`.

Copy this `.gitignore` file into the `yosog` folder.

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

Now we are almost ready to start.

## A last point

Until here it was just an installation, an initialization and a configuration.

We have a directory containing a bunch of files and
we have a local web server that listen the port 3000.

If we modify a file inside this directory, yesod should try
to recompile as fast as possible the site. 
This way, you should see the modification you do.

Instead of explaining the role of every file,
let's get straight to the point.

Inside the `yosog` the important files/directories for this tutorial are:

1. `config/routes`
2. `Handler/`
3. `templates/`
4. `config/models`

Obviously:

- `config/routes`   is where you'll configure the map URL → Code.
- `Handler/`        contains the files that will contain the code called when a URL is accessed.
- `templates/`      contains HTML, JS and CSS templates. 
- `config/models`   is where you'll configure the persistent objects (database tables).

Also note until here we don't even typed any line of Haskell.
It is now time to start the interesting stuff.

## Protected echo

To verify the quality of the security of the yesod framework, let's make a minimal echo application.

Our goal:

Make a server that when accessed `/echo/`_[some text]_ should return a web page containing "some text" inside an `h1` bloc.

For example, accessing [`http://localhost:3000/echo/some%20text`](http://localhost:3000/echo/some%20text), should display "some text" in an %html web page.

First, we must declare URL of the form /echo/... are meaningful.

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
But this is the standard convention, then let's use it.

If you save `config/routes`, you should see your terminal in which you launched `yesod devel` activate and certainly displaying an error message.

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

Don't worry if you find all of this a bit cryptic. 
This is normal when learning a new framework.
In short it just declare a function named getEchoR with one argument (`theText`) of type String.
When this function is called, it return a "Handler RepHtml" whatever it is. 
But mainly this will encapsulate our expected result inside an HTML text.

After saving the file, you should see yesod recompile the application.
When the compilation is finished you'll see the message: `Starting devel application`.

Now you can visit: [`http://localhost:3000/echo/Yesod%20rocks!`](http://localhost:3000/echo/Yesod%20rocks!)

TADA! It works.

### Secure?

Let's try to attack our website by entering a text with special characters:

[`http://localhost:3000/echo/<a>I'm <script>alert("Bad!");`](http://localhost:3000/echo/<a>I'm <script>alert("Bad!");)<% "</script>" %>

All should work better than expected.

The special characters are protected for us. 
If you have a malicious user, he could not hide some bad script inside his login name for example.

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

Then not only Yesod is fast, it is also relatively secure.

## Cleaning up

This first example was nice, but for simplicity reason we didn't used best practices.

First we will separate the handler code into different files.
After that we will use `Data.Text` instead of `String`. 
Finally we'll use a template file to better separate our view.

### Separate handlers

In a first time create a new file `Handler/Echo.hs` containing:

<code class="haskell">
module Handler.Echo where

import Import

getEchoR :: String -> Handler RepHtml
getEchoR theText = do
    defaultLayout $ do
        [whamlet|<h1>#{theText}|]
</code>

Do not forget to remove the getEchoR function inside the `Handler/Root.hs` file.

We must declare the file inside the cabal configuration file `yosog.cabal`. Just after `Handler.Root` add:

<pre>
    Handler.Echo
</pre>

We must also declare the new Handler module inside `Application.hs`.
Just after the "`import Handler.Root`", add:

<code class="haskell">
import Handler.Echo
</code>

### Use `Data.Text` instead of `String`

Now our handler is separated in another file.

But we used `String` but it is a good practice to use `Data.Text` instead.

To declare we will use `Data.Text` we modify the file `Foundation.hs`.
Add an import directive just after the last one:

<code class="diff">
import Data.Text
</code>

And also we must modify `config/routes` and our handler accordingly. Replace `#String` by `#Text` in `config/routes`:

<pre>
/echo/#Text EchoR GET
</pre>

And do the same in `Handler/Echo.hs`:

<code class="haskell" file="Echo.hs">
module Handler.Echo where

import Import

getEchoR :: Text -> Handler RepHtml
getEchoR theText = do
    defaultLayout $ do
        [whamlet|<h1>#{theText}|]
</code>

### Use a new template file

The last thing to change in order to do things like in 
a real project is to use another template file.

Just create a new file `template/echo.hamlet` containing:

<code class="haskell" file="echo.hamlet">
<h1> #{theText}
</code>

and modify the handler `Handler/Echo.hs`:

<code class="haskell">
getEchoR :: Text -> Handler RepHtml
getEchoR theText = do
    defaultLayout $ do
        $(widgetFile "echo")
</code>

At this point our code is clean.
Handler are grouped, we use `Data.Text` and our views are in templates.
It is now time to make a slightly more complex example.

## Protected input

Let's make another minimal application.
You should see a form containing a Text Field and a validation button.
When you click, the next page present you the content you entered in the field.

First, add a new route:

<code class="zsh">
/new NewR GET POST
</code>

This time the path /new will accept GET and POST requests. Add the corresponding new Handler file:

<code class="haskell" file="New.hs">
module Handler.New where

import Import

getNewR :: Handler RepHtml
getNewR = do
    defaultLayout $ do
        $(widgetFile "new")

postNewR :: Handler RepHtml
postNewR =  do
    postedText <- runInputPost $ ireq textField "content"
    defaultLayout $ do
        $(widgetFile "posted")
</code>

Don't forget to declare it inside `yosog.cabal` and `Application.hs`.

The only new thing here is the line that get the POST parameter named "content".
If you want to know more detail about it and form in general you can take look at [the yesod book](http://www.yesodweb.com/book/forms).

Create the two corresponding templates:

<code class="html" file="new.hamlet">
<h1> Enter your text
<form method=post action=@{NewR}>
    <input type=text name=content>
    <input type=submit>
</code>

<code class="html" file="posted.hamlet">
<h1>You've just posted
<p>#{postedText}
<hr>
<p><a href=@{NewR}>Get back
</code>

And that is all.

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
