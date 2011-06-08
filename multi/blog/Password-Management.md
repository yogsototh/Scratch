-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2011-05-18T13:14:28+02:00
en: title: 40 character's passwords
fr: title: Password Management
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----
<%= blogimage("main.png","Title image") %>

<% password="P45sW0r|)" %>

begindiv(intro)

en: <%= tldr %> How I manage safely my password with success for some years now.  
en: **`sha1( password + domain_name )`**  
en: I memorize only one password.
en: I use a different password on all website.

fr: <%= tlal %> Une méthode de gestion des mots de passes que j'utilise avec succès depuis quelques années.  
fr: **`sha1( mot_de_passe + nom_de_domaine )`**  
fr: Je ne mémorise qu'un seul mot de passe de très bonne qualité.
fr: J'utilise des mots de passe différents sur tous les sites.

enddiv

en: Disclamer, this is an unashamed attempt to make you download my iPhone app ;-). 
en: You're always here?
en: Even if you won't download my app, you should read more.
en: My method doesn't necessitate my app.
en: It is both safe and easy to use everyday.

fr: Avant de commencer, je tiens à préciser qu'il s'agit d'une tentative de vous vendre mon appli iPhone ;-).
fr: 
fr: Vous êtes toujours là ?
fr: Bon, d'accord, même si vous ne téléchargez pas mon application vous pouvez quand même utiliser ma méthode.
fr: Elle est à la fois très sûre et simple à utiliser.

