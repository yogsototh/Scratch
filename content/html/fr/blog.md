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
    last_articles = @items.select do |a| 
            a.reps[0].path =~ /\/#{language}\//  && a[:kind] == 'article'
    end
    last_articles=last_articles.sort { |x,y| y[:created_at] <=> x[:created_at] }[0..(number_of_articles-1)]

def dArr
    return %{<span class="nicer">&dArr;</span>}
end
%>

* [Les <%= number_of_articles %> derniers articles <%=dArr%>](#les-<%= number_of_articles %>-derniers-articles)
* [Nuage de mots clés <%=dArr%>](#tagcloud)
* [Archives <%=dArr%>](#archives)
* [Un petit mot sur le contenu <%=dArr%>](#un-petit-mot-sur-le-contenu)

newcorps

## Les <%= number_of_articles %> derniers articles

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


## Un petit mot sur le contenu

Vous trouverez ici des articles qui sont pour la plupart
écrits en anglais et qui sont techniques.
Certain sont justes là pour me souvenir de petits trucs, que
d'autres pourraient trouver utiles. Mais il y a aussi de
long articles techniques qui vont un peu plus dans les détails.

---

 Je fais de mon mieux pour traduire chaque page en anglais et en français.
Cependant, ce n'est pas toujours évident. 
Il m'arrive de faire de nombreuses fautes d'orthographes, des erreurs typographiques et autres. 



<strong> Merci de ne pas me juger sur ces erreurs et de ne pas oublier que le fond est plus important que la forme. </strong>

L'impression que ce site laisse de moi n'est certainement pas l'impression que je vous laisserais si on se rencontrait.


Je vous souhaite de trouver ce que vous cherchez sur ce site.
