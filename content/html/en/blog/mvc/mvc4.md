-----
# Built-in
filters_pre:
    - "bluecloth"

# Custom 
kind: article
menupriority: 4
title: MVC explained (make it usable)
multiTitle: 
    fr: make it usable
    en: make it usable

-----

## Make it usable ##

The app is almost usable. You only need to have a way to 
add new tasks and to delete them. Let's do it using

<div>
    <code class="html">
http://localhost:2000/?newtask="new task text"
http://localhost:2000/?deletetask=taskNumber </code>
</div>

It is not a so difficult part, you only need a little
code in the `do_GET` function of server to call to correct
Todo methods depending of the request.

And of course code the correponding method in the Todo class.

<div>
<code class="ruby" file="naivetodolist.rb">
#!/usr/bin/env ruby

require 'webrick'
# the Todo class is in an external file
require 'todo.rb'
include WEBrick

s = HTTPServer.new( :Port => 2000 )

class Servlet
    # you write the common header and footer of all pages
    # directly in the source code
    @@Header='<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" 
                                    lang="fr" xml:lang="fr">
<head>
    <meta http-equiv="Content-Type" 
                        content="text/html; charset=UTF-8" />
    <title>Todo Application</title>
</head>
<body><div id="content">'
    @@Footer='</div></body>'

    def initialize()
        @todo=Todo.new
    end

    # implement the GET request
    def do_GET(req, res)
        if req.query['newtask']
            @todo.addTask(req.query['newtask'])
        elsif req.query['deletetask']
            @todo.deleteTask(req.query['deletetask'])
        end
        res.body = @@Header + @todo.content + @@Footer
        res['Content-Type'] = "text/html"
    end
end

servlet=Servlet.new
s.mount_proc("/"){ |req,res| servlet.do_GET(req,res) }

trap("INT"){ s.shutdown }
s.start</code>
</div>

Where the TODO class is really simple and coded like this:

<div>

    <code class="ruby" file="todo.rb">
class Todo
    def initialize
        @todoList=['first task','second task']
    end
    def content
        res='<h1>Todo</h1><ul>';
        i=0
        @todoList.each do |task| 
            res<<='<li>'+task+
                ' <a href="?deletetask='+ i.to_s +
                '">done</a>'+'</li>'
            i+=1
        end
        res<<='</ul>
        <form name="input" action="#" metho="get">
            Task: <input type="text" name="newtask"/>
        </form>'
        return res
    end
    def addTask(task)
        @todoList<<=task
    end
    def deleteTask(taskNum)
        @todoList.delete_at(Integer(taskNum.to_s))
    end

end</code>
</div>

Here is the results :

![A screenshot of this minimal application](/Scratch/img/MVCWhy/Screenshot_v0.png "Screenshot naive version")

Now we have separated the server and the todo list into
two different files.

The application's working within only 76 lines of code

Now speak about the problems of this (working) implementation.

What will occurs if you want to change from list to tables for
example or more generally if we want to change the html structure?

You'll have to modify the **Todo** class.

This is why you should separate even more each concepts.
