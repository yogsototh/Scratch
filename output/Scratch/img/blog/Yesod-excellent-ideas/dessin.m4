<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!--
     M4 Macros
define(`YTRANSFORMONE', `scale(.43) translate(-120,-70) rotate(-10)')
define(`YTRANSFORMTWO', `scale(.43) translate(20,-55) rotate(30)')
define(`YGENTRANSFORM', `translate(300,210) scale(3)')
define(`YTRANSCOMPLETE', `
    <g id="level_$1">
        <use style="opacity:.6" transform="YTRANSFORMONE" xlink:href="#level_$2" />
        <use style="opacity:.6" transform="YTRANSFORMTWO" xlink:href="#level_$2" />
    </g>
    <use transform="YGENTRANSFORM" xlink:href="#level_$1" />
')
 -->
<svg
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    width="512"
    height="512"
    id="svg2"
    version="1.1"
    >
    <metadata
        id="metadata7">
    </metadata>
    <g id="level_0">
        <text id="lambda" fill="#000000" style="font-family:Ubuntu; font-size: 100px" transform="rotate(180)">λ</text>
    </g>
    <text 
        fill="#000000" 
        style="font-family:Ubuntu; font-size: 28px; letter-spacing: -0.10em" 
        x="-17.3" 
        y="69" 
        transform="YGENTRANSFORM">esod</text>
    <!-- ROOT ELEMENT -->
    <use transform="YGENTRANSFORM" xlink:href="#level_0" />

    YTRANSCOMPLETE(1,0)
    YTRANSCOMPLETE(2,1)
    YTRANSCOMPLETE(3,2)
    YTRANSCOMPLETE(4,3)
</svg>
