----- 
kind: blog
title: Blog
menupriority: 2
noSubMenu: true
-----
<% 
    number_of_articles=10
    number_of_char_for_resume=800
    language=@item_rep.path.sub(/\/Scratch\//,'').sub(/\/.*$/,'') 
    last_articles = articles.select do |a| 
            a.reps[0].path =~ /\/#{language}\// 
    end
    last_articles=last_articles.sort { |x,y| y[:created_at] <=> x[:created_at] }[0..(number_of_articles-1)]
%>

## Last <%= number_of_articles %> articles

<ul style="list-style-type: none; margin: 0;">
<% last_articles.each do |a| %>
    <li style="line-height: 3em; margin: 0;">
        <%= calendar_for(a[:created_at], language) %>
        <%= link_to(a[:title], a) %>
    </li>
<% end %>
</ul>

<a href="#archives">Archives &darr;</a>

newcorps

<div>
<%= tagCloud %>
</div>

enddiv

## Archives

<%= generateBlogSubMenu(language) %>

newcorps

## Two word about the content


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

