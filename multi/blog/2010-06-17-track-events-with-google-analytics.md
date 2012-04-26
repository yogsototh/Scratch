-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-06-17T14:41:36+02:00
fr: title: Analyser les clicks sur votre Site
fr: subtitle: Utiliser Google Analytics comme un Pro
en: title: Track Events with Google Analytics
en: subtitle: Asynchronous Complete Google Analytics with jQuery
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - blog
  - javascript
  - jQuery
  - Google
  - analytics
  - analyser
fr:   - utilisateur
en:   - User
en:   - Asynchronous
fr:   - asynchrone
-----

fr: Voici comment analyser tous les clics que font vos utilisateurs sur votre blog en incluant google analytics de façon asynchrone.
en: Here is how to track all clicks on your website using google analytics asynchronously.

fr: Dans le html, il faut utiliser [jQuery](http://jquery.com) et un fichier que j'ai appelé `yga.js` :
en: First in your <sc>html</sc> you need to use [jQuery](http://jquery.com) and a javscript file I named `yga.js`:

<code class="html">
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="yga.js"></script>
</code>

fr: Voici le contenu du fichier `yga.js` :
en: And here is the `yga.js` file:

<code class="javascript" file="yga.js">
$(document).ready( function() {
    // add an event to all link for google analytics
    $('a').click(function () {
        // tell analytics to save event
        try {
            var identifier=$(this).attr('id') ;
            var href=$(this).attr('href')
            var label="";
            if ( typeof( identifier ) != 'undefined' ) {
                label=label+'[id]:'+identifier
                category='JSLink'
            }
            if ( typeof( href ) != 'undefined' ) {
                label=label+' [href]:'+href
                if ( href[0] == '#' ) {
                    category='Anchor';
                } else {
                    category='Link';
                }
            }
            _gaq.push(['_trackEvent', category, 'clicked', label]);
            // console.log('[tracked]: ' + category + ' ; clicked ; ' + label );
        }
        catch (err) {
            console.log(err);
        }

        // pause to allow google script to run
        var date = new Date();
        var curDate = null;
        do {
            curDate = new Date();
        } while(curDate-date < 300);
    });
});

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-XXXXXXXX-1']);
_gaq.push(['_trackPageview']);

(function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();
</code>

fr: Remplacez le : `UA-XXXXXXXX-1` par votre code google analytics. Maintenant l'installation est finie.
en: Replace the: `UA-XXXXXXXX-1` by your google analytics code and you're done.

fr: Pour l'utiliser il suffit de se rendre dans google analytics rubrique `Content` puis `Event Tracking` comme sur la capture d'écran suivante :
en: To see what occurs, simply go in `Content` and `Event Tracking` as shown in the following screenshot:

blogimage("GA_events.png", "Where to find events tracking in google analytics interface")

en: Happy tracking!
fr: Joyeuse inspection du comportement de vos utilisateurs.
