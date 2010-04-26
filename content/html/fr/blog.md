-----
# Custom 
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

<ul>
<% last_articles.each do |a| %>
    <li>
        <span class="date"><%= a[:created_at].strftime( @config[:dateFormat][language.intern] ) %></span> <%= link_to(a[:title], a) %>
    </li>
<% end %>
</ul>

<a href="#archives">Archives &darr;</a>

newcorps

<div>
<%= tagCloud(2) %>
</div>

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

enddiv

## Archives

<%= generateBlogSubMenu %>
