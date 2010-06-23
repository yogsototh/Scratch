// initialisation du menu
var decalageTop = 10;
function entete_height() {
    return $('#entete').height() - $('#menuMessage').height() + decalageTop;
}
function fastHideMenu() {
    $('#entete').css({opacity: .2});
}
function hideMenu() {
    $('#entete').animate({opacity: .2}, 3000 );
}
function showMenu() {
    $('#entete').animate({opacity:1}, 200 );
    last+=1;
    autoHideMenu(last);
}
function fastShowMenu() {
    $('#entete').css({opacity:1});
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
    },2000);
}
function initMenu() {
    $('#titre').css({top: -entete_height});
    $('#entete').hover(showMenu);
    $('#entete').hover(function(){last+=1;}, function(){autoHideMenu(last);});
    autoHideMenu(0);
}


// Ce que l'on va lancer à l'init.
$(document).ready( function() {
    initMenu();
});
