#!/usr/bin/env zsh

webroot=$HOME/Sites/webroot
print $webroot
print -- "Clean content's blog"
for fic in $webroot/content/html/??/blog/*(N); do
    print "[d] $fic"
    \rm -rf $fic
done
print -- "Clean multi/blog"
list=$(ls -lt -- $webroot/multi/blog | awk '{print $9}')
nb=$(( $( print -l $list | wc -l ) - 4 ))
res=( $( print -- $list | tail -n -$nb ) )
for fic in $res; do
    print "[d] $fic"
    \rm -rf $webroot/multi/blog/$fic
done

