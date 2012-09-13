-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-09-28T15:15:23+02:00
en: title: Higher order function in zsh
fr: title: Fonctions d'ordre supérieur en zsh
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - zsh
  - map
  - foldr
  - filter
  - functional
  - programming
  - higher order functions
-----
blogimage("main.jpg","Title image")

begindiv(intro)

en: UPDATE: [Nicholas Sterling had discovered a way to implement anonymous functions](http://nicholassterling.wordpress.com/2012/03/30/a-zsh-map-function/)
en: Thanks!
en: 
en: With this last version you should use `map` if you use external function.
en: `mapl` to use lambda function. And `mapa` for arithmetic operations.
en: 
en: Example: 
fr: UPDATE: [Nicholas Sterling a découvert un moyen de faire des fonctions anonymes](http://nicholassterling.wordpress.com/2012/03/30/a-zsh-map-function/) 
fr: Merci!
fr: 
fr: Avec cette dernière version vous pouvez utiliser `map` si vous utilisez
fr: des fonctions déclarées. `mapl` pour les fonctions anonymes 
fr: et `mapa` pour les fonctions arithmétiques.
fr: 
fr: Exemple :

<code class="zsh">
$ filterl 'echo $1|grep a >/dev/null' ab cd ef ada
ab
ada

$ folda '$1+$2' {1..5}
15

$ folda '$1*$2' {1..20}
2432902008176640000

$ mapl 'echo X $1:t Y' ~/.zsh/functional/src/*
X each Y
X filter Y
X fold Y
X map Y

$ mapa '$1*2' {1..3}
2
4
6

$ mapl 'echo result $1' $(mapa '$1+5' $(mapa '$1*2' {1..3}))
result 7
result 9
result 11

</code>

en: %tldr some simple implementation of higher order function for zsh.
fr: %tlal des fonctions d'ordres supérieurs en zsh.

enddiv

en: Why is it important to have these functions?
en: Simply because, the more I programmed with zsh the more I tended to work using functional programming style.
fr: Tout d'abord, pourquoi c'est important d'avoir ces fonctions. 
fr: Plus je programmais avec zsh plus j'essayais d'avoir un style fonctionnel.

en: The minimal to have better code are the functions `map`, `filter` and `fold`.
fr: Le minimum pour pouvoir avoir du code plus lisible c'est de posséder les fonctions `map`, `filter` et `fold`.

en: Let's compare.
en: First a program which convert all gif to png in many different directories of different projects.
fr: Voici pourquoi avec une comparaison.
fr: Commençons par un programme qui converti tous les gif en png dans plusieurs répertoires projets contenant tous des répertoires resources.
fr: Avant :

fr: Avant ⇒
en: Before ⇒

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

en: - The `(/N)` means to select only directory and not to crash if there isn't any.
en: - The `(.N)` means to select only files and not to crash if there isn't any.
en: - The `:t` means tail; if `toto=/path/to/file.ext` then `${toto:t}=file.ext`.
fr: - Le `(/N)` permet de sélectionner seulement les répertoires sans casser la boucle s'il n'y a pas de "match".
fr: - Le `(.N)` permet de sélection seulement les fichiers, aussi sans tout arréter s'il ne trouve rien.
fr: - Le `:t` signfie "tail" ; si `toto=/path/to/file.ext` alors `${toto:t}=file.ext`.

en: After ⇒
fr: Après

<code class="zsh">
gif_to_png() { convert $1 ${1:r}.png && \rm -f $1 }

handle_resources() { map gif_to_png $1/resources/*.gif(.N) }

map handle_resources /path/to/projects/*(/N)
</code>

en: No more bloc!
en: It might be a little bit harder to read if you're not used to functional programming notation.
en: But it is more concise and robusts.
fr: Plus de bloc ! 
fr: Oui, c'est un poil plus difficile à lire pour les non initiés. 
fr: Mais c'est à la fois plus concis et plus robuste.

en: Another example with some tests.
fr: Et encore ce code ne possède pas de test.
fr: Recommençons sur le même principe.

en: Find all files in project not containing an `s` which their name contains their project name:
fr: Trouver les fichiers des projets qui ne contiennent pas de s dans leur nom qui ont le même nom que leur projet.

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

en: Also, the first verstion is a bit easier to read. 
en: But the second one is clearly far superior in architecture.
en: I don't want to argue why here. 
en: Just believe me that the functional programming approach is superior.
fr: La première version peu paraître plus facile à lire.
fr: Mais la seconde est plus bien supérieure en terme d'architecture.
fr: Je ne veux pas discuster ici pourquoi c'est mieux.
fr: Je vous demande simplement de me croire quand je dis que l'approche fonctionnelle est supérieure.

fr: Actuellement il me manque une fonction lambda, si quelqu'un à une idée elle serait la bienvenue. 
fr: Je ne sais pas encore comment créer facilement des fonctions anonymes.
en: Actually I lack the lambda operator. 
en: If someone has an idea on how to create anonymous functions, just tell me, thanks.

en: Here is the (first version[^1]) source code:
fr: Voici le code source (de la première version[^1]) :

en: [^1]: As stated in the intro, if you want to install it, just go [there](https://github.com/yogsototh/zsh_functional).
fr: [^1]: Comme précisé dans l'introduction, si vous voulez l'installez allez plutôt voir dans ce [repository](https://github.com/yogsototh/zsh_functional).

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
