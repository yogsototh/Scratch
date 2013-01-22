#!/usr/bin/env zsh
for fic in $@; do
  tmp=${fic:r}-old.${fic:e}
  mv $fic $tmp
  convert -background 'rgba(255,255,255,0.66)' -fill white -channel Alpha -evaluate Add 0.5 -flatten $tmp $fic
  \rm -f $tmp
done
