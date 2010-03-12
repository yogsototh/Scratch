-----
# Built-in
filters_pre:
    - erb

# Custom 
title: Curriculum Vitæ
multiTitle:
    fr: Curriculum Vitæ
    en: Resume
multiSubTitle: 
    fr: résumé rapide
    en: Short Abstract
menupriority: 1

-----

<div style="text-align: center">
<div class="fr">
<a href="/Scratch/files/cv.pdf">
<img class="inside" src="/Scratch/img/about/cv/cv.png" alt="preview cv"/>
&darr; La version pdf
</a>
</div>
<div class="en">
<a href="/Scratch/files/cv_en.pdf">
<img class="inside" src="/Scratch/img/about/cv/cv.png" alt="preview cv"/>
&darr; pdf version
</a>
</div>
</div>

newcorps

<h1>
    Expérience professionnelle
    
</h1>
<fr>
    <desc Expérience professionnelle>
    <small>depuis</small> 2007 : Consultant Airfrance, Astek, Sophia Antipolis  ::
    2006-2007 : Post Doctorat au Laboratoire Hubert Curien, Saint-etienne ::
    2004-2006 : ATER, Attaché Temporaire d'Enseignement et de Recherche  ::
    2001-2004 : Allocataire Moniteur (Étudiant ayant reçu une bourse ministérielle ainsi qu'une bourse permettant d'enseigner en faculté)  ::
    1999-2000 : Vacataire (enseignant pour DEUG) ::
    </desc>
</fr>

<en>
    <desc Professionnal background>
    from 2007 : Airfrance consultant, Astek, Sophia Antipolis, France ::
    2006-2007 : Post PhD in the Laboratory Hubert Curien, Saint-Etienne, France ::
    2004-2006 : ATER, (College Degree Teacher)  ::
    2001-2004 : Allocataire Moniteur (PhD student with a grant + a teach grant)  ::
    1999-2000 : College degree teaching ::
    </desc>
</en>

newcorps

<h1> 
    Formation
    
</h1>

<fr>
    <desc>
    2004 : Doctorat en informatique au 
        <a href="http://www.lif.univ-mrs.fr"><abbr title="Laboratoire d'Informatique Fondamentale">LIF</abbr></a>, 
        <a href="http://www.up.univ-mrs.fr/"> Université de Provence</a>,
        Marseille (France) ::
    2001 : DEA d'informatique ::
    2000 : Maîtrise d'informatique ::
    1999 : Licence d'informatique ::
    1998 : DEUG MIAS (Mathématiques) ::
    1995 : BAC S option mathématiques ::
    </desc>
</fr>
<en>  
    <desc>
    2004 : PhD Degree in computer science in the 
        <a href="http://www.lif.univ-mrs.fr"><abbr title="Laboratoire d'Informatique Fondamentale">LIF</abbr></a>,
        <a href="http://www.up.univ-mrs.fr/"> Université de Provence</a>,
        Marseille (France) ::
    2001 : DEA in computer science ::
    2000 : Maîtrise in computer science ::
    1999 : Licence in computer science ::
    1998 : DEUG MIAS (Math) ::
    1995 : BAC S ::
    </desc>
</en>

newcorps

<h1>
     Activités de recherche 
    
    
</h1>

<h4>
    Domaines 
    
</h4>
    <en> 
    <ul> 
        <li>Machine Learning, </li> 
        <li>Data Mining, </li> 
        <li>Grammatical Inference </li> 
    </ul>  
    </en> 
    <fr> 
        <ul> 
        <li>Apprentissage automatique ; </li> 
        <li>Fouille de données ; </li> 
        <li>Inférence grammaticale </li> 
        </ul> 
    </fr>

    <h4>
         Objets étudiés
        
    </h4>

    <en>
    <ul>
        <li>Markov chains,</li>
        <li>Hidden Markov Models, </li>
        <li>Multiplicity Automata, </li> 
        <li>Weighted Transducer, </li>
        <li>Tree Weighted Automata, </li>
        <li>Tree Edit Distance</li>
    </ul>  
    </en>
    <fr>
    <ul>
        <li>Chaînes de Markov Cachées ; </li>
        <li>Automates à multiplicité ; </li> 
        <li>Transducteurs pondérés ; </li>
        <li>Automates d'arbres pondérés ; </li>
        <li>Distances d'edition d'arbres</li>
    </ul>
    </fr>

