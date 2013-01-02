#!/usr/bin/env zsh
for fic in $@; do
	newname="${fic:r}-web.${fic:e}"
	convert -thumbnail 800x600\> -adaptive-sharpen 0 -quality 75% $fic $newname
	mv $fic $fic.old
	mv $newname $fic
done
