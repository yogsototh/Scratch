-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-09-27T15:15:23+02:00
en: title: Higher order function in zsh
fr: title: Higher order function in zsh
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)

en: <%= tldr %> some simple implementation of higher order function for zsh.
fr: <%= tlal %> des fonctions d'ordres supérieurs en zsh.

enddiv

fr: Tout d'abord, pourquoi c'est important d'avoir ces fonctions. 
fr: Plus je programmais avec zsh plus j'essayais d'avoir un style fonctionnel.

fr: Le minimum pour pouvoir avoir du code plus lisible c'est de posséder les fonctions `map`, `filter` et `fold`.

fr: Voici pourquoi avec une comparaison.
fr: Commençons par un programme qui converti tous les gif en png dans plusieurs répertoires projets contenant tous des répertoires resources.
fr: Avant :

<code class="zsh">
# for each directory in projects dir
for toProject in /path/to/projects/*(/N); do
    # toProject is /path/to/projects/foo
    # project become foo (:t for tail)
    project=${toProject:t}
    for toResource in $toProject/resources/*.gif(.N); do
        convert $toResource ${toResource:r}.png
        \rm -f $toResource
    done
done
</code>

fr: Après

<code class="zsh">
gif_to_png() { convert $1 ${1:r}.png && \rm -f $1 }
handle_resources() { map gif_to_png $1/resources/*.gif(.N) }
map handle_resources /path/to/projects/*(/N)
</code>

fr: Plus de bloc ! 
fr: Oui, c'est un poil plus difficile à lire pour les non initiés. 
fr: Mais c'est à la fois plus concis et plus robuste.

fr: Et encore ce code ne possède pas de test.
fr: Recommençons sur le même principe.

fr: Trouver les fichiers des projets qui ne contiennent pas de s dans leur nom qui ont le même nom que leur projet.


<code class="zsh">
for toProject in Projects/*; do
    project=$toProject:t
    if print -- project | grep -v s >/dev/null
    then
        print $project
        for toResource in $toProject/*(.N); do
            if print -- ${toResource:t} | grep $project >/dev/null; then
                print -- "X $toResource"
            fi
        done
    fi
done
</code>

After =>

<code class="zsh">
contain_no_s() { print $1 | grep -v s }
function verify_file_name {                               
    local project=$1:t
    contains_project_name() { print $1:t | grep $project }
    map "print -- X" $(filter contains_project_name $1/*(.N))
}
map show_project_matchin_file $( filter contain_no_s Projects/* )
</code>

Also, the first verstion is a bit easier to read. 
But the second one is clearly far superior in architecture.
Why?
