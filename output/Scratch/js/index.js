function initCode() {
    if ( ! /ip(od|hone)/.test(userAgent) ) {
        if (! /chrome/.test(userAgent) ) {
            // Disable animation in chrome
            // It seems they have some progress to do :(
            $('head').append('<link rel="stylesheet" href="/Scratch/assets/css/dynamic.css" type="text/css" />');
        }
    }
}

// --- Google analytics ---
function analytics() {
    var admin = $.cookie('admin');
    if (! admin) {
        // console.log("you're logged by google analytics");
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
    } else {
        console.log("[WARNING] you're HIDDEN to analytics");
    }
}

var userAgent;

function detectClient() {
    userAgent = navigator.userAgent.toLowerCase();
    /*
    if (/msie/.test(userAgent) ) {
        $('body').prepend('<div id="iemessage"><p><span><em>Avec <a href="http://www.firefox.com"> Firefox </a>, <a href="http://www.apple.com/safari">Safari</a> ou <a href="http://google.com/chrome">Chrome</a> cette page est bien plus jolie !</em></span><br/><br/><span><em>This page is far nicer when opened with <a href="http://www.firefox.com"> Firefox </a>, <a href="http://www.apple.com/safari">Safari</a> or <a href="http://google.com/chrome">Chrome</a>!</em></span></p></div>');
    }*/ 
    if (/ip(od|hone)/.test(userAgent)) {
        $('head').append('<meta name="viewport" content="width=device-width; initial-scale=0.5; maximum-scale=2.0;">');
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iPhone.css"/>');
    }
    return userAgent;
}

// $(document).ready(function(){
//     var msgh1=$('#titre h1').html();
//     var msgh2=$('#titre h2').html();
//     var msgintro=$('.corps').html();
//     if (!msgh1) { msgh1=""; }
//     if (!msgh2) { msgh2=""; }
//     if (!msgintro) { msgintro=""; }
//     $('#blackpage').prepend('<div class="preh1">'+msgh1+'</div>');
//     $('#blackpage').prepend('<div class="preh2">'+msgh2+'</div>');
//     $('#blackpage').append('<div class="preintro"><div class="corps">'+msgintro+'</div></div>');
// });

// Ce que l'on va lancer à l'init.
$(document).ready(function() {
    var client=detectClient();
    if ( ! /msie/.test(client) ) { initCode(); }
    $('#blackpage').fadeOut('slow',function(){ $('#blackpage').remove(); });
    analytics();
});

$(window).bind("load", function() {
	// lorsque toutes les ressources ont ete chargees
    if (/windows/.test(navigator.userAgent.toLowerCase())) {
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/windows.css"/>');
	} else {
		$('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/assets/css/cmu.css"/>');
	}
});


// --- Google Analytics ---
if ( ! $.cookie('admin') ) {
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-10612400-1']);
    _gaq.push(['_trackPageview']);

    (function() {
     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();
} else {
    console.log("[WARNING] you're HIDDEN to analytics");
}

