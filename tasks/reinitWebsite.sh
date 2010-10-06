#!/usr/bin/env zsh

for rep in output/Scratch/{en,fr,assets}(/N) output/Scratch/sitemap.xml(.N); do
    print -- "Suppression de $rep"
    git co $rep
done
print -- "Website reinit from HEAD"
