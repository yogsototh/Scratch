-----
isHidden:       true
menupriority:   1
kind:           article
created_at:     2010-05-24T20:05:14+02:00
fr: title: Arbres ; Pragmatisme et Formalisme
fr: subtitle: Quand la théorie est plus pratique que la pratique
en: title: Trees; Pragmatism and Formalism
en: subtitle: When theory is more efficient than practice
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
en:  - tree
en:  - theory
en:  - mathematics
fr:  - arbre
fr:  - théorie
fr:  - mathématiques
-----
en: # First: my experience
fr: # L'anecdote

Apparently 90% of programmer are unable to program a binary search without bug. 
The algorithm is well known and easy to understand. 
However it is difficult to program it without any flaw. 
I participated to [this contest](http://reprog.wordpress.com/2010/04/19/are-you-one-of-the-10-percent/).
And you can see the [results here](http://reprog.wordpress.com/2010/04/21/binary-search-redux-part-1/)[^1].
I had to face a problem of the same kind at my job. The problem was simple to the start. Simply transform an <sc>xml</sc> from one format to another.

[^1]: Hopefully I am in the 10% who had given a bug free implementation.

The source <sc>xml</sc> was in the following general format:

<code class="xml">
<menu>
    <content>
        <tag1>value1</tag1>
        <tag2>value2</tag2>
        ...
    </content>
    <enfant>
        <menu>
            ...
        </menu>
        ...
        <menu>
            ...
        </menu>
    </enfant>
</menu>
</code>

And the destination format was in the following general format:

<code class="xml">
<rubrique>
    <value>
        <item name="tag1"><value>value1</value></item>
        <item name="tag2"><value>value2</value></item>
        ...
        <item name="menu">
          <rubrique>
            ...
          </rubrique>
          <rubrique>
            ...
          </rubrique>
        </menu>
    </value>
    <value>
        ...
    </value>
</rubrique>
</menu>
</code>

At first sight I believed it will be easy. I was so certain it will be easy that I fixed to myself the following rules:

1. do not use <sc>xslt</sc>
2. avoid the use of an <sc>xml</sc> parser
3. resolve the problem using a simple perl script[^2]

You can try if you want. If you attack the problem directly opening an editor, I assure you, it will certainly be not so simple.
I can tell that, because it's what I've done. And I must say I lost almost a complete day at work trying to resolve this. Each time, I made a try, each time I was close, but not on the solution. There was also, many small problems around that make me lose more than two days for this problem.

Why after two days did I was unable to resolve this problem which seems so simple?

What was my behaviour (workflow)?

1. Think
2. Write the program
3. Try the program 
4. Verify the result
5. Found a bug
6. Resolve the bug
7. Go to the third step

And this is the *standard* workflow for computer engineer. The flaw came from the first step. 
I thought about how to resolve the problem but with the eyes of a *pragmatic engineer*. I was saying:

> That should be a simple perl search and replace program.  
> Let's begin to write code

This is the second sentence that was plainly wrong. Because of old external errors I started in the wrong direction. And the workflow did not work from this entry point.

Let's have a look at the *engineer workflow*. In fact, it is a simple algorithm which start from some point, and ameliorate himself at each step until it reach a solution. The key point is, you have a bad start, you can potentially never reach a solution point.

## spoiler

In the end, the program should be a simple list of search and replace:
<code>
s/something/something else/g 
</code>

It is not only possible but I believe it is the best way of doing this.

# conclusion

It should seems a bit paradoxal, but sometimes the most pragmatic approach to a pragmatic problem is to use the theoretical methodology. Not the commonly accepted pragmatic one. This simple experience prove this point.
