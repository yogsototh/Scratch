-----

# Custom 
# isHidden:       true
menupriority:   1
kind:           article
date:           2009-08-18T14:44:31+02:00
title: Git for self
multiTitle: 
    fr: Git en solo
    en: Git for self
multiDescription:
    fr: J'utilise Git pour des projets personnels gérés à partir de plusieurs oridinateurs. Voici comment concilier les avantages de Git avec un workflow proche de celui de SVN.
    en: I use Git for personnal projects on many differents computers. Here is how to use almost the SVN workflow with all advantages of Git.
tags:
  - git
  - svn
  - workflow

-----

<%= blogimage("central architecture","central_architecture.png") %>


I use [Git](http://www.git-scm.org/) to manage my personnal projects.
I have a centralized repository which all my computer should synchronize with.
Unfortunately I didn't find clearly what I needed on the official Git documentation.

In two words, if you want to use an SVN workflow with Git (and all its advantages) here is how to proceed.


newcorps

## Initialisation


Suppose I've got a directory on my local computer containing a project I want to manage via Git. Here what to do: 

<div>
<code class="zsh">
cd to/project/directory/
git init
git add
git commit
</code>
</div>

Now all files in the <code>to/project/directory/</code> are versionned.
If you want not to follow some just edit the file <code>.gitignore</code>
fr:Maintenant tous les fichiers du répertoire <code>to/project/directory/</code> sont *versionnés*. Si vous voulez ignorer certains fichiers il suffit de modifier le fichier <code>.gitignore</code>.

for example mine is: 

<div>
<code class="zsh">
*.swp
.DS_Store
ikog.py.bak
output/Scratch/assets
output/Scratch/en
output/Scratch/fr
output/Scratch/multi
</code>
</div>

Next, you want to put your project on a safe place on the net.


<div>
<code class="zsh">
git clone --bare . protocol://url/of/the/repository
</code>
</div>

Now on any computer you can do: 


<div>
<code class="zsh">
git clone protocol://url/of/the/repository local_directory
</code>
</div>

and <code>local_directory</code> will contain an up-to-date project.


<div class="encadre"><em>
You should make this operation also on the computer used to create the repository. Just to verify all will be okay.

</em>
</div>

newcorps

## The workflow

To resume you now have one repository on the Internet, and one or many computer associated with it. Now, what you want is to synchronize everything.



Before begining your work, the first thing to do is to get all modification from the Internet to your local host: 


<div>
<code class="zsh">
git pull
</code>
</div>

After that you can do (many times): 


<div>
<code class="zsh">
hack, hack, hack...
git add some files
git commit
</code>
</div>


When you want your local modification to be on the Internet just do a simple:



<div>
<code class="zsh">
git push
</code>
</div>

All should be ok.


If you have some trouble with the <code>push</code> and <code>pull</code> verify your <code>.git/config</code> file ; it should contain the following lines:



<div>
<code class="zsh">
...
[remote "origin"]
	url = protocol://url/of/the/repository
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
...
</code>
</div>

## Branches Synchronisation


Well, now, all seems ok, but you have to worry about two little things. Git is all about decentralisation and branches. It is very easy to manage one branch, or many branches on the same host. But synchronize branches on many hosts is not a natural operation.



This is why I created two simple scripts to automate this. One for creating a branch locally and remotely. And one to get remotely created branched on your local host.


Then when you want to create a new branch (locally and remotely) ; you simply have to do a: 


<div><code class="zsh">git-create-new-branch branch_name</code></div>

and when you are on another computer and want to get locally all the remote branches you execute: 


<div><code class="zsh">git-get-remote-branches</code></div>

Here are the code of theese two scripts: 


<div>
<code class="zsh" file="git-create-new-branch">
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

<div>
<code class="zsh" file="git-get-remote-branches">
#!/usr/bin/env zsh

# recup branches not on local
localbranches=( $(git br | sed 's/\*/ /') )
remoteMissingBranches=( $(git br -r | \
    egrep -v "origin/HEAD|(${(j:|:)localbranches})" ) )
for br in $remoteMissingBranches; do
  branch=${br#origin/}
  print "get remote branch $branch"
  git br ${branch}
  git config branch.${branch}.remote origin
  git config branch.${branch}.merge refs/heads/${branch}
done
</code>
</div>