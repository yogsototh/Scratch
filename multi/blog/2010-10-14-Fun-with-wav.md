-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-10-14T11:04:58+02:00
fr: title: S'amuser avec un .wav
en: title: Fun with wav
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----

begindiv(intro)

en: <%= tldr %> Playing to process a `wav` file. `C` was easier and cleaner than Ruby.

fr: <%= tlal %> Je me suis amusé à lire un fichier `wav`. Le `C` fut le langage le mieux adapté à ce traitement. Bien meilleur que Ruby par exemple.
enddiv

en: I had to calculate the sum of the absolute value of datas of a `.wav` file.
en: For efficiency (and fun) reasons, I had chosen `C` language.

fr: J'ai eu besoin de calculer la somme des valeurs absolue des données d'un fichier `wav`.
fr: Pour des raison d'efficacité (et aussi de fun), j'ai fait le programme en `C`.

en: It was a long time I didn't used `C`.
en: From my memory it was a pain to read and write to files.
en: But I was really impressed by how clean the code is.
en: And it is even more impressive knowing I used mostly low level functions.

fr: Celà faisait longtemps que je n'avais pas programmé en `C`.
fr: De mémoire il était peu aisé de manipuler des fichiers.
fr: Mais je dois concéder que j'ai été étonné de la clarté du code que j'ai obtenu.

en: A `wav` file has an header containing many meta-datas.
en: This header was optimized to take the less space possible.
en: Therefore, header is thinked with Bytes.

fr: Tout d'abord, un fichier `wav` se compose d'un entête qui contient pas mal de meta données.
fr: Cet entête a été optimisé pour prendre peu de place.
fr: Donc on discute de l'entête avec des nombres d'octets :

en: - The 4th first Bytes must contains `RIFF` in ASCII,
en: - the following 4th Bytes is an 32 bits integer giving the size of the file minus 8, etc...

fr: - Les 4 premiers octets doivent contenir `RIFF` en ASCII ;
fr: - les 4 octects suivant correspondent à un entier codé sur 32 bits qui donne la taille du fichier moins 8 octets. etc..

en: Surprisingly, I believe read this kind of file with a higher level language would have more difficult than in `C`.
en: Proof: I only have to search on the web the complete header format and write it in a struct.

fr: Etonnamment je pense que lire ce type de fichier avec un langage de haut niveau aurait été plus pénible qu'en C.
fr: La preuve, il m'a suffit de chercher sur le net le format complet de l'entête et de l'écrire dans un struct.

<code class="c">
struct wavfile
{
    char    id[4];          // should always contain "RIFF"
    int32_t     totallength;    // total file length minus 8
    char    wavefmt[8];     // should be "WAVEfmt "
    int32_t     format;         // 16 for PCM format
    int16_t   pcm;            // 1 for PCM format
    int16_t   channels;       // channels
    int32_t     frequency;      // sampling frequency
    int32_t     bytes_per_second;
    int16_t   bytes_by_capture;
    int16_t   bits_per_sample;
    char    data[4];        // should always contain "data"
    int32_t     bytes_in_data;
};
</code>

en: If I had to read it in Ruby (for example), I believe I'd had to write a read entry for each bloc value.
en: But in `C` I simply written:

fr: Si j'avais eu à faire ça en Ruby, je pense qu'il m'aurait fallu pour chaque bloc de l'entête écrire un bout de code de lecture du bon nombre d'octets.
fr: Alors qu'en `C` il m'a suffit d'écrire: 

<code class="c">
fread(&header,sizeof(header),1,wav);
</code>

en: Only one step to fill my data structure. Magic!

fr: Et en une seule étape ma structure de donnée a été remplie avec les valeurs souhaitées. Magique !

en: Then, get an int value coded on two Bytes is also not a natural operation for high level language.
en: In `C`, to read a sequence of 2 Bytes numbers I only had to write:

fr: Ensuite, récupérer un entier à partir de deux octets n'est pas non plus une opération naturelle dans les nouveaux langages de programmation.
fr: Alors qu'en `C`. Pour récupérer un entier codé sur 16 bits il suffit d'écrire :

<code class="c">
int16_t value=0;
while( fread(&value,sizeof(value),1,wav) ) {
    // do something with value
}
</code>

en: Finally I ended with the following code. Remark I know the wav format (16 bit / 48000Hz):

fr: Finallement je suis arrivé au code suivant, sachant que le format de wav était connu, avec notamment échantillonage sur 16 bits en 48000Hz :

<code class="c" file="wavsum.c">
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct wavfile
{
    char    id[4];          // should always contain "RIFF"
    int32_t     totallength;    // total file length minus 8
    char    wavefmt[8];     // should be "WAVEfmt "
    int32_t     format;         // 16 for PCM format
    int16_t   pcm;            // 1 for PCM format
    int16_t   channels;       // channels
    int32_t     frequency;      // sampling frequency
    int32_t     bytes_per_second;
    int16_t   bytes_by_capture;
    int16_t   bits_per_sample;
    char    data[4];        // should always contain "data"
    int32_t     bytes_in_data;
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
    if ( fread(&header,sizeof(header),1,wav) < 1 )
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
    int16_t value=0;
    while( fread(&value,sizeof(value),1,wav) ) {
        // fprintf(stderr,"%d\n", value);
        if (value<0) { value=-value; }
        sum += value;
    }
    printf("%ld\n",sum);
    exit(0);
}
</code>

en: Of course it is only a hack. 
en: But we can see how easy and clean it should be to improve.
en: As I say often: the right tool for your need instead of the same tool for all your needs. 
en: Because here `C` is clearly far superior than Ruby to handle this simple tasks.

fr: Bien entendu ce code n'est qu'un _hack_.
fr: Mais on voit bien comment on peut facilement améliorer ce code, ajouter des cas possibles par exemple.
fr: Comme je dis souvent : le bon outil pour la bonne tâche.
fr: On voit en effet que pour cette tâche `C` est bien supérieur à Ruby par exemple.

en: I am curious to know if somebody know a nice way to do this with Ruby or Python.

en: _edit: for compatibility reasons (64bit machines) used `int16_t` instead of `short` and `int32_t` instead of `int`._
fr: _màj: pour des raisons de compatibilité (machines 64 bits) j'ai utilisé `int16_t` au lieu de `short` et `int32_t` au lieu de `int`.

fr: Je serai curieux de savoir s'il existe un manière plus propre en Ruby que je ne connais pas.
fr: Certainement qu'en Python ça doit être la cas.
