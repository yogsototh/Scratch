// Message en fonction du browser
function detectIE() {
    if ($.browser["msie"]) {
        $('head').append('<script type="text/javascript" src="/Scratch/js/ie.js"></script>');
    }
}

// --- fin pour la contribution de la fin de IE ---

// Cache les div des classes langue non choisie
// et affiche les div de la classe choisie
// en gros si on choisi la langue fr et que l'on 
var currentLanguage="fr";
var languagesSet=[ 'fr', 'en' ];
function setLanguage(lang) {
    currentLanguage=lang;
    $.cookie('language',lang, { path: '/Scratch'});
    document.title = 'Yann Esposito - ' + $('#titre h1 .' + lang).text() ;
    $('.activelang').removeClass("activelang");
    $('#lang_'+lang).addClass("activelang");
    $('.'+lang).hide();
    $('.'+lang).fadeIn();
    jQuery.each(
        jQuery.grep(languagesSet, function(a) { return a != lang }),
        function (i,val) {
            $('.'+val).hide();
        }
    );
}

function setLanguageFromCookie() {
    language = $.cookie('language');
    if (! language) {
        if ( (navigator) && 
                (navigator.language) && 
                (navigator.language.substring(0,2) == 'fr' ) ) {
            language='fr';
        } else {
            language='en';
        }
    }
    setLanguage(language);
}

function detectiPhone() {
    if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i))) {
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iphone.css"/>');
        $('head').append('<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">');
        // $('head').append('<link rel="apple-touch-icon" href="images/template/engage.png"/>'); 
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iphone.css"/>');
        // $('body').attr('onorientation','updateOrientation();');
        decalageTop=0;
        initMenu=function(){};
    }
}

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

// initialisation du menu
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

// Ce que l'on va lancer à l'init.
$(document).ready( function() {
    detectIE();
    detectiPhone();
    setLanguageFromCookie();
    initMenu();
    // affiche la page une fois propre
    $('#blackpage').fadeOut();
});
