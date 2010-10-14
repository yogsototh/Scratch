-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-10-14T11:04:58+02:00
title: S'amuser avec un .wav
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----

begindiv(intro)


<%= tlal %> Je me suis amusé à lire un fichier `wav`. Le `C` fut le langage le mieux adapté à ce traitement. Bien meilleur que Ruby par exemple.
enddiv


J'ai eu besoin de calculer la somme des valeurs absolue des données d'un fichier `wav`.
Pour des raison d'efficacité (et aussi de fun), j'ai fait le programme en `C`.


Celà faisait longtemps que je n'avais pas programmé en `C`.
De mémoire il était peu aisé de manipuler des fichiers.
Mais je dois concéder que j'ai été étonné de la clarté du code que j'ai obtenu.


Tout d'abord, un fichier `wav` se compose d'un entête qui contient pas mal de meta données.
Cet entête a été optimisé pour prendre peu de place.
Donc on discute de l'entête avec des nombres d'octets :


- Les 4 premiers octets doivent contenir `RIFF` en ASCII ;
- les 4 octects suivant correspondent à un entier codé sur 32 bits qui donne la taille du fichier moins 8 octets. etc..


Etonnamment je pense que lire ce type de fichier avec un langage de haut niveau aurait été plus pénible qu'en C.
La preuve, il m'a suffit de chercher sur le net le format complet de l'entête et de l'écrire dans un struct.

<code class="c">
struct wavfile
{
    char    id[4];          // should always contain "RIFF"
    int     totallength;    // total file length minus 8
    char    wavefmt[8];     // should be "WAVEfmt "
    int     format;         // 16 for PCM format
    short   pcm;            // 1 for PCM format
    short   channels;       // channels
    int     frequency;      // sampling frequency
    int     bytes_per_second;
    short   bytes_by_capture;
    short   bits_per_sample;
    char    data[4];        // should always contain "data"
    int     bytes_in_data;
};
</code>


Si j'avais eu à faire ça en Ruby, je pense qu'il m'aurait fallu pour chaque bloc de l'entête écrire un bout de code de lecture du bon nombre d'octets.
Alors qu'en `C` il m'a suffit d'écrire: 

<code class="c">
fread(&header,sizeof(header),1,wav);
</code>


Et en une seule étape ma structure de donnée a été remplie avec les valeurs souhaitées. Magique !


Ensuite, récupérer un entier à partir de deux octets n'est pas non plus une opération naturelle dans les nouveaux langages de programmation.
Alors qu'en `C`. Pour récupérer un entier codé sur 16 bits il suffit d'écrire :

<code class="c">
short value=0;
while( fread(&value,sizeof(value),1,wav) ) {
    // do something with value
}
</code>


Finallement je suis arrivé au code suivant, sachant que le format de wav était connu, avec notamment échantillonage sur 16 bits en 48000Hz :

<code class="c" file="wavsum.c">
#include <stdio.h>
#include <stdlib.h>

struct wavfile
{
    char    id[4];          // should always contain "RIFF"
    int     totallength;    // total file length minus 8
    char    wavefmt[8];     // should be "WAVEfmt "
    int     format;         // 16 for PCM format
    short   pcm;            // 1 for PCM format
    short   channels;       // channels
    int     frequency;      // sampling frequency
    int     bytes_per_second;
    short   bytes_by_capture;
    short   bits_per_sample;
    char    data[4];        // should always contain "data"
    int     bytes_in_data;
};

int main(int argc, char *argv[]) {
    char *filename=argv[1];
    FILE *wav = fopen(filename,"rb");
    struct wavfile header;

    if ( wav == NULL ) {
        fprintf(stderr,"Can't open input file %s", filename);
        exit(1);
    }


    // read header
    if ( fread(&header,sizeof(header),1,wav) < sizeof(header) )
    {
        fprintf(stderr,"Can't read file header\n");
        exit(1);
    }
    if (    header.id[0] != 'R'
         || header.id[1] != 'I' 
         || header.id[2] != 'F' 
         || header.id[3] != 'F' ) { 
        fprintf(stderr,"ERROR: Not wav format\n"); 
        exit(1); 
    }

    fprintf(stderr,"wav format\n");

    // read data
    long sum=0;
    short value=0;
    while( fread(&value,sizeof(value),1,wav) ) {
        // fprintf(stderr,"%d\n", value);
        if (value<0) { value=-value; }
        sum += value;
    }
    printf("%ld\n",sum);
    exit(0);
}
</code>


Bien entendu ce code n'est qu'un _hack_.
Mais on voit bien comment on peut facilement améliorer ce code, ajouter des cas possibles par exemple.
Comme je dis souvent : le bon outil pour la bonne tâche.
On voit en effet que pour cette tâche `C` est bien supérieur à Ruby par exemple.


Je serai curieux de savoir s'il existe un manière plus propre en Ruby que je ne connais pas.
Certainement qu'en Python ça doit être la cas.
