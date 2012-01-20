-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-06-19T00:44:50+02:00
fr: title: Comment faire des popups en jQuery rapidement
en: title: jQuery popup the easy way
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - jQuery
  - javascript
  - popup
  - blog
  - web
-----

fr: Voici une façon simple et rapide pour faire des popups avec jQuery.
en: Here is a fast and easy way to create jQuery popup.

<code class="javascript" file="essai.js">
// --- code popup ---
function openPopup() {
    $(this).clone(false).appendTo($("#_code"));
    $("#_code").show();
}

function closePopup() {
    $("#_code").html("");
    $("#_code").hide();
}

function initCode() {
    $(".code").click(openPopup);
    $(".code").css({cursor: "pointer"});
    $('body').append('<div id="_code"></div>');
    $('#_code').css( { 'text-align': "justify", position: "fixed", 
                        left:0, top:0, width: "100%", height: "100%", 
                        "background-color": "rgba(0, 0, 0, 0.8)", 'z-index':2000, 'padding':'3px'} );
    $('#_code').hide();
    $('#_code').click(closePopup);
}
// --- end of code popup section ---
</code>

fr: Que fait ce code ?
en: What does this code do?

fr: Au chargement de la page je crée un `div` grand comme toute la page avec un fond légèrement transparent que je cache. 
fr: Je fais bien attention à son `z-index` pour qu'il soit devant tout le reste.
en: At the loading of the page, I create a `div` as wide as the window. 
en: This `div` is a bit transparent. Then I hide it. I also take care to its `z-index` value to be sure it is behind all elements.

fr: Puis lorsque l'on clique sur un `div` de class `code`, 
fr: je recopie le contenu de celui-ci dans le grand `div` que je rend visible. 
fr: Très simple mais très efficace. 
fr: Pas besoin d'utiliser un plugin `jQuery`.
en: Then when we click on a `div` of class `code`, I copy the content into this new wide `div`, and I show it. 
en: Really simple but really efficient. 
en: No need to use a `jQuery` plugin.
