----- 
kind: blog
title: Blog
menupriority: 2
noSubMenu: true
-----
<% 
    number_of_articles=20
    number_of_char_for_resume=800
    language=@item_rep.path.sub(/\/Scratch\//,'').sub(/\/.*$/,'') 
    last_articles = articles.select do |a| 
            a.reps[0].path =~ /\/#{language}\// 
    end
    last_articles=last_articles.sort { |x,y| y[:created_at] <=> x[:created_at] }[0..(number_of_articles-1)]

def dArr
    return %{<span class="nicer">&dArr;</span>}
end
%>

* [Last <%= number_of_articles %> articles <%=dArr%>](#last-<%= number_of_articles %>-articles) 
* [Tag Cloud <%=dArr%>](#tagcloud)
* [Archives <%=dArr%>](#archives)
* [Two words about the content <%=dArr%>](#two-words-about-the-content)

newcorps

## Last <%= number_of_articles %> articles

<ul style="list-style-type: none; margin: 0;">
<% last_articles.each do |a| %>
    <li style="line-height: 1em; margin: 0;">
        <%= calendar_for(a[:created_at], language) %>
        <%
        linktext=%{<span class="sc">#{a[:title]}</span>}
        if a[:subtitle]
            linktext<<=%{ <br> <span class="small" style="margin-left: 5em"><span class="small"><em>#{a[:subtitle]}</em></span></span>}
        end
        %>
        <%= link_to(linktext, a) %>
    </li>
<% end %>
</ul>

<a href="#archives">Archives <%=dArr%></a>

newcorps

<div>
<%= tagCloud %>
</div>

enddiv

## Archives

<%= generateBlogSubMenu(language) %>

newcorps

## Two words about the content

Here you'll can find mostly technical articles.
Some are just reminder of technical tips.
But some are long and technically detailled articles.

---

 I do my best to traduce each page in french and in english.
It not always easy. English is not my natural language.
I make many errors, orthographic, grammatical, typographical&hellip;

<strong> Thanks not to judge me based on these errors! And don't forget content is more important than presentation! </strong>

The first impression I'll let you if we meet in real life should be different from the one I let you based on my website.

I wish you to find something useful or interesting on this website.

