#!/usr/bin/env zsh

for rep in output/Scratch/{en,fr,assets}(/N); do
    print -- "Suppression de $rep"
    \rm -rf $rep
done
print -- "Le site est complètement nettoyé"
