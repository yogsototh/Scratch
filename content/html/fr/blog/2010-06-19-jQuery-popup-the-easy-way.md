-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-06-19T00:44:50+02:00
title: Comment faire des popups en jQuery rapidement
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - jQuery
  - javascript
  - popup
  - blog
  - web
-----
Sur ce blog, je donne parfois la possibilité de télécharger certaines sources de code. 
Dans ce cas, le code est souvent plus large que le `div` qui le contient. 
Le texte est alors coupé.
C'est pourquoi, j'utilise une méthode qui permet d'afficher ces sources dans de grandes *popups* en jQuery.

Vous pouvez faire un essai en cliquant le code suivant ; remarquez qu'un bout du code n'est pas visible (après `z-index` normallement) :

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

Ce code est celui qui permet d'obtenir cet effet.

Que fait-il ?

Au chargement de la page je crée un `div` grand comme toute la page avec un fond légèrement transparent que je cache. 
Je fais bien attention à son `z-index` pour qu'il soit devant tout le reste.

Puis lorsque l'on clique sur un `div` de class `code`, 
je recopie le contenu de celui-ci dans le grand `div` que je rend visible. 
Très simple mais très efficace. 
Pas besoin d'utiliser un plugin `jQuery`.
