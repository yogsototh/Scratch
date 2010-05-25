-----
isHidden:       true
menupriority:   1
kind:           article
created_at:     2010-05-24T20:05:14+02:00
title: Arbres ; Pragmatisme et Formalisme
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
 - arbre
-----
# First: my experience

It was said, 90% of programmer are unable to program a binary search without bug. 
The algorithm is well known and easy to understand. 
However it is difficult to program it without any flaw. 
I participated to [this contest](http://reprog.wordpress.com/2010/04/19/are-you-one-of-the-10-percent/).
And you can see the [results here](http://reprog.wordpress.com/2010/04/21/binary-search-redux-part-1/)[^1].
I had to face a problem of the same kind at my job. The problem was simple to the start. Simply transform and <sc>xml</sc> into another <sc>xml</sc>.

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

At first sight I believed it will not be so difficult. I had the following rules:

* I don't want to use XSLT
* I wanted to avoid <sc>xml</sc> parsor if possible
* I should do all that with a simple perl script wich search an replace things.

In the end, the program should be a simple list of:
    s/something/something else/g 

It is not only possible but I believe it is the best way of doing this.

# conclusion

As it should seems a bit contractidory. Sometimes the most pragmatic approach to a pragmatic problem should be the theoretical one. Not the commonly accepted pragmatic one. This simple experience prove this point.