en: If you just want to _use_ the tools without searching to understand why it is safe, just jump at the [end of this article by clicking here](#in-practice).

fr: Si vous souhaitez simplement _utiliser_ le système sans essayer de comprendre comment ça marche derrière vous pouvez [aller à la fin de cet article en cliquant ici](#en-pratique-).

en: ## Why you should use a Password Manager?
fr: ## Pourquoi devriez-vous utiliser un gestionnaire de mot de passe ?

en: > Even paranoid could have ennemies.
fr: > Même les paranoïaques peuvent avoir des ennemis.

en: Imagine you find a really good password. You use it on GMail, Amazon, PayPal, Twitter, Facebook...
en: One day you see a nice online game you want to try. 
en: They ask you your email and a password.
en: Some week passes, and the host machine of this online game is hacked.
en: Your mail and password is now in bad hands.
en: Unfortunately for you, you use the same password everywhere. 
en: Then, the attacker can simply try your password everywhere. 
en: On PayPal for example.

fr: Imagniez que vous trouviez un très bon mot de passe. Vous l'utilisez sur gmail, amazon, PayPal, twitter, facebook...
fr: Un jour vous découvrez un super petit jeu en ligne très sympa.
fr: Cependant pour y jouer vous devez vous enregistrer.
fr: Le site vous demande votre email et un mot de passe.
fr: Quelques semaines/mois se passent.
fr: La machine qui héberge le jeu en ligne se fait attaquée.
fr: Maintenant, l'attaquant du site web possède votre email avec ce mot de passe.
fr: Il peut donc essayer votre mot de passe un peu partout. Sur PayPal par exemple.

en: Well now, how could we fix that?
fr: Bien, maintenant comment pouvons nous régler ce problèmes ?

en: ## Which methodology?
fr: ## Quelle méthodologie ?

en: > the good, the bad _&_ the ugly
fr: > Le bon, la brute et le truand

en: The mostly used method is to remember a subset of different passwords.
en: In the best cases, your remember about 13 password.
en: Some strong, some weak.

fr: La méthode la plus courante est de se souvenir de plusieurs mot de passes différents. 
fr: En général, si vous avez bonne mémoire vous pouvez mémoriser jusqu'à 13 mots de passes. Certain de bonne qualité, d'autre moins.

en: What to do if you use more online services 
en: than your memory can handle?

fr: Que faire si vous utilisez plus de services que vous pouvez mémoriser de mots de passe ?

en: A _bad_ solution would be to
en: chose passwords like this:

fr: Un _mauvaise_ solution peut être de choisir ses 
fr: mots de passes de la façon suivante :

en: - twitter: `<%=password%>Twitter`
en: - gmail: `<%=password%>gmail`
en: - badonlinegame: `<%=password%>badonlinegame`

fr: - twitter: `<%=password%>Twitter`
fr: - gmail: `<%=password%>gmail`
fr: - badonlinegame: `<%=password%>badonlinegame`

en: Unfortunately, if someone get your password on 
en: badonlinegame, he could easily find your other passwords.
en: Of course you can imagine some better transformation. But it is hard to find a very good one.

fr: Malheureusement, si quelqu'un récupère votre mot de passe sur 
fr: `badonlinegame`, il peut facilement retrouvez vos autres mots de passe.
fr: Bien sûr, on peut imaginer des transformation de mots de passe de meilleure qualité. 
fr: Mais il est très difficile d'en trouver une suffisamment bonne.

en: Fortunately, there exists functions which handle exactly this problem. 
en: _Hash Function_.
en: Knowing the result of a hash function, it is difficult to know what was their input.
en: For example:

fr: Fort heureusement, il existe une des fonctions bien connues dans le milieu de la sécurité informatique et qui résolvent précisément ce problème.
fr: Il s'agit des _fontions de hachages_.
fr: Il est difficile de retrouver le paramètre d'entrée d'une fonction de hachage à partir de son résultat.
fr: Prenons un exemple : 

en: <code class="zsh">
en: hash("P45sW0r|)") = 9f00fd5dbba232b7c03afd2b62b5fce5cdc7df63
en: </code>

en: If someone has `9f00fd5dbba232b7c03afd2b62b5fce5cdc7df63`,
en: he will have hard time to recover `<%=password%>`.

fr: Si quelqu'un possède `9f00fd5dbba232b7c03afd2b62b5fce5cdc7df63`,
fr: il va avoir de grande difficulté pour retrouver `<%=password%>`.

en: Let choose SHA1 as hash function. 
en: Now the password for any website should 
en: of the form:

fr: Choisisson la fonction de hashage `sha1`.
fr: Connaissant celà, le mot de passe d'un site donné doit avoir la forme :

en: <code lang="zsh">
en: sha1( master_password + domain_name )
en: </code>

en: Where:
fr: Où :

en: - `master_password` is your unique master password,
en: - `domain_name` is the domain name of the website you want the password for,

fr: - `master_password` est votre unique mot de passe _maître_ ;
fr: - `domain_name` est le nom de domaine du site pour lequel vous voulez le mot de passe.

---

en: But what about some website constraint?
en: For example regarding the length of the password?
en: What to do if you want to change your password?
en: What to do if you want number or special characters?
en: This is why, for each website I need some other parameters:

fr: Il faut aussi penser à certaines contraintes. 
fr: Certains site web veulent des mots de passe d'une certaine longueur, ni trop longs ni trop courts.
fr: Que faire si vous voulez changez votre mot de passe ? Soit parce qu'il est compromis ou simplement parce qu'on vous impose de le changer.
fr: C'est pouquoi pour chaque site on a besoin de quelques paramètres supplémentaires.

en: - the login name
en: - the password's length,
en: - the password number (in order to change it),
en: - The output format: hexadecimal or base64.

fr: - le nom de login ;
fr: - la longueur du mot de passe ;
fr: - le numéro du mot de passe (pour le changer au cas où) ;
fr: - le format du mot de passe : hexadécimal ou base64.

en: ## In practice?
fr: ## En pratique ?

en: Depending on my situation here are the tools I made _&_ use:
fr: Selon ma situation, voici les outils que j'ai fait et que j'utilise :

en: - On my Mac: 
en:   - I use the dashboard widget [YPassword](http://yannesposito.com/Scratch/files/YPassword-1.6.zip)
en:   - Sometimes, some password field are forbidden to paste into. For time like this, I use this AppleScript made tool: [ForcePaste](http://yannesposito.com/Scratch/files/forcePaste.app.zip). 
en: - On my Linux Box: I use the script [ypassword](http://github.com/yogsototh/getpass)
en: - On my iPhone: I use the [YPassword app](http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=436268354&mt=8)
en: - On any other computer:
en:   - [Cappuccino Made YPassword](http://yannesposito.com/Scratch/en/softwares/ypassword/web/) Web application
en:   - [jQuery Made YPassword](http://yannesposito.com/Scratch/en/softwares/ypassword/iphoneweb/) Web application

fr: - Sur mon Mac : 
fr:   - J'utilise le widget [YPassword](http://yannesposito.com/Scratch/files/YPassword-1.6.zip)
fr:   - Parfois, certains champs de mots passe interdisent la copie.  Dans ce cas, j'utilise un petit utilitaire en AppleScript : [ForcePaste](http://yannesposito.com/Scratch/files/forcePaste.app.zip). 
fr: - Sous mon Linux : J'utilise le script [ypassword](http://github.com/yogsototh/getpass)
fr: - Sur mon iPhone : J'utilise l'application [YPassword](http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=436268354&mt=8)
fr: - Sur tous les autres ordinateurs :
fr:   - L'application Web Cappuccino [YPassword](http://yannesposito.com/Scratch/en/softwares/ypassword/web/)
fr:   - L'application Web jQuery [YPassword](http://yannesposito.com/Scratch/en/softwares/ypassword/iphoneweb/)

en: My password are at a copy/paste on all environment I use. I have some services for which I have password of 40 characters. 
en: Now I use 10 character for most of my passwords.
en: Further more using shorter password make it even harder for an attaquer to retrieve my master password.

fr: Quelquesoit mon environnement de travail, tous mes mots de passes sont à un copier/coller.
fr: Pour certain services, j'utilise des mots de passe de 40 caractères.
fr: Actuellement j'utilise plutôt des mots de passes de 10 caractères.
fr: Avec des mots de passes plus petit, il est encore plus difficile pour un attaquant de retrouver mon mot de passe principal.

en: I would be happy to hear your thoughts on using this methodology.
fr: Je serai heureux de savoir ce que vous pensez de cette méthode. Alors n'hésitez pas à laisser un commentaire ou à m'envoyer un mail.
