// --- code popin handling ---
function openWide() {
    $(this).clone(false).appendTo($("#_code"));
    $('#_code a').css({"margin-right":"3em"});
    $("#_code").show();
}

function returnToNormal() {
    $("#_code").html("");
    $("#_code").hide();
}

function initCode() {
    if ( ! /ip(od|hone)/.test(userAgent) ) {
        $(".code").click(openWide);
        $(".code").css({cursor: "pointer"});
        $('body').append('<div id="_code"></div>');
        $('#_code').css( { 'font-size':$('.corps:first').css('font-size'), 'text-align': "justify", position: "fixed", left:0, top:0, width: "100%", height: "100%", "background-color": "rgba(0, 0, 0, 0.8)", 'z-index':2000, 'padding':'3px'} );
        $('#_code').hide();
        $('#_code').click(returnToNormal);
    }
}
// --- end of popin code ---

// -- multilanguage handling --

// show a message to user
function message(msg) {
    $('#blackpage').css({cursor: 'auto'});
    $('#blackpage').show().html(msg);
}

// from cookie first if not, from Navigator
function getUserLanguage() {
    var language = $.cookie('language');
    if (! language) {
        if ( (navigator) && 
                (navigator.language) && 
                (navigator.language.substring(0,2) == 'fr' ) ) {
            language='fr';
        } else {
            language='en';
        }
    }
    return language;
}

// return the path of the equivalent page in another language
function pathToLanguage(lang) {
    return window.location.pathname.replace(/(.*\/Scratch\/)(..)(\/.*$)/,'$1'+lang+'$3');
}

// return the link to the equivalent page in another language
function linkToLang(lang, msg) {
    return '<a href="'+pathToLanguage(lang)+'">'+msg+'</a>';
}

// return a link that will hide the message
function hideClickMessage(msg) {
    return '<div><a onclick="hideMessage()">'+msg+'</a></div>';
}

// put the selected language in the cookie
function setLanguage(lang) {
    $.cookie('language',lang, { path: '/Scratch'});
}

// select the good language and hide the message
function hideMessage() {
    setLanguage(getPageLanguage());
    $('#blackpage').fadeOut();
}

// get the language of the current page
function getPageLanguage() {
    var lang=window.location.pathname.replace(/.*\/Scratch\/(..).*$/,'$1');
    if ( lang == window.location.pathname ) {
        return "";
    }
    else {
        return lang;
    }
}

// alert the user if its navigator configuration tell
// me it should prefer another language
function alertLanguage() {
    var language=getUserLanguage();
    var language_of_current_page=getPageLanguage();
    if ( language_of_current_page == "" ) {
        return true;
    }
    if (language != language_of_current_page) {
        if ( language == 'fr' ) {
            message(linkToLang('fr','Aller sur la Version Française ?') + hideClickMessage('No thanks, I prefer read english.'));
        } else if (language == 'en') {
            message(linkToLang('en','Go to English Version?')+ hideClickMessage('Non merci, je préfère le français.'));
        } else {
            // don't know which language the user prefer
            message(linkToLang('en','Go to English Version?')+'<br/>'+linkToLang('fr','Version Française ?') + hideClickMessage('Non merci, je préfère le français.'));
        }
        return false;
    }
    return true;
}
// --- end for language ---

// Google analytics
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
    // if ( /chrome/.test(userAgent) ) {
    //     $('head').append('<link rel="stylesheet" href="/Scratch/assets/css/gen_chrome.css"/>');
    // } else if ( /webkit/.test(userAgent) ) {
    //     $('head').append('<link rel="stylesheet" href="/Scratch/assets/css/gen_webkit.css"/>');
    // } else if ( /mozilla/.test(userAgent) ) {
    //     $('head').append('<link rel="stylesheet" href="/Scratch/assets/css/gen_mozilla.css"/>');
    // } else 
        if (/msie/.test(userAgent) ) {
        $('head').append('<script type="text/javascript" src="/Scratch/js/ie.js"></script>');
    } else if (/ip(od|hone)/.test(userAgent)) {
        $('head').append('<meta name="viewport" content="width=device-width; initial-scale=0.5; maximum-scale=2.0;">');
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iPhone.css"/>');
    }
}

// Ce que l'on va lancer à l'init.
$(document).ready( function() {
    detectClient();
    initCode();
    // affiche la page une fois propre et la langue choisie
    if ( alertLanguage() ) {
        $('#blackpage').fadeOut();
    }
    analytics();
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

