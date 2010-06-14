-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-06-14T16:14:57+02:00
fr: title: choix liés à l'écriture dans plusieurs langues
en: title: multi language choices
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
en:   - multi-language
fr:   - langues
  - blog
-----

fr: Je traduis la plupart de mes articles pour qu'ils soient disponibles en français et en anglais. 
fr: La façon que l'on m'a conseillé était d'avoir un fichier par langue. En général ça donne ça.

en: I translate most of my blog entries in French and English.
en: Most people advice me to have one file per language. Generally it ends with:

<pre class="twilight">
Bonjour, 

voici un exemple de texte en français.
[image](url)
</pre>

<pre class="twilight">
Hello, 

here is an example of english text.
[image](url)
</pre>

fr: Cette façon de traduire vous impose une certaine façon de traduire.
fr: D'abord écrire entièrement le texte dans une langue, 
fr: puis copier le fichier et enfin retraduire dans une nouvelle langue.
en: This way of handling translations force you to write completely an article in one language, copy it, and translate it.

fr: Le problème, c'est que très souvent, les articles ont des parties communes non négligeables. Par exemple, les images, les codes sources, etc...
fr: Lorsque je m'aperçoit que j'ai fait une erreur dans ces parties communes
fr: ça m'oblige à refaire deux fois la même manipulation. Sauf que comme il m'arrive d'être distrait, il peut y avoir pas mal d'aller-retours.
en: However, most of time, there are common parts like images, source code, etc...
en: When I want to correct some mistake on these parts, I have to make twice the work. With sometimes adding another mistake in only one language.

fr: C'est pourquoi, j'ai plutôt opté pour une autre solution. 
fr: J'utilise des *tags* sur un seul fichier. 
fr: En fin de compte, mes fichiers ressemblent à :
en: This is why I preferred to handle it differently.
en: I use *tags* on a single file.
en: Finally my files looks like:

<pre>
 fr:   Bonjour, 
 en:   Hello, 

 en:   here is an example of english text.
 fr:   voici un exemple de texte en français.
[image](url)
</pre>

fr: Comme j'édite mes fichier avec [vim](http://vim.org), il m'est très facile d'ajouter ces `fr:` ou `en:` en début de ligne à l'aide du très utile `C-v`.
fr: Par contre [nanoc](http://nanoc.stoneship.org) a été conçu pour être utilisé par une seule langue. Précédemment, j'avais utilisé les capacité de nanoc pour séparer les langues. Mais finalement, il s'avère bien plus simple de faire un *pré-traitement* qui nettoie mes fichiers et en fait deux copie qui seront ensuite gérées par [nanoc](http://nanoc.stoneship.org).
en: As I edit my files with [vim](http://vim.org), it is really easy to add `fr:` or `en:` at some line's beginning using the useful `C-v`.
en: However [nanoc](http://nanoc.stoneship.org) was conceived to be used for one language only. Or to be used with the first method. I tried to adapt nanoc to my usage. But after a while, I found it easier to pre-filter the nanoc work by a simple script. My script transform my file into two new files. And all work like a charm.

fr: Vous pouvez récupérer les sources de mon blog à l'adresse suivante [github.com/yogsototh/n3blog](http://github.com/yogsototh/n3blog). J'écrirais un article pour savoir comment l'utiliser facilement. J'ai en effet ajouté beaucoup de scripts et de librairies.
en: You can get my blog source at [github.com/yogsototh/n3blog](http://github.com/yogsototh/n3blog). I'll make a new blog entry about how to use it. I added many scripts and libraries to help making nice website.
