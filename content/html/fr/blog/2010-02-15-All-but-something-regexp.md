-----

# Custom 
isHidden:       false
menupriority:   1
kind:           article
created_at:           2010-02-15T11:16:12+02:00
title: All but something regexp
multiTitle: 
    fr: Expression Régulière pour "Tout sauf un mot"
    en: Pragmatic Regular Expression Exclude
multiDescription:
    fr: pas de description.
    en: Sometimes you want to exclude some string with an existing regular expression. Here are some examples on how you could achieved that when it is possible (it is not always the case).
tags:
  - regexp

-----

Sometimes you cannot simply write:

<code class="ruby">
if str.match(regexp) and 
    not str.match(other_regexp)
        do_something
</code>

and you have to make this behaviour with only one regular expression. The problem is the complementary of regular languages is not regular. Then, for some expression it is absolutely not impossible.

But sometimes with some simple regular expression it should be possible<sup><a href="#note1">&dagger;</a></sup>. Say you want to match everything containing the some word say `bull` but don't want to match `bullshit`. Here is a nice way to do that:

<code class="ruby">
# match all string containing 'bull' (bullshit comprised)
/bull/

# match all string containing 'bull' except 'bullshit'
/bull([^s]|$)|
bulls([^h]|$)|
bullsh([^i]|$)|
bullshi([^t]|$)/

# another way to write it would be
/bull([^s]|$|s([^h]|$)|sh([^i]|$)|shi([^t]|$))/
</code>

Let look closer. In the first line the expression is:
`bull([^s]|$)`, why does the `$` is needed?
Because, without it the word `bull` would be no more matched. This expression means:

> The string finish by `bull`    
> or,   
> contains `bull` followed by a letter different from `s`. 

And this is it. I hope it could help you.

Notice this method is not always the best. For example try to write a regular expression equivalent to the following conditional expression:
<code class="ruby">
# Begin with 'a': ^a
# End with 'a': c$
# Contain 'b': .*b.*
# But isn't 'axbxc'
if str.match(/^a.*b.*c$/) and 
        not str.match(/^axbxc$/)
    do_something
end
</code>

A nice solution is:

<code class="ruby">
/abc|           # length 3
a.bc|           # length 4
ab.c|
a[^x]b[^x]c|    # length 5
a...*b.*c|      # length >5
a.*b...*c/
</code>

This solution uses the maximal length of the string not to be matched.
There certainly exists many other methods. But the important lesson is
it is not straightforward to exclude something of a regular expression.

---

<small><a name="note1">&dagger;</a>
It can be proved that any regular set minus a finite set is also regular.
</small>
