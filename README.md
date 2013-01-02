# yannesposito.com

This is the source code for the [yannesposito.com](yannesposito.com) website.

It is mainly a multi-language blog based on [nanoc](nanoc.stoneship.org).

_Notice, this is not a clean system. 
Mainly because I have used it for some years now.
I just want it to work, not to be a nice piece of code.
But in the end I know I will make it clean._

What you'll need to use it:

- [nanoc](nanoc.stoneship.org) → `gem install nanoc`
- [zsh](zsh.org) → Installed by default on most good system
- A bunch of gems: `gem install kramdown builder sass rainpress`
- Optionally if you want to serve locally: `gem install unicorn rack rack-contrib rack-rewrite mime-types`

Optionally

- [graphviz](graphviz.org)

Here is a short explanation of the role of each file:


    config.rb            → nanoc central configuration file
    config.ru            → Rack server configuration
    config.yaml          → A YAML configuration file (mostly strings)
    content/             → The directory where nanoc will search for most of the content
    img_latest_blog_dir@ → A link to the latest blog image directory
    latest.md@           → A link to the latest blog file
    layouts/             → HTML Layouts for your webpages
    lib/                 → Some ruby files loaded by nanoc before generating
    multi/               → Where you should write content
    output/              → Where the content is loaded
    Rakefile             → Ruby actions
    README.md            → This file
    resources/           → Some files I used and wanted to keep
    Rules                → Generation rules
    tasks/               → Where I put most of my scripts


Here are features I added:

    analytics.rb → Functions to add web analytics code
    calendar.rb  → Functions to show a date nicely in HTML
    gitmtime.rb  → Show time using git last change log
    graph.rb     → Use graphviz to draw graphs
    helpers.rb   → Some standard nanoc helpers are added
    html.rb      → Layout block helper
    intenseDebate.rb → IntenseDebate integration
    macros.rb    → Macros system (%latex => LaTeX, etc...)
    mail.rb      → My uniquely encoded personal email
    multiMenu.rb → The machinery for the menu
    multi.rb     → Machinery for multi-language support
    nanoc_item_conf.rb
    repair_html.rb
    syntaxColorize.rb
    tag.rb
    ultraviolet.rb
    y.rb
