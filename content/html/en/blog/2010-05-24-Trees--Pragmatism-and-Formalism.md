-----
isHidden:       true
menupriority:   1
kind:           article
created_at:     2010-05-24T20:05:14+02:00
title: Trees; Pragmatism and Formalism
subtitle: When theory is more efficient than practice
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
    - tree
    - theory
    - mathematics
    - regexp
    - script
-----

begindiv(intro)
<% tldr=%{<abbr title="Too Long; Don't Read"><sc>tl;dr</sc></abbr>} %>

<%=tldr%>: 

- I tried to program a simple filter
- Was blocked 2 days
- Then stopped working like an engineer monkey
- Used a pen and a sheet of paper
- Made some math.
- Crushed the problem in 10 minutes
- Conclusion: The pragmatism shouldn't mean "never use theory".

enddiv

## Abstract (longer than <%=tldr%>)

For my job, I needed to resolve a problem. It first seems not too hard. 
Then I started working directly on my program. 
I entered in the *infernal*: *try &amp; repair loop*.
Each step was like:


>   -- Just this thing to repair and that should be done.  
>   -- OK, now that should just work.  
>   -- Yeah!!!  
>   -- Oops! I forgotten that...  
>   `repeat until death`


After two days of this [Sisyphus](http://fr.wikipedia.org/wiki/Sisyphe) work, I finally just stopped to rethink the problem.
I took a pen, a sheet of paper. I simplified the problem, reminded what I learned during my Ph.D. about trees.
Finally, the problem was crushed in less than 20 minutes.

I believe the important lesson is to remember that the most efficient methodology to resolve this *pragmatic* problem was the *theoretical* one. 
And therefore, argues opposing science, theory to pragmatism and efficiency are fallacies.

newcorps

# First: my experience

Apparently 90% of programmer are unable to program a binary search without bug. 
The algorithm is well known and easy to understand. 
However it is difficult to program it without any flaw. 
I participated to [this contest](http://reprog.wordpress.com/2010/04/19/are-you-one-of-the-10-percent/).
And you can see the [results here](http://reprog.wordpress.com/2010/04/21/binary-search-redux-part-1/)[^1].
I had to face a problem of the same kind at my job. The problem was simple to the start. Simply transform an <sc>xml</sc> from one format to another.


[^1]: Hopefully I am in the 10% who had given a bug free implementation.

The source <sc>xml</sc> was in the following general format:

<code class="xml">
<rubrique>
    <contenu>
        <tag1>value1</tag1>
        <tag2>value2</tag2>
        ...
    </contenu>
    <enfant>
        <rubrique>
            ...
        </rubrique>
        ...
        <rubrique>
            ...
        </rubrique>
    </enfant>
</menu>
</code>

and the destination format was in the following general format:

<code class="xml">
<item name="Menu">
    <value>
        <item name="menu">
            <value>
                <item name="tag1">
                    <value>value1</value>
                </item>
                <item name="tag2">
                    <value>value2</value>
                </item>
                ...
                <item name="menu">
                    <value>
                        ...
                    </value>
                    <value>
                        ...
                    </value>
                </item>
            </value>
        </item>
    </value>
</item>
</code>

At first sight I believed it will be easy. I was so certain it will be easy that I fixed to myself the following rules:

1. do not use <sc>xslt</sc>
2. avoid the use of an <sc>xml</sc> parser
3. resolve the problem using a simple perl script[^2]

You can try if you want. If you attack the problem directly opening an editor, I assure you, it will certainly be not so simple.
I can tell that, because it's what I've done. And I must say I lost almost a complete day at work trying to resolve this. There was also, many small problems around that make me lose more than two days for this problem.

Why after two days did I was unable to resolve this problem which seems so simple?

What was my behaviour (workflow)?

1. Think
2. Write the program
3. Try the program 
4. Verify the result
5. Found a bug
6. Resolve the bug
7. Go to step 3.


This was a *standard* workflow for computer engineer. The flaw came from the first step. 
I thought about how to resolve the problem but with the eyes of a *pragmatic engineer*. I was saying:

> That should be a simple perl search and replace program.  
> Let's begin to write code

This is the second sentence that was plainly wrong. I started in the wrong direction. And the workflow did not work from this entry point.

## Thinking

## spoiler

In the end, the program should be a simple list of search and replace:
<code class="perl">
s/something/something else/g 
</code>

It is not only possible but I believe it is the best way of doing this.

# Solution

Transform this tree:

<pre class="twilight">
R - C - tag1
  \   \
   \    tag2
    E -- R - C - tag1
      \   \    \
       \   \     tag2
        \    E ...
         R - C - tag1 
           \    \
            \     tag2
             E ...
</pre>

to this tree:

<pre class="twilight">
                tag1
              /
M - V - M - V - tag2      tag1
              \         / 
                M --- V - tag2
                  \     \ 
                   \      M
                    \     tag1
                     \  / 
                      V - tag2
                        \ 
                          M
</pre>

using only an acyclic deterministic tree transducer:


>    C -> &epsilon;  
>    E -> R  
>    R -> V  

Wich can be traduced by the following simple regular expression expression:

<code class="perl">
s/C//g
s/E/M/g
s/R/V/g
</code>

Adapted to XML it becomes:

<code class="perl">
s!</?contenu>!!g
s!<enfant>!<item name="menu">!g
s!</enfant>!<item>!g
s!</?rubrique>!<value>!g
s!</rubrique>!</value>!g
</code>

That is all.

# conclusion

It should seems a bit paradoxal, but sometimes the most pragmatic approach to a pragmatic problem is to use the theoretical methodology. Not the commonly accepted pragmatic one. This simple experience prove this point.
