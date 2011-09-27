#!/usr/bin/env zsh

webroot=$HOME/Sites/webroot
print $webroot
print -- "Clean content's blog"
for fic in $webroot/content/html/??/blog/*(N); do
    print "[d] $fic"
    rm -rf $fic
done
print -- "Clean multi/blog"
for fic in $(print -l -- $webroot/multi/blog/*(N) | head -n -4); do
    print "[d] $fic"
    \rm -rf $fic
done

