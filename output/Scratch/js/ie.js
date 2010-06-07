$('link[rel=stylesheet]').each(function(i)
{
    initMenu=function(){};
    // if (this.getAttribute('href') == '/Scratch/assets/css/layout.css') this.disabled = true;
    if (this.getAttribute('href') == '/Scratch/css/shadows.css') { 
        this.disabled = true;
    }
    // if (this.getAttribute('href') == '/Scratch/assets/css/gen.css') {
    //     this.disabled = true;
    // }
}) ;
$('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/ie.css"/>');
$('body').prepend('<div id="iemessage"><p><span><em>Avec <a href="http://www.firefox.com"> Firefox </a> et <a href="http://www.apple.com/safari">Safari</a> cette page est bien plus jolie !</em></span><br/><span><em>This page is far nicer with <a href="http://www.firefox.com"> Firefox </a> and <a href="http://www.apple.com/safari">Safari</a>!</em></span></p></div>');
