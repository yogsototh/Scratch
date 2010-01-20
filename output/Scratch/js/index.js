// Message en fonction du browser
function detectIE() {
    if ($.browser["msie"]) {
        $('head').append('<script type="text/javascript" src="/Scratch/js/ie.js"></script>');
    }
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

// Ce que l'on va lancer à l'init.
$(document).ready( function() {
    detectIE();
    detectiPhone();
    initMenu();
    // affiche la page une fois propre
    $('#blackpage').fadeOut();
});
