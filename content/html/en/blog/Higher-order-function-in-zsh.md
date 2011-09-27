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

<%= tldr %> some simple implementation of higher order function for zsh.

enddiv




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


<code class="zsh">
gif_to_png() { convert $1 ${1:r}.png && \rm -f $1 }
handle_resources() { map gif_to_png $1/resources/*.gif(.N) }
map handle_resources /path/to/projects/*(/N)
</code>





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
