-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-05T13:49:04+02:00
title: Cappuccino ou jQuery ?
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - Cappuccino
  - iPhone
  - web
  - javascript
  - jQuery
  - Cocoa
  - programming
-----

begindiv(intro)


<abbr title="Trop long à lire">tlàl</abbr>:

* J'ai essayé de faire une version de [YPassword](http://yannesposito.com/Softwares/YPassword.html) en jQuery et avec Cappuccino.
* Cappuccino est très bien sur les navigateurs non mobile mais l'application pèse 1.4Mo et n'est pas compatible avec l'iPhone.
* la version jQuery n'est pas aussi jolie que la version réalisée avec Cappuccino mais elle pèse seulement 106Ko et est compatible avec l'iPhone.
* Si les applications réalisées avec Dashcode 3 sont portables sur les navigateurs non basés sur webkit cela peut sonner le glas de projets comme Cappuccino et Sproutcore.

enddiv

J'ai fait une version web de mon widget [YPassword](http://yannesposito.com/Softwares/YPassword.html).
C'est un simple widget qui permet d'organiser ses mots de passes en ligne avec une grande sécurité et de façon portable. 
Ce n'est pas un widget créé pour remplacer le *trousseau d'accès*, mais
plus un générateur de mots de passe.

Le premier a été élaboré à partir du code de mon widget Mac.
Vous pouvez l'essayer [ici](http://yannesposito.com/YPassword.old).
J'ai ensuite fait une version avec [Cappuccino](http://cappuccino.org), que vous pouvez  essayer [ici](http://yannesposito.com/YPassword).


## Que fait ce widget ?

J'organise mes mots de passe avec une méthode simple.
Je mémorise un mot de passe *maître*. Et mon mot de passe est alors (principalement) : 
`hash(motDePasseMaitre+NomDeDomaine)`.

En réalité j'ai besoin d'un plus d'informations pour créer mon mot de passe :

* Un mot de passe maître ;
* une URL ;
* une longeur maximale de mot de passe ;
* le type de sortie (hexadécimale ou base64) ;
* Combien de fois mon mot de passe a dû être changé.

Le mot de passe résultant est calculé comme suit :

<code class="ruby">
domainName=domaine_Name_Of_URL(url)
hash=sha1( masterPassword + leakedTimes + domainName )
if ( kind == 'base64' )
    hash=base64(hash)
end
return hash[0..maxlength]
</code>

En fait, selon le site web, on peut avoir des contraintes très différentes :

* longueur minimale ;
* longueur maximale ;
* ne doit pas contenir de caractères spéciaux ;
* doit contenir des caractères spéciaux ;
* etc...

Et si vous souhaitez changer votre mot de passe, le nombre de changement sert à ça.
Toutes les informations peuvent rester publiques sans trop de danger à l'exception du mot de passe principal.

Si vous souhaitez avoir encore plus de détails vous pouvez toujours lire certaines de mes anciens articles de blog (en anglais) :

* [simple portable password management](http://yannesposito.com/YBlog/Computer/Entr%C3%A9es/2008/7/30_Easy%2C_secure_and_portable_password_management_system.html)
* [base64](http://yannesposito.com/YBlog/Computer/Entrées/2009/3/15_Shorter_Password_with_the_same_efficiency.html)
* [change your password](http://yannesposito.com/YBlog/Computer/Entr%C3%A9es/2009/4/11_Be_able_to_change_your_password.html)

## Cappuccino

Tout d'abord je voudrais dire que les applications réalisées avec Cappuccino sont tout simplement incroyables.
C'est comme avoir une application Mac dans son navigateur.

Je dois aussi admettre que j'ai pris du plaisir a écrire mon application avec Cappuccino.
C'est comme programmer une application Mac ou iPhone.
Si vous connaissez bien Cocoa, vous vous sentirez comme *à la maison*.
Si vous ne connaissez pas Cocoa, je vous conseille de vous y intéresser.
Il s'agit vraiment d'un framework excellent pour faire des interfaces utilisateur.
Je ne suis pas un spécialiste de tous les frameworks.
Mais j'ai réalisé des Interfaces Utilisateurs avec les MFC, Java Swing[^1] et WXWindows il y a quelques années.
Et je dois dire que Coco est bien meilleurs que tous ces framework.

[^1]: Si ça vous intéresse vous pouvez jeter un coup d'œil à [SEDiL](http://labh-curien.univ-st-etienne.fr/informatique/SEDiL/). Je suis assez fier de la vue automatique des arbres que j'ai programmé sans librairie de départ.

Cappuccino est un framework spécialisé dans le développement d'application web vraiment exceptionnel. Mais il a aussi quelques défauts qui ont surgit lors de l'écriture de mon widget.

Les choses qui m'ont plu :

* Le résultat est vraiment très beau
* C'était très agréable de programmer
* Comme programmer une application Mac
* J'aurai pu utiliser [Interface Builder](http://developer.apple.com/technologies/tools/xcode.html) pour créer l'interface.

Les choses qui ne m'ont pas plu :

* I made some time to understand how to handle the 'onChange' on the text fields.
* Documentation lacked a bit of organisation.
* It doesn't work on iPhone.
* It weighted 11MB to deploy.
* It weight 1.3MB to load.

I didn't use bindings because I believe they are not ready by now.

## jQuery

The jQuery version of YPassword is not as finished as the Cappuccino one. Because, there is no *slider* directly with jQuery. I'd have to use jQueryUI. And I believe, using it will make the application weight far more than the today 106KB.

To make this version I simply copied my widget source code and adapted it. It was straightforward. But jQuery is not an *application oriented framework*. It is more a "*darkside* javascript animation framework"[^2].

[^2]: I don't want to feel like a *troll* I use jQuery to make some *darkside* animation on this blog. But the javascript on my blog is not needed except for commenting.

I don't have too much to say about the jQuery version. But this was way more *low level* programming than Cappuccino.

## My conclusion

My conclusion over these two framework is. 
If you want to make an iPhone compatible web application just don't use Cappuccino yet.
If you want to make *simple* application like mine, I also believe, Cappuccino is a bit too much.

If you want to make a complex web oriented application, Cappuccino is a great choice. 
But you may have some difficulties to begin programming with it.

Finally, to terminate my web version of my widget, I'll give a try to Dashcode 3. 
It seems to be a good alternative to create web widgets.
I don't know if dashcode 3 is portable on non webkit browser.
But if it is, it could be the end of projects like Cappuccino and Sproutcore.
