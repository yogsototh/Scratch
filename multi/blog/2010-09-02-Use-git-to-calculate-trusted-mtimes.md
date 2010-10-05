-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-09-02T15:54:10+02:00
fr: title: Utilisation de git pour calculer les mtimes
en: title: Use git to calculate trusted mtimes
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - nanoc
  - web
  - git
-----

en: You can remark at the bottom of each page I provide a last modification date.
en: This label was first calculated using the `mtime` of the file on the file system.
en: But many times I modify this date just to force some recompilation. 
en: Therefore the date wasn't a date of _real_ modification.
fr: Vous pouvez remarquer qu'à la fin de chaque page je donne une date de dernière modification.
fr: Précédemment cette date était calculée en utilisant la date du fichier.
fr: Mais il arrive fréquemment que je fasse un `touch` d'un fichier pour engendrer tout le site de nouveau.
fr: Donc la date n'est pas nécessairement la _vraie_ de modification du contenue.

en: I use [git](http://git-scm.org) to version my website.
en: And fortunately I can know the last date of _real_ change of a file.
en: This is how I do this with [nanoc](http://nanoc.stoneship.org):
fr: J'utilise [git](http://git-scm.org) pour _versionner_ mon site web.
fr: Et cet outil me permet de récupérer la dernière date de _vraie_ modification d'un fichier.
fr: Voici comment je m'y prend avec [nanoc](http://nanoc.stoneship.org) :

<code class="ruby" file="gitmtime.rb">
def gitmtime
    filepath=@item.path.sub('/Scratch/','content/html/').sub(/\/$/,'')
    ext=%{.#{@item[:extension]}}
    filepath<<=ext
    if not FileTest.exists?(filepath)
        filepath.sub!(ext,%{/index#{ext}})
    end
    str=`git log -1 --format='%ci' -- #{filepath}`
    if str.nil? or str.empty?
        return Time.now
    else
        return DateTime.parse( str )
    end
end
</code>

en: Of course I know it is really slow and absolutely not optimized.
en: But it works as expected.
en: Now the date you see at the bottom is exactly the date I modified the _content_ of the page.

fr: Bien entendu je sais que c'est très lent et absolument pas optimisé.
fr: Mais ça fonctionne comme prévu.
fr: Maintenant la date que vous voyez en bas de la page correspond exactement à la dernière date de modification de son contenu.

en: Thanks to Eric Sunshine to provide me some hints at cleaning my code.
fr: Je tiens à remercier Eric Sunshine pour ses conseils sur ce problème.
