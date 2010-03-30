-----

# Custom 
isHidden:       false
menupriority:   30
kind:           article
created_at:           2009-11-12T11:39:54+02:00
title: The Adventure Begins
multiTitle: 
    fr: Liste de commandes
    en: Command List
tags:
  - git

-----

# Liste de commandes

## Les commandes pour chaque choses

Dans la première partie, nous avons vu la liste des problèmes résolus par [Git][git]. En résumé Git doit pouvoir :


<fr>
- récupérer les modifications des autres ;
- envoyer ses modifications aux autres ;
- revenir dans le temps ;
- lister les différences entre chaque version ;
- nommer certaines versions pour s'y référer facilement ;
- afficher l'historique des modifications ;
- savoir qui a fait quoi et quand ;
- gérer des conflits ;
- manipuler facilement des branches.
</fr>
<en>
- get others modifications,
- send modifications to others,
- get back in time,
- list differences between each version,
- name some versions in order to refer easily to them,
- write an historic of modifications,
- know who did what and when,
- manage conflicts,
- easily manage branches.
</en>

### récupérer les modifications des autres

<code class="zsh">
$ git pull
</code>

### envoyer ses modifications aux autres

<code class="zsh">
$ git push
</code>

ou plus généralement


<code class="zsh">
$ git pull
$ git push
</code>

### revenir dans le temps

#### Pour toute l'arborescence

<code class="zsh">
$ git checkout
</code>

<code class="zsh">
$ git revert
</code>

revenir trois versions en arrière


<code class="zsh">
$ git uncommit 3
</code>

Revenir avant le dernier merge (s'il s'est mal passé).


<code class="zsh">
$ git revertbeforemerge
</code>

#### Pour un seul fichier

<code class="zsh">
$ git checkout file
$ git checkout VersionHash file
$ git checkout HEAD~3 file
</code>

### lister les différences entre chaque version

liste les fichier en cours de modifications

<code class="zsh">
$ git status
</code>

fr:différences entre les fichier de la dernière version et les fichiers locaux.

<code class="zsh">
$ git diff
</code>

liste les différences entre les fichier d'une certaine version et les fichiers locaux.

<code class="zsh">
$ git diff VersionHash fichier
</code>

### nommer certaines versions pour s'y référer facilement

<code class="zsh">
$ git tag 'toto'
</code>

### afficher l'historique des modifications

<code class="zsh">
$ git log
$ git lg
$ git logfull
</code>

### savoir qui a fait quoi et quanden:know who did what and when::

<code class="zsh">
$ git blame fichier
</code>

### gérer des conflits

<code class="zsh">
$ git conflict
</code>

### manipuler facilement des branches

Pour créer une branche : 


<code class="zsh">
$ git branch branch_name
</code>

Pour changer de branche courante : 


<code class="zsh">
$ git checkout branch_name
</code>

[git]: http://git-scm.org "Git"
