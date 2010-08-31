-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-08-31T10:16:04+02:00
fr: title: Envoyer un mail en ligne de commande avec un fichier attaché
en: title: send mail from command line with attached file
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - email
  - shell
  - web
-----

fr: J'ai dû envoyer un mail en ligne de commande récemment. 
fr: Quelle ne fût pas ma surprise lorsque je constatais que ce n'était vraiment pas évident.
fr: Je n'avais ni `pine` ni `mutt`. Seulement `mail` et `mailx`.
en: I had to send a mail using only command line. 
en: I was surprised it isn't straightforward at all.
en: I didn't had `pine` nor `mutt` or anything like that.
en: Just `mail` and `mailx`.

fr: Ce qu'on trouve sur internet pour envoyer un mail avec fichier attaché c'est ça :
en: What Internet say (via google) is

<code class="zsh">
uuencode fic.jpg fic.jpg | mail -s 'Subject'
</code>

fr: Bon, alors, bête et discipliné j'ai essayé. 
fr: Et bien, ça marche _presque_ tout le temps. 
fr: Pour mon fichier ça n'a pas marché du tout. 
fr: Je l'ai compressé au format `.gz`, `.bz2` et `.zip`.
fr: Avec le format `.bz2` le mail reçu avait bien un fichier attaché. 
fr: Mais avec les formats `.gz` et `.zip`, ça ne fonctionnait pas. 
fr: Au lieu d'avoir un fichier attaché j'avais un message qui contenait quelque chose comme :
en: I tried it.
en: And it works almost each times.
en: But for my file, it didn't worked.
en: I compressed it to `.gz`, `.bz2` and `.zip`.
en: Using `.bz2` format it worked nicely, but not with other formats.
en: Instead of having an attached file I saw this in my email.

<pre>
begin 664 fic.jpg
M(R$O=7-R+V)I;B]E;G8@>G-H"GAL<STD,0H*9F]R(&QI;F4@:6X@)"@\("1X
M;',@*0H@("`@9&-R/20H96-H;R`D;&EN92!\(&%W:R`M1EP[("=[<')I;G0@
...
M93U<(FUO='-<(CX\=F%L=64^/&ET96T@;F%M93U<(F-T>%]M8UPB/BD\=F%L
M=64O/B@\+VET96T^*2-<)#$\=F%L=64^)&ME>7=O<F1S/"]V86QU93Y<)#(C
end
</pre>

fr: Pas très lisible. 
fr: Après pas mal de recherche j'ai trouvé la solution.
fr: Le problème c'est `uuencode` qui est une méthode qui devrait devenir obsolète pour envoyer les fichiers. 
fr: Il vaut mieux utiliser le format MIME pour envoyer des fichiers attachés.
en: Not really readable.
en: After some research I found the solution.
en: Use MIME instead of `uuencode`.

fr: Donc finalement le mieux est de faire ça "à la main" avec `sendmail`.
fr: Je n'ai quand même pas utilisé `telnet`.
fr: La commande à lancer est :
en: Finally I made it manually using `sendmail`.
en: I didn't dare to use `telnet`.
en: The command to use is:

<code class="zsh">
sendmail -t -oi < mailcontent.txt
</code>

fr: Bien entendu il faut créer le fichier `mailcontent.txt` qui contient :
en: Of course you need to create the `mailcontent.txt` file.
en: It should contains:

<pre>
From: from@mail.com
To: to@mail.com
Subject: View the attached file
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="-"

This is a MIME encoded message. Decode it with "Decoder"
or any other MIME reading software. Decoder is available
at <http://www.etresoft.com>.
---
Content-Type: image/jpeg; name="fic.jpg"
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename="fic.jpg"

H4sICB6Ke0wAA2Rjcl93aXRob3V0X2tleXdvcmQuY3N2ANSdW5ubOJPH7/e7
7Brw+dmrTk8yk7yTSTaZeWd2b/TIIGy6MRAE7ng+/VaJgwF3g522SsxN2+3T
/4eOJamqmARP+yibvI8ykUYim+x5EE2euBfIyd3byZ+fvvzr7svbu8ndTx/f
...
</pre>

fr: Et pour avoir le code il suffit de lancer la commande :
en: And to obtain the "encoded" file in base64 I used:
`uuencode -m fic.jpg fic.jpg`

fr: Et voilà. 
fr: Parfois la technique c'est tellement simple.
en: That is all.
en: Sometimes technology is so easy to use.
Si j'en ai besoin encore quelques fois, je pense que j'écrirai un émetteur de mail en shell.