<h4>
     Principaux résultats théoriques 
    
</h4>
    <ul class="long">
        <li> 
         Algorithme d'inférence d'automates à multiplicité
        qui identifie l'ensemble des langages stochastiques rationels à la 
        limite avec probabilité 1,  
        
        </li>
        <li>
         savoir si un MA engendre une
        distribution de probabilité est indécidable (était ouvert depuis 1977), 
        
        </li>
        <li> 
         Algorithme d'inférence d'une sous-classe
        non déterministe des <abbr title="Hidden Markov Model">HMM</abbr> qui identifie à la limite avec probabilité 1  
        
        </li>

    </ul>

<h2>
      Outils réalisés 
     
</h2>

<h4><a href="http://yann.esposito.free.fr/sedil.php">SEDiL</a></h4>
<p>
<a href="http://yann.esposito.free.fr/sedil.php?lang=fr">SEDiL</a> : 
    Programme destiné à apprendre des distances d'éditions entre 
    des arbres.  Érit en JAVA (librairie SWING) 
    (11 000 lignes commentaires javadoc compris) ; 


</p>

<p>
 principales fonctionnalités : 

</p>
    <ul class="petit">
        <li>
         apprentissage de matrices de coûts 
        d'éditions, 
        
        </li>
        <li>
         calcul de distance d'édition entre
        arbres ou séquences de caractères, 
        
        </li>
        <li>
         
        visualisation d'arbres ou de séquences, 
        
        </li>
        <li>
         
        classification en utilisant les K plus proches
        voisins,
        
        </li>
        <li>
         
        Génération d'échantillons de couples d'arbres, 
        
        </li>
    </ul>

    <h4> <a href="http://yann.esposito.free.fr/dees.php">DEES</a> </h4>

    <fr>
    <a href="http://yann.esposito.free.fr/dees.php?lang=fr">DEES</a> :
    Programme d'inférence d'automates à multiplicité 
    écrit en C++ (7<small>500</small> lignes, 10<small>000</small> avec les commentaires) ; 
    </fr>
    <en>
    <a href="http://yann.esposito.free.fr/dees.php">DEES</a>:
    Software of Multiplicity Automata inference 
    written in C++ (7.500 lines, 10.000 with comments) ; 
    </en>
    <p>
    Principales fonctionnalités : 
    
    </p>
    <ul class="petit">
        <li>
         Inférence d'automates à multiplicité, 
        
        </li>
        <li>
         Inférence d'automates probabilistes 
        résiduels (inférence de Chaînes de Markov cachées ; 
        apprentissage des paramètres et de la <b>structure</b>), 
        
        
        </li>
        <li>
        
        Inférence d'automates probabilistes déterministes, 
        
        </li>
        <li>
         Algorithme de Baum Welch
        (Apprentissage des paramètres d'un 
        <a href="http://fr.wikipedia.org/wiki/Automate_de_Markov_%C3%A0_%C3%A9tats_cach%C3%A9s">
            <abbr title="Hidden Markov Model">HMM</abbr></a> à partir
        d'un échantillon de séquences), 
        
        </li>
        <li>
         Exportation au format 
        <a href="http://www.graphviz.org">GraphViz</a>, 
        
        </li>
        <li>
         
        Génération d'échantillons à partir d'un MA, 
        
        </li>
        <li> et biens d'autres... </li>
    </ul>

newcorps

<h1>
     Publications scientifiques 
    
</h1>

<desc>

     Journaux internationaux 
    
    : 
    [Fundamenta&nbsp;Informaticæ,&nbsp;2008] 
    [Pattern&nbsp;Recognition,&nbsp;2004] 
    ::

     Journaux nationaux 
    
    : 
    [JEDAI&nbsp;2003] 
    ::

Conférences internationales

: 
        [ECML&nbsp;2008] [ICGI&nbsp;2006] [COLT&nbsp;2006] [COLT&nbsp;2004] 
        [ICALP&nbsp;2003] [ICGI&nbsp;2002] ::
    
    
    Conférences nationales  : [CAp'06] [CAp'04] [CAp'03] ::
    Workshop                : [TAGI'05] ::
     Rapport de thèse 
    
        : [Université&nbsp;de&nbsp;Provence&nbsp;2004] ::
</desc>

newcorps

<h1>
     Compétences 
    
</h1>

<desc>

     Langages de programmation 
    
:
    <ul class="strong horizontal">
        <li> Perl,          </li>
        <li> Ruby,          </li>
        <li> Awk,           </li>
        <li> Python,        </li>
        <li> Java,          </li>
        <li> C++,           </li>
        <li> C,             </li>
        <li> Objective-C,   </li>
        <li> PHP,           </li>
        <li> scripts shell (zsh et bash), </li>
        <li> LaTeX, ConTeXt, Metapost     </li>
    </ul>
    <ul class="horizontal">
        <li> CamL </li>
    </ul>
::

    WEB :
    <ul class="horizontal">
        <li> HTML, </li>
        <li> XHTML, </li>
        <li> CSS, </li>
        <li> SVG,  </li>
        <li> PHP,  </li>
        <li> MySQL,  </li>
        <li> PostGreSQL </li>
    </ul>
::

     Réseaux 
    
:
    <ul class="horizontal">
        <li> Ethernet, </li>
        <li> TCP/IP, </li>
        <li> UDP, </li>
        <li> DHCP, </li>
        <li> DNS, </li>
        <li> tcpdump, </li>
        <li> ethereal, </li>
        <li> VPN </li>
    </ul>
::

     Sécurité 
    
:
    <ul class="horizontal">
        <li>
         Cryptographie, 
        
        </li>
        <li> PGP, GPG, </li>
        <li> 
         Réseaux Anonymes, 
        
        </li>
        <li> Sécurité des réseaux</li>
    </ul>
::

     Gestion de projet 
    
:
    <ul class="horizontal">
        <li> UML, </li>
        <li> Merise, </li>
        <li> SVN, </li>
        <li> CVS </li>
    </ul>
::

    API
:
    <ul class="horizontal">
        <li> System V, </li>
        <li> POSIX, </li>
        <li> STL (C++), </li>
        <li> Cocoa (Mac OS X) </li>
    </ul>
::

     Outils 
    
:
    <ul class="horizontal">
        <li> Entreprise Miner (SAS), </li>
        <li> Weka, </li>
        <li> Quartz Composer </li>
    </ul>
::

     Méthodes d'apprentissage 
    
:
    <ul class="horizontal small">
        <li>
        
        Selection&nbsp;d'attributs, 
        
        
        </li>
        <li>
        Naïve&nbsp;Bayes, 
        </li>
        <li>
        
        Arbres&nbsp;de&nbsp;décisions, 
        
        
        </li>
        <li>
        
        K&nbsp;plus&nbsp;proches&nbsp;voisins (KPP), 
        
        
        </li>
        <li>
        
        Chaînes&nbsp;de&nbsp;Markov (bigrammes,&nbsp;trigrammes,&nbsp;...),  
        
        
        </li>
        <li>
        
        Chaînes&nbsp;de&nbsp;Markov&nbsp;cachées (<abbr title="Hidden Markov Model">HMM</abbr>), 
        
        
        </li>
        <li>
        
        Réseaux&nbsp;de&nbsp;neurones (Perceptron&nbsp;multicouches), 
        
        
        </li>
        <li>
        SVM,
        </li>
        <li>
        Boosting 
        </li>
    </ul>
::

</desc>

newcorps

<h1>
     Divers 
    
</h1>

<h4>
     Projet réseaux 
    
</h4>

<p>
     
    J'ai conçut avec 
    <a href="http://www.lif.univ-mrs.fr/~egodard"> Emmanuel Godard </a>
    un protocole de 
    <a href="http://www.lif.univ-mrs.fr/~esposito/enseignement/rez0.php">
        réseaux anonymes</a>. 
    
    
</p>

<h4>
     Développements Mac 
    
</h4>
<p>
     Parmis les
        <a href="/YBlog/Softwares.html" >programmes pour Mac</a> que j'ai
        réalisé ; certains sont disponibles au public.
    
    
</p>

<h4> Web  </h4>
<p>
    <%= lnkto("Vous pouvez voir ici les détails sur la création de ce site web","/blog/nanoc"); %>.
    
</p>
