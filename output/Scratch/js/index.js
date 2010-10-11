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
    if (/msie/.test(userAgent) ) {
        $('body').prepend('<div id="iemessage"><p><span><em>Avec <a href="http://www.firefox.com"> Firefox </a> et <a href="http://www.apple.com/safari">Safari</a> cette page est bien plus jolie !</em></span><br/><span><em>This page is far nicer with <a href="http://www.firefox.com"> Firefox </a> and <a href="http://www.apple.com/safari">Safari</a>!</em></span></p></div>');
    } else if (/ip(od|hone)/.test(userAgent)) {
        $('head').append('<meta name="viewport" content="width=device-width; initial-scale=0.5; maximum-scale=2.0;">');
        $('head').append('<link rel="stylesheet" type="text/css" href="/Scratch/css/iPhone.css"/>');
    }
}

// Ce que l'on va lancer à l'init.
$(document).ready( function() {
    detectClient();
    initCode();
    $('#blackpage').fadeOut();
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

