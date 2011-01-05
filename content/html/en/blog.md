----- 
kind: blog
title: Blog
menupriority: 2
noSubMenu: true
-----
<% 
    number_of_articles=5
    number_of_char_for_resume=800
    language=@item_rep.path.sub(/\/Scratch\//,'').sub(/\/.*$/,'') 
    last_articles = @items.select do |a| 
            a.reps[0].path =~ /\/#{language}\//  && a[:kind] == 'article'
    end
    last_articles=last_articles.sort { |x,y| y[:created_at] <=> x[:created_at] }[0..(number_of_articles-1)]

def dArr
    return %{<span class="nicer">&dArr;</span>}
end
%>

* [<%= number_of_articles %> latest articles <%=dArr%>](#last-<%= number_of_articles %>-articles) 
* [Tag Cloud <%=dArr%>](#tagcloud)
* [Archives <%=dArr%>](#archives)
* [Two words about the content <%=dArr%>](#two-words-about-the-content)

## Last <%= number_of_articles %> Articles

enddiv

<% last_articles.each do |a| %>
<h1> 
    <%= calendar_for( a[:created_at], language ) %> 
    <%= link_to(a[:title]+%{ <span class="nicer">»</span>}, a) %> 
</h1>

<div class="corps">
    <%= repair_html ( excerptize( a.reps[0].compiled_content, {:length => number_of_char_for_resume} ) ) %>
    <div class="flush"></div>
    <p>
       <%= link_to(%{Read more <span class="nicer">»</span>}, a) %>
    </p>
</div>
<% end %>

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

