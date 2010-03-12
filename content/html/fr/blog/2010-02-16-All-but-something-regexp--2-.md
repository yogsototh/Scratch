-----

# Custom 
isHidden:       false
menupriority:   1
kind:           article
date:           2010-02-16T10:33:21+02:00
title: All but something regexp (2)
multiTitle: 
    fr: All but something regexp (2)
    en: All but something regexp (2)
multiDescription:
    fr: pas de description.
    en: no description.
tags:
  - regexp
  - regular expression

-----

In my [previous post](previouspost) I had given some trick to match all except something. On the same idea, the trick to match the smallest possible string. Say you want to match the string between 'a' and 'b', for example, you want to match:

`a.....<b>a......b</b>....a....<b>a....b</b>....`

Here are two common error and a solution:

<table>
    <hr>
        <td> Regexp </td>
        <td> Match </td>
    </hr>
    <tr>
        <td> `a.*b` </td>
        <td> `<b>a.....a......b....a....a....b</b>....` </td>
    </tr>
    <tr>
        <td> `a.*?b` </td>
        <td> `a.....<b>a......b</b>....a....<b>a....b</b>....` </td>
    </tr>
    <tr>
        <td> `a[^a]*b` </td>
        <td> `a.....<b>a......b</b>....a....<b>a....b</b>....` </td>
    </tr>
</table>

The first error is to use the *evil* `.*`. Because you will match from the first to the last. The next natural way, is to change the *greediness*. But it is not enough as you will match from the first `a` to the first `b`. Then a simple constatation is that our matching string shouldn't contain any `a`. Which lead to the last elegant solution.

Until now, that was, easy. Now, how do you manage when instead of `a` you have a string?

Say you want to match: 
    `&lt;li&gt;...&lt;li&gt;`

This is a bit difficult. You need to match 
`&lt;li&gt;[anything not containing &lt;li&gt;]&lt;/li&gt;`

The first method would be to use the same reasoning as in my [previous post](previouspost). Here is a first try:
<pre>
&lt;li&gt;([^&lt;]|&lt;[^l]|&lt;l[^i]|&lt;li[^&gt;])*&lt;/li&gt;
</pre>

But what about the following string: `&lt;li&gt;...&lt;li&lt;/li&gt;`.
That string should not match. This is why if we really want to match it correctly<sup><a href="#note1">&dagger;</a></sup> we need to add:
<pre>
&lt;li&gt;([^&lt;]|&lt;[^l]|&lt;l[^i]|&lt;li[^&gt;])*(|&lt;|&lt;l|&lt;li)&lt;/li&gt;
</pre>

Yes a bit complicated. But what if the string I wanted to match was even longer?

Here is the algorithm way to handle this easily. You reduce the problem to the first one letter matching:

<div><code class="perl">
# transform a simple randomly choosen character
# to an unique ID 
# (you should verify the identifier is REALLY unique)
# beware the unique ID must not contain the 
# choosen character
s/X/_unique_id_for_capitalized_x_/g
# transform the long string in this simple character
s/<li>/X/g
# use the first method
s/X([^X]*)<\/li>//g
# retransform the choosen character back
s/_unique_id_for_capitalized_x_/X/g
</code></div>

And it works in only 4 lines for any beginning string. This solution should look less *I AM THE GREAT REGEXP M45T3R, URAN00B*, but is more convenient in my humble opinion. Further more, using this last solution prove you master regexp, because you know it is difficult to manage such problems with only a regexp.

---

<small><a name="note1"><sup>&dagger;</sup></a> I know I used an HTML syntax example, but in my real life usage, I needed to match between ``. And sometimes the string could finish with `e::`.</small>
    

[previouspost]: /Scratch/multi/blog/2010-02-16-All-but-something-regexp--2- "All but something regexp"
