-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-09-28T15:15:23+02:00
title: Fonctions d'ordre supérieur en zsh
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.jpg","Title image") %>

begindiv(intro)

<%= tlal %> des fonctions d'ordres supérieurs en zsh.

enddiv

Tout d'abord, pourquoi c'est important d'avoir ces fonctions. 
Plus je programmais avec zsh plus j'essayais d'avoir un style fonctionnel.

Le minimum pour pouvoir avoir du code plus lisible c'est de posséder les fonctions `map`, `filter` et `fold`.

Voici pourquoi avec une comparaison.
Commençons par un programme qui converti tous les gif en png dans plusieurs répertoires projets contenant tous des répertoires resources.
Avant :

Avant ⇒

<code class="zsh">
# for each directory in projects dir
for toProject in /path/to/projects/*(/N); do
    # toProject is /path/to/projects/foo
    # project become foo (:t for tail)
    project=${toProject:t}
    for toResource in $toProject/resources/*.gif(.N); do
        convert $toResource ${toResource:r}.png && \
        \rm -f $toResource
    done
done
</code>

- Le `(/N)` permet de sélectionner seulement les répertoires sans casser la boucle s'il n'y a pas de "match".
- Le `(.N)` permet de sélection seulement les fichiers, aussi sans tout arréter s'il ne trouve rien.
- Le `:t` signfie "tail" ; si `toto=/path/to/file.ext` alors `${toto:t}=file.ext`.

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

Before ⇒

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

After ⇒

<code class="zsh">
contain_no_s() { print $1 | grep -v s }

function verify_file_name {                               
    local project=$1:t
    contains_project_name() { print $1:t | grep $project }
    map "print -- X" $(filter contains_project_name $1/*(.N))
}

map verify_file_name $( filter contain_no_s Projects/* )
</code>

La première version peu paraître plus facile à lire.
Mais la seconde est plus bien supérieure en terme d'architecture.
Je ne veux pas discuster ici pourquoi c'est mieux.
Je vous demande simplement de me croire quand je dis que l'approche fonctionnelle est supérieure.

Actuellement il me manque une fonction lambda, si quelqu'un à une idée elle serait la bienvenue. 
Je ne sais pas encore comment créer facilement des fonctions anonymes.

Voici le code source :

<code class="zsh" file="functional.sh">
#!/usr/bin/env zsh

# Provide higer-order functions 

# usage:
#
# $ foo(){print "x: $1"}
# $ map foo a b c d
# x: a
# x: b
# x: c
# x: d
function map {
    local func_name=$1
    shift
    for elem in $@; print -- $(eval $func_name $elem)
}

# $ bar() { print $(($1 + $2)) }
# $ fold bar 0 1 2 3 4 5
# 15
# -- but also
# $ fold bar 0 $( seq 1 100 )
function fold {
    if (($#<2)) {
        print -- "ERROR fold use at least 2 arguments" >&2
        return 1
    }
    if (($#<3)) {
        print -- $2
        return 0
    } else {
        local acc
        local right
        local func_name=$1
        local init_value=$2
        local first_value=$3
        shift 3
        right=$( fold $func_name $init_value $@ )
        acc=$( eval "$func_name $first_value $right" )
        print -- $acc
        return 0
    }
}

# usage:
#
# $ baz() { print $1 | grep baz }
# $ filter baz titi bazaar biz
# bazaar
function filter {
    local predicate=$1
    local result
    typeset -a result
    shift
    for elem in $@; do
        if eval $predicate $elem >/dev/null; then
            result=( $result $elem )
        fi
    done
    print $result
}
</code>
