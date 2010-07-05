-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-07-05T13:49:04+02:00
fr: title: Cappuccino ou jQuery ?
en: title: Cappuccino vs jQuery
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

en: <abbr title="Too long; don't read">tl;dr</abbr>:
en: 
en: * Tried to make [YPassword](http://yannesposito.com/Softwares/YPassword.html) in jQuery and with Cappuccino.
en: * Cappuccino nice in desktop brower but 1.4MB, not compatible with iPhone.
en: * jQuery not as nice as the cappuccino version but 106KB. iPhone compatible.
en: * If Dashcode 3 application are portable not only on webkit this should be the end of projects like Cappuccino and Sproutcore.

fr: <abbr title="Trop long à lire">tlàl</abbr>:
fr: 
fr: * J'ai essayé de faire une version de [YPassword](http://yannesposito.com/Softwares/YPassword.html) en jQuery et avec Cappuccino.
fr: * Cappuccino est très bien sur les navigateurs non mobile mais l'application pèse 1.4Mo et n'est pas compatible avec l'iPhone.
fr: * la version jQuery n'est pas aussi jolie que la version réalisée avec Cappuccino mais elle pèse seulement 106Ko et est compatible avec l'iPhone.
fr: * Si les applications réalisées avec Dashcode 3 sont portables sur les navigateurs non basés sur webkit cela peut sonner le glas de projets comme Cappuccino et Sproutcore.

enddiv

en: I made a web version of my dashboard widget [YPassword](http://yannesposito.com/Softwares/YPassword.html).
en: It is a simple widget to manage your online password with a *strong* security and with a totally portable way. It is not intended to replace a *keychain*.
en: It is more a password generator.
fr: J'ai fait une version web de mon widget [YPassword](http://yannesposito.com/Softwares/YPassword.html).
fr: C'est un simple widget qui permet d'organiser ses mots de passes en ligne avec une grande sécurité et de façon portable. 
fr: Ce n'est pas un widget créé pour remplacer le *trousseau d'accès*, mais
fr: plus un générateur de mots de passe.

en: The first was made from the code of my dashboard widget and with some jQuery.
en: You can try it [here](http://yannesposito.com/YPassword.old).
en: I then made a second version with the [Cappuccino](http://cappuccino.org). You can try it [here](http://yannesposito.com/YPassword).
fr: Le premier a été élaboré à partir du code de mon widget Mac.
fr: Vous pouvez l'essayer [ici](http://yannesposito.com/YPassword.old).
fr: J'ai ensuite fait une version avec [Cappuccino](http://cappuccino.org), que vous pouvez  essayer [ici](http://yannesposito.com/YPassword).


en: ## What this widget do?
fr: ## Que fait ce widget ?

en: I manage my password on many site with a simple method. 
en: I remember a strong master password. And my password is mainly
en: `hash(masterPassword+domainName)`.
fr: J'organise mes mots de passe avec une méthode simple.
fr: Je mémorise un mot de passe *maître*. Et mon mot de passe est alors (principalement) : 
fr: `hash(motDePasseMaitre+NomDeDomaine)`.

en: In reality I need a bit more informations to create a password:
fr: En réalité j'ai besoin d'un plus d'informations pour créer mon mot de passe :

en: * A master password,
en: * an URL,
en: * a maximal password length,
en: * the kind of output base64 or hexadecimal,
en: * how many times my password could have leaked.
fr: * Un mot de passe maître ;
fr: * une URL ;
fr: * une longeur maximale de mot de passe ;
fr: * le type de sortie (hexadécimale ou base64) ;
fr: * Combien de fois mon mot de passe a dû être changé.

en: The result password is this:
fr: Le mot de passe résultant est calculé comme suit :

<code class="ruby">
domainName=domaine_Name_Of_URL(url)
hash=sha1( masterPassword + leakedTimes + domainName )
if ( kind == 'base64' )
    hash=base64(hash)
end
return hash[0..maxlength]
</code>

en: In fact depending of websites, some give some strange constraint to your password: 
fr: En fait, selon le site web, on peut avoir des contraintes très différentes :

en: * minimal length, 
en: * maximal length,
en: * must not contain a special character, 
en: * must contain a special character, 
en: * etc...
fr: * longueur minimale ;
fr: * longueur maximale ;
fr: * ne doit pas contenir de caractères spéciaux ;
fr: * doit contenir des caractères spéciaux ;
fr: * etc...

en: And if you want to change your password the *leak number* is here for that.
en: All informations such as user name, maximal length can be stored in a public file. The only real secret is the master password.
fr: Et si vous souhaitez changer votre mot de passe, le nombre de changement sert à ça.
fr: Toutes les informations peuvent rester publiques sans trop de danger à l'exception du mot de passe principal.

en: If you want to know even more details you can always look at some of my old blog entries: 
fr: Si vous souhaitez avoir encore plus de détails vous pouvez toujours lire certaines de mes anciens articles de blog (en anglais) :

* [simple portable password management](http://yannesposito.com/YBlog/Computer/Entr%C3%A9es/2008/7/30_Easy%2C_secure_and_portable_password_management_system.html)
* [base64](http://yannesposito.com/YBlog/Computer/Entrées/2009/3/15_Shorter_Password_with_the_same_efficiency.html)
* [change your password](http://yannesposito.com/YBlog/Computer/Entr%C3%A9es/2009/4/11_Be_able_to_change_your_password.html)

## Cappuccino

en: First, I'd like to say Cappuccino applications look simply awesome. 
en: It is like having a Cocoa application in your web browser. 
en: And this is *great*.
fr: Tout d'abord je voudrais dire que les applications réalisées avec Cappuccino sont tout simplement incroyables.
fr: C'est comme avoir une application Mac dans son navigateur.

en: I also must admit I enjoyed making my application with Cappuccino. 
en: It is like programming for an iPhone application. 
en: If you are a bit familiar with Cocoa, you feel at home. 
en: If you don't know anything about Cocoa, I suggest you to look at it. 
en: This is a really _great_ framework to make User Interface.
en: I am not a specialist, but I have done some MFC, java Swing[^1] and WXWindows User Interfaces (some years ago).
en: And I must say, Cocoa is far better than those.
fr: Je dois aussi admettre que j'ai pris du plaisir a écrire mon application avec Cappuccino.
fr: C'est comme programmer une application Mac ou iPhone.
fr: Si vous connaissez bien Cocoa, vous vous sentirez comme *à la maison*.
fr: Si vous ne connaissez pas Cocoa, je vous conseille de vous y intéresser.
fr: Il s'agit vraiment d'un framework excellent pour faire des interfaces utilisateur.
fr: Je ne suis pas un spécialiste de tous les frameworks.
fr: Mais j'ai réalisé des Interfaces Utilisateurs avec les MFC, Java Swing[^1] et WXWindows il y a quelques années.
fr: Et je dois dire que Coco est bien meilleurs que tous ces framework.

en: [^1]: If you are interrested you can take a look at [SEDiL](http://labh-curien.univ-st-etienne.fr/informatique/SEDiL/). I am proud of the tree drawing view made from scratch.
fr: [^1]: Si ça vous intéresse vous pouvez jeter un coup d'œil à [SEDiL](http://labh-curien.univ-st-etienne.fr/informatique/SEDiL/). Je suis assez fier de la vue automatique des arbres que j'ai programmé sans librairie de départ.

en: Cappuccino is a great web application oriented development.
en: But there was also some drawbacks
fr: Cappuccino est un framework spécialisé dans le développement d'application web vraiment exceptionnel. Mais il a aussi quelques défauts qui ont surgit lors de l'écriture de mon widget.

en: Things I liked:
fr: Les choses qui m'ont plu :

en: * It looks great
en: * It was fun to program
en: * It was like programming a Mac application
en: * I could have done the User Interface using [Interface Builder](http://developer.apple.com/technologies/tools/xcode.html).
fr: * Le résultat est vraiment très beau
fr: * C'était très agréable de programmer
fr: * Comme programmer une application Mac
fr: * J'aurai pu utiliser [Interface Builder](http://developer.apple.com/technologies/tools/xcode.html) pour créer l'interface.

en: Some things I didn't like:
fr: Les choses qui ne m'ont pas plu :

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
