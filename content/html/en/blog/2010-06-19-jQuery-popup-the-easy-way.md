-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-06-19T00:44:50+02:00
title: jQuery popup the easy way
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - jQuery
  - javascript
  - popup
  - blog
  - web
-----
Some source code on this blog can be downloaded. 
Most of time, the code is larger than the `div` bloc. 
This is why I use a method to show this code in a large jQuery popup. 

You can try clicking the following code ; remark that the content is cutted a bit after `z-index`:

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

This code is the one I use to obtain this result.

What does it do?

At the loading of the page, I create a `div` as wide as the window. 
This `div` is a bit transparent. Then I hide it. I also take care to its `z-index` value to be sure it is behind all elements.

Then when we click on a `div` of class `code`, I copy the content into this new wide `div`, and I show it. 
Really simple but really efficient. 
No need to use a `jQuery` plugin.
