#!/usr/bin/env zsh

webroot=$HOME/Sites/webroot
print $webroot
print -- "Clean content's blog"
for fic in $webroot/content/html/??/blog/*(N); do
    print "[d] $fic"
    \rm -rf $fic
done
print -- "Clean multi/blog"
if [[ $(uname) = Linux ]]; then
    column=9
else
    column=9
fi
list=$(ls -lt -- $webroot/multi/blog | awk '{print $'$column'}')
nb=$(( $( print -l $list | wc -l ) - 5 ))
((nb<0)) && exit 0
res=( $( print -- $list | tail -n -$nb ) )
for fic in $res; do
    print "[d] $fic"
    \rm -rf $webroot/multi/blog/$fic
done

