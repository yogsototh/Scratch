-----

# Custom 
isHidden:       false
menupriority:   1
kind:           article
created_at:           2009-10-23T10:53:16+02:00
title: launch daemon from command line
multiTitle: 
    fr: lancer un démon en ligne de commande
    en: launch daemon from command line
multiDescription:
    fr: Pour lancer une commande qui continue de tourner après la fermeture du terminal il suffit de lancer la commande <code>nohup cmd &amp;</code>
    en: To launch a command which will continu to run after the terminal is closed you only have to use <code>nohup cmd &amp;</code>
tags:
    - zsh
    - shell
    - script
    - tip

-----

Here is a tip, I don't know why, but I almost always forgot how to do that.


When you want to launch a command and this command should not be killed after you close your terminal. Here is how to accomplish that from command line: 


<code class="zsh">
nohup cmd &
</code>
<small>where <code>cmd</code> is your command.</small>
</div>

I let this command here for me and I wish it could also help someone.

