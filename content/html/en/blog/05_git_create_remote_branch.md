-----

# Custom 
# isHidden: true
kind: article
menupriority: 1
date: 2009-08-17T14:00:00+02:00
title: Git remote branch creation
multiTitle: 
    fr: Création de branches avec Git
    en: Git branch Creation
multiDescription:
    fr: J'utilise Git pour synchroniser des projets personnels.  C'est pourquoi quand je crée une branche locale je souhaite quasiment toujours qu'elle soit aussi créée en <em>externe</em> (remote).<br/>Voici le script que j'utilise pour accomplir cette tâche ...
    en: I use git to synchronize personnal projects.  Therefore, most of time, when I create a local branch I want it to be created remotely.<br/>Here is the script I use to achieve that&hellip;
tags:
  - git
  - branch
  - local
  - remote

-----

## easiest remote Git branch creation



I use git simply to synchronize stuff for personnal projects.
Therefore, when I create a local branch I want most of time this
branch to be created remotely.



Here is the script I use to achieve that: 

<div>
    <code class="zsh" file="git-create-new-branch.sh">
#!/usr/bin/env zsh

if (($#<1)); then
    print -- "usage: $0:t branch_name" >&2
    exit 1
fi

branch=$1
git br ${branch}
git co ${branch}
git config branch.${branch}.remote origin
git config branch.${branch}.merge refs/heads/${branch}
    </code>
</div>


Of course, I suppose <code>origin</code> is already configured.
