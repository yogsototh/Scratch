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


Une petite astuce dont je ne me souvient jamais (je ne sais pas pourquoi).


Lorsque que vous souhaitez lancer une commande qui ne soit pas tuée après la fermeture du terminal voici comment s'y prendre : 

<div><code class="zsh">
nohup cmd &
</code>
<small>où <code>cmd</code> est la commande que vous souhaitez lancer.</small>
</div>


Je laisse cette astuce ici pour moi et dans l'espoir que ça pourra aussi être utile à quelqu'un d'autre.
