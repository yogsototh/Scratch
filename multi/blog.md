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

en: * [Last <%= number_of_articles %> articles](#last-<%= number_of_articles %>-articles)
fr: * [Les <%= number_of_articles %> derniers articles](#les-<%= number_of_articles %>-derniers-articles)
en: * [Tag Cloud](#tagcloud)
fr: * [Nuage de mots clés](#tagcloud)
* [Archives](#archives)
en: * [Two words about the content](#two-words-about-the-content)
fr: * [Un petit mot sur le contenu](#un-petit-mot-sur-le-contenu)

newcorps

fr: ## Les <%= number_of_articles %> derniers articles
en: ## Last <%= number_of_articles %> articles

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

en: ## Two words about the content
en: 
en: Here you'll can find mostly technical articles.
en: Some are just reminder of technical tips.
en: But some are long and technically detailled articles.
en: 
en: ---
en: 
en:  I do my best to traduce each page in french and in english.
en: It not always easy. English is not my natural language.
en: I make many errors, orthographic, grammatical, typographical&hellip;
en: 
en: <strong> Thanks not to judge me based on these errors! And don't forget content is more important than presentation! </strong>
en: 
en: The first impression I'll let you if we meet in real life should be different from the one I let you based on my website.
en: 
en: I wish you to find something useful or interesting on this website.

fr: ## Un petit mot sur le contenu
fr: 
fr: Vous trouverez ici des articles qui sont pour la plupart
fr: écrits en anglais et qui sont techniques.
fr: Certain sont justes là pour me souvenir de petits trucs, que
fr: d'autres pourraient trouver utiles. Mais il y a aussi de
fr: long articles techniques qui vont un peu plus dans les détails.
fr: 
fr: ---
fr: 
fr:  Je fais de mon mieux pour traduire chaque page en anglais et en français.
fr: Cependant, ce n'est pas toujours évident. 
fr: Il m'arrive de faire de nombreuses fautes d'orthographes, des erreurs typographiques et autres. 
fr: 
fr: 
fr: 
fr: <strong> Merci de ne pas me juger sur ces erreurs et de ne pas oublier que le fond est plus important que la forme. </strong>
fr: 
fr: L'impression que ce site laisse de moi n'est certainement pas l'impression que je vous laisserais si on se rencontrait.
fr: 
fr: 
fr: Je vous souhaite de trouver ce que vous cherchez sur ce site.
