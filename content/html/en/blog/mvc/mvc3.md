-----
# Built-in
filters_pre:
    - "bluecloth"

# Custom 
kind: article
menupriority: 3
title: MVC explained (first design cleaning)
multiTitle: 
    fr: first design cleaning
    en: first design cleaning

-----

## first design cleaning ##

If you want your applications to 
generate strict XHTML 1.0 web pages you
have to modify your application to put the content
between an *header* and a *footer*.

Naturally, You write directly the header and footer 
in the source code of the application.

You also want to initialize with some tasks.
And in order to prepare the future, you separate
the server code from you todo list code.
Then you write a specifical class for the two
*features* of your application.

Your new code will look like:

<div>
    <code class="ruby">
class Todo
    def content
        Print the content of the list
        ...

todo = new Todo
HEADER="<... code HTML ...>"
FOOTER="<... code HTML ...>"

Class Server
    def do_GET
        return HEADER + (todo.content) + FOOTER

server = new Server
server.start # and for each GET request execute do_GET</code>
</div>

Here are the details of the modified code:

<div>
<code class="ruby" file="step0.rb">
#!/usr/bin/env ruby

require 'webrick'
include WEBrick

s = HTTPServer.new( :Port => 2000 )

class Todo
    def initialize
        @todoList=['first task','second task']
    end
    def content
        res='<h1>Todo</h1><ul>'
        @todoList.each{|task| res<<='<li>'+task+'</li>'}
        res<<='</ul>'
        return res
    end
end

class Servlet

    # you write the common header and footer of all pages
    # directly in the source code
    @@Header='<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="fr" xml:lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Todo Application</title>
</head>
<body><div id="content">'
    @@Footer='</div></body>'
    @@Todo=Todo.new

    def do_GET(req, res)
        res.body = @@Header + @@Todo.content + @@Footer
        res['Content-Type'] = "text/html"
    end
end
servlet=Servlet.new
s.mount("/"){ |req,res| server.do_GET(req,res) }
trap("INT"){ s.shutdown }
s.start </code>
</div>

For now your application isn't functionnal. But it's great,
you can print your todo list. We just have to add content
at runtime now.
