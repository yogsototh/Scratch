-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-10-06T11:33:03+02:00
en: title: New Blog Design Constraints
fr: title: Contraintes du design de ce blog
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - programming
  - blog
-----

fr: Vous avez pu constater que j'ai modifié le design de mon blog.
fr: Maintenant il doit être beaucoup plus léger qu'avant.
fr: Je n'utilise plus de CSS3 et beaucoup moins de javascript.
fr: Bien entendu, même avant, mes pages étaient parfaitement lisibles sans javascript.
fr: Mais, je me suis aperçu que les systèmes de CSS3 sont loin d'être au point.
fr: J'utilisait des gradient en CSS3, ainsi que des ombres sous le texte. Ça avait un rendu très sympa. Sauf...
fr: Ce n'était pas compatible ie6, sous Chrome le rendu était d'une lenteur incroyable.
fr: J'ai donc décidé de faire un site à minima. 
fr: Je voulais qu'il soit joli _et_ le plus simple possible pour assurer sa compatibilité.
fr: Les règles que je me suis fixées sont donc:
en: I changed the design of my blog.
en: Now it should be far cleaner.
en: I believe I use no CSS3 feature and far less javascript.
en: Of course before my website was perfectly browsable without javascript. 
en: Unfortunately some CSS3 feature are not mature enough on some browser.
en: For more details you can read my older [blog entry](/Scratch/en/blog/2010-07-07-CSS-rendering-problems-by-navigator).
en: But the major problem came from, `font-shadow` and gradients.
en: Then my new design obey to the following rules:

fr: - pas d'élément CSS qui commence par `-moz` ou `-webkit`, etc... ;
fr: - pas d'ombre sous le texte pour donner une impression de profondeur ;
fr: - nettoyer pas mal le code et enlever tout ce que je peux ;
en: - no CSS element begining by '-moz' or '-webkit', etc...,
en: - no text shadow,
en: - clean (I mean delete) most javascript.

en: I hope the new design please you. 
fr: J'espère que ce nouveau design vous plaît.
