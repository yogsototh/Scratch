-----

# Custom 
isHidden:       false
menupriority:   1
kind:           article
created_at:           2009-09-11T14:35:35+02:00
title: Synchronize Custom WebSite with mobileMe
multiTitle: 
    fr: Héberger son site personnel sur le site mobileMe
    en: Synchronize Custom WebSite with mobileMe
multiDescription:
    fr: pas de description.
    en: no description.
tags:
  - Apple
  - mobileme
  - WebDav
  - synchronisation
  - zsh
  - script

-----

# mise à jour du <small>28/10/2009</small>

J'ai mis à jour mon script [avec une version incrémentale](/Scratch/multi/blog/2009-10-28-custom-website-synchronisation-with-mobileme--2-) bien plus pratique.
En plus depuis l'écriture de cet article Apple(c) semble avoir nettement amélioré la vitesse de ses serveurs en Europe.


newcorps

# WebDav terror


En France l'iDisk d'Apple(c) est très lent. La vitesse d'upload me rapelle l'époque des modem 56k, c'est dire. La plupart du temps les opérations telles que lister le contenu d'un répertoire prennent au moins 30 secondes (pour 15 éléments). Renommer un répertoire échoue presque systématiquement.



Apple(c) utilise des serveurs WebDav pour héberger les fichiers. Le protocole fonctionne sur le port 80 (comme http). Je me suis rendu compte qu'utiliser WebDav via https fontionne bien mieux (2 à 3 fois plus rapide avec moins d'erreurs). Mais, ça reste quand même très lent et insuffisant.



J'*uploade* mes fichiers à partir de mon Mac et de temps en temps à partir d'un PC sous Ubuntu (iDisk monté avec webdavfs).


# Synchroniser de façon sûre


Voici le script que j'utilise pour synchroniser mon site web (non créé avec iWeb(c)) avec le maximum de sécurité. Chaque opération est répétée jusqu'à ce qu'elle fonctionne.



Les idées sont : 

  - Synchroniser vers un répertoire temporaire sur le serveur distant, puis "swapper" les noms des répertoires. Ainsi le site ne reste indisponible que le temps du "swap" du nom des deux répertoires.
  - Réitérer toutes les opérations jusqu'à ce qu'elle aient réussi (par exemple pour le renommage)


Jusqu'ici j'utilise `rsync` qui n'est en fait pas plus efficace qu'une simple copie `cp` avec WebDav. Je devrais utiliser une méthode pour mémoriser les changements entre chaque publication.



En réalité quand je suis sur mon Mac j'utilise [Transmit](http://www.panic.com/transmit) qui est vraiment très bien et surtout beaucoup plus efficace que le finder pour synchroniser des fichiers. Ensuite, je ne fait que le "swap" des répertoires.



Mon script prend un paramètre `-s` pour ne faire que le "swap". Il prend aussi une option `-a` pour envoyer le fichier `index.html` qui va rediriger vers ma nouvelle page principale (iWeb(c) à la fâcheuse habitude de le remplacer).



Pour utiliser le script vous devriez remplacer la valeur de la variable `mobileMeUser` par votre nom d'utilisateur mobileMe(c).


<div class="fr">
<code class="zsh" file="publish">
#!/usr/bin/env zsh

# Script synchronisant le site sur me.com
# normalement, le site est indisponible le moins de temps possible
# le temps de deux renommages de répertoire

mobileMeUser="yann.esposito"
siteName="siteName"

# Depending of my hostname the 
if [[ $(hostname) == 'ubuntu' ]]; then
    iDisk='/mnt/iDisk'
else
    iDisk="/Volumes/$mobileMeUser"
fi

root=$HOME/Sites/$siteName
destRep=$iDisk/Web/Sites/$siteName

[[ ! -d $root ]] && { 
    print -- "$root n'existe pas ; vérifiez la conf" >&2; 
    exit 1 
}

[[ ! -d $destRep ]] && { 
    print -- "$destRep n'existe pas, veuillez remonter le FS" >&2; 
    exit 1 
}

if [[ $1 == '-h' ]]; then
    print -- "usage: $0:h [-h|-a|-s]"
    print -- "  -a sychronise aussi l'index"
    print -- "  -h affiche l'aide"
    print -- "  -s swappe simplement les répertoires"
fi

if [[ $1 == '-a' ]]; then
    print -- "Synchronisation de l'index (${destRep:h})"
    rsync -av $root/index.html ${destRep:h}/index.html
fi

print -- "Root = $root"
print -- "Dest = $destRep"

if [[ ! $1 = '-s' ]]; then
    [[ ! -d $destRep.tmp ]] && mkdir $destRep.tmp
    print -P -- "%B[Sync => tmp]%b"
    result=1
    essai=1
    while (( $result > 0 )); do
        rsync -arv $root/Scratch/ $destRep.tmp
        result=$?
        if (( $result > 0 )); then
            print -P -- "%BEchec du rsync%b (essai n°$essai)" >&2
        fi
        ((essai++))
    done
fi

# SWAP
print -P -- "%B[Swap des Répertoires (tmp <=> target)]%b"
essai=1
while [[ -e $destRep.old ]]; do
    print -n -- "suppression de $destRep.old"
    if ((essai>1)); then 
        print " (essai n°$essai)"
    else
        print
    fi
    ((essai++))
    \rm -rf $destRep.old
done

print -- "  renommage du repertoire sandard vers le .old"
essai=1
while [[ -e $destRep ]]; do
    mv $destRep $destRep.old 
    (($?)) && print -- "Echec du renommage (essai n°$essai)" >&2
    ((essai++))
done

print -- "  renommage du repertoire tmp (nouveau) vers le standard"
print -P -- "  %BSite Indisponible%b $(date)"
essai=1
while [[ ! -e $destRep ]]; do
    mv $destRep.tmp $destRep
    (($?)) && print -P -- "%B[Site Indisponible]%b(essai n°$essai) Echec du renommage (mv $destRep.tmp $destRep)" >&2
    ((essai++))
done

print -P -- "\t===\t%BSITE DISPONIBLE%b\t==="

print -- "  renommage du repertoire old vers le tmp"
essai=1
while [[ ! -e $destRep ]]; do
    mv $destRep.old $destRep.tmp
    (($?)) && print -P -- "Echec du renommage n°$essai" >&2
    ((essai++))
done

print -P -- "  publication terminée"
</code>
</div>
