#!/usr/bin/env zsh

source $0:h/config

if (($#<1)); then
    baseRep="$srcRep"
else
    baseRep="$1"
fi

for fic in $baseRep/**/*(.); do
    print -n -- "${fic#${baseRep}} "
    extension="$fic:e"
    if [[ $extension = "html" || $extension = "xml" ]]; then
        perl -pe 's%<a href="(&#x6d;|&#109;|m)[^>]*>[^>]*</a>%%gim' $fic | openssl sha1 
    else
        openssl sha1 < $fic
    fi
done
