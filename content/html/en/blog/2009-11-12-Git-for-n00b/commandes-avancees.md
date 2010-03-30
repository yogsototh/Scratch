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

# Command List

## Command for each functionality

In the first part, we saw the list of resolved problem by [Git][git]. To resume [Git][git] should do:


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

### get others modifications

<code class="zsh">
$ git pull
</code>

### send modifications to others

<code class="zsh">
$ git push
</code>

or more generally

<code class="zsh">
$ git pull
$ git push
</code>

### get back in time

#### For all tree

<code class="zsh">
$ git checkout
</code>

<code class="zsh">
$ git revert
</code>


revert three version before (see my `.gitconfig` file).

<code class="zsh">
$ git uncommit 3
</code>

Undo the las merge (if something goes wrong)


<code class="zsh">
$ git revertbeforemerge
</code>

#### For one file

<code class="zsh">
$ git checkout file
$ git checkout VersionHash file
$ git checkout HEAD~3 file
</code>

### list differences between each version

list files being modified

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

### name some version to refer to them in the future

<code class="zsh">
$ git tag 'toto'
</code>

### show historic of modifications

<code class="zsh">
$ git log
$ git lg
$ git logfull
</code>

### en:know who did what and when::

<code class="zsh">
$ git blame fichier
</code>

### handle conflicts

<code class="zsh">
$ git conflict
</code>

### manage branches


To create a branch: 

<code class="zsh">
$ git branch branch_name
</code>


To change the current branch: 

<code class="zsh">
$ git checkout branch_name
</code>

[git]: http://git-scm.org "Git"
