-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-09-27T15:15:23+02:00
title: Higher order function in zsh
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

begindiv(intro)

<%= tlal %> des fonctions d'ordres supérieurs en zsh.

enddiv

Tout d'abord, pourquoi c'est important d'avoir ces fonctions. 
Plus je programmais avec zsh plus j'essayais d'avoir un style fonctionnel.

Le minimum pour pouvoir avoir du code plus lisible c'est de posséder les fonctions `map`, `filter` et `fold`.

Voici pourquoi avec une comparaison.
Commençons par un programme qui converti tous les gif en png dans plusieurs répertoires projets contenant tous des répertoires resources.
Avant :

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

Après

<code class="zsh">
gif_to_png() { convert $1 ${1:r}.png && \rm -f $1 }
handle_resources() { map gif_to_png $1/resources/*.gif(.N) }
map handle_resources /path/to/projects/*(/N)
</code>

Plus de bloc ! 
Oui, c'est un poil plus difficile à lire pour les non initiés. 
Mais c'est à la fois plus concis et plus robuste.

Et encore ce code ne possède pas de test.
Recommençons sur le même principe.

Trouver les fichiers des projets qui ne contiennent pas de s dans leur nom qui ont le même nom que leur projet.


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
