// Message en fonction du browser
function detectIE() {
    if ($.browser["msie"]) {
        $('head').append('<script type="text/javascript" src="/Scratch/js/ie.js"></script>');
    }
}

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
    $.cookie('language',lang);
}

// select the good language and hide the message
function hideMessage() {
    setLanguage(getPageLanguage());
    $('#blackpage').fadeOut();
}

// get the language of the current page
function getPageLanguage() {
    return window.location.pathname.replace(/.*\/Scratch\/(..)\/.*$/,'$1');
}

// alert the user if its navigator configuration tell
// me it should prefer another language
function alertLanguage() {
    var language=getUserLanguage();
    var language_of_current_page=getPageLanguage();
    if (language != language_of_current_page) {
        if ( language == 'fr' ) {
            message(linkToLang('en','Aller sur la Version Française ?') + hideClickMessage('No thanks, I prefer read english.'));
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

// --- fin pour la contribution de la fin de IE ---
function detectiPhone() {
    if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i))) {
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iphone.css"/>');
        $('head').append('<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">');
        // $('head').append('<link rel="apple-touch-icon" href="images/template/engage.png"/>'); 
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iphone.css"/>');
        // $('body').attr('onorientation','updateOrientation();');
        decalageTop=0;
        // disable the animation of the menu
        initMenu=function(){};
    }
}


// initialisation du menu
var decalageTop = 10;
function entete_height() {
    return $('#entete').height() - $('#menuMessage').height() + decalageTop;
}
function hideMenu() {
    $('#content').animate({top: - entete_height()}, 500 );
    $('#menuMessage').html('↓ Menu ↓')
}
function showMenu() {
    $('#content').animate({top:"-1em"}, 500 );
    $('#menuMessage').html('↑ Menu ↑').click(hideMenu);
    last+=1;
    autoHideMenu(last);
}
function toggleMenu() {
    if ( $('#entete').css('top')==entete_height() ) {
        showMenu();
    } else {
        hideMenu();
    }
}
var last=0;
function autoHideMenu(value) {
    setTimeout(function(){
        if ( last == value ) {
            hideMenu();
        }
    },5000);
}
function initMenu() {
    $('#titre').css({top: -entete_height});
    $('#entete').append('<div id="menuMessage">↓ Menu ↓</div>');
    $('#entete').hover(showMenu);
    $('#entete').hover(function(){last+=1;}, function(){autoHideMenu(last);});
    autoHideMenu(0);
    hideMenu();
}

function setSpecificCss() {
    var userAgent = navigator.userAgent.toLowerCase();
    if ( /webkit/.test(userAgent) ) {
        $('head').append('<link rel="stylesheet" href="/Scratch/assets/css/gen_webkit.css"/>');
    } else if ( /mozilla/.test(userAgent) ) {
        $('head').append('<link rel="stylesheet" href="/Scratch/assets/css/gen_mozilla.css"/>');
    }
}


// Ce que l'on va lancer à l'init.
$(document).ready( function() {
    setSpecificCss();
    detectIE();
    detectiPhone();
    initMenu();
    // affiche la page une fois propre et la langue choisie
    if ( alertLanguage() ) {
        $('#blackpage').fadeOut();
    }
});
