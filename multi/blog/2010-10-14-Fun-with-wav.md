-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-10-14T11:04:58+02:00
fr: title: S'amuser avec un .wav
en: title: Fun with wav
author_name: Yann Esposito
author_uri: yannesposito.com
tags:
  - wav
  - C
  - format
-----

begindiv(intro)

en: <%= tldr %> Played to process a `wav` file. `C` was easier and cleaner than Ruby.

fr: <%= tlal %> Je me suis amusé à lire un fichier `wav`. Le `C` fut le langage le mieux adapté à ce traitement. Bien meilleur que Ruby par exemple.

en: edit: I wanted this program to work only on one specific machine (a x86 on a 32 bit Ubuntu). Therefore I didn't had any portability consideration. This is only a _hack_.
fr: edit: Je voulais que ce programme fonctionne sur une machine spécifique. En aucun cas je ne pensais publier ce code pour une utilisation autre que celle-ci.

enddiv

en: I had to compute the sum of the absolute values of data of a `.wav` file.
en: For efficiency (and fun) reasons, I had chosen `C` language.

fr: J'ai eu besoin de calculer la somme des valeurs absolue des données d'un fichier `wav`.
fr: Pour des raison d'efficacité (et aussi de fun), j'ai fait le programme en `C`.

en: I didn't programmed in `C` for a long time.
en: From my memory it was a pain to read and write to files.
en: But in the end I was really impressed by the code I get. 
en: It was really clean.
en: This is even more impressive knowing I used mostly low level functions.

fr: Celà faisait longtemps que je n'avais pas programmé en `C`.
fr: De mémoire il était peu aisé de manipuler des fichiers.
fr: Mais je dois concéder que j'ai été étonné de la clarté du code que j'ai obtenu.

en: A `wav` file has an header containing many metadata.
en: This header was optimized to take as few space as possible.
en: The header is then a block of packed bytes.

fr: Tout d'abord, un fichier `wav` se compose d'un entête qui contient pas mal de meta données.
fr: Cet entête a été optimisé pour prendre peu de place.
fr: Donc on discute de l'entête avec des nombres d'octets :

en: - The 4th first bytes must contains `RIFF` in ASCII,
en: - the following 4th Bytes is an 32 bits integer giving the size of the file minus 8, etc...

fr: - Les 4 premiers octets doivent contenir `RIFF` en ASCII ;
fr: - les 4 octects suivant correspondent à un entier codé sur 32 bits qui donne la taille du fichier moins 8 octets. etc..

en: Surprisingly, I believe that reading this kind of file is easier in `C` than in most higher level language.
en: Proof: I only have to search on the web the complete header format and write it in a struct.

fr: Etonnamment je pense que lire ce type de fichier avec un langage de haut niveau aurait été plus pénible qu'en C.
fr: La preuve, il m'a suffit de chercher sur le net le format complet de l'entête et de l'écrire dans un struct.

<code class="c">
struct wavfile
{
    char        id[4];          // should always contain "RIFF"
    int     totallength;    // total file length minus 8
    char        wavefmt[8];     // should be "WAVEfmt "
    int     format;         // 16 for PCM format
    short     pcm;            // 1 for PCM format
    short     channels;       // channels
    int     frequency;      // sampling frequency
    int     bytes_per_second;
    short     bytes_by_capture;
    short     bits_per_sample;
    char        data[4];        // should always contain "data"
    int     bytes_in_data;
};
</code>

en: To read this kind of data in Ruby, I certainly had to write a block of code for each element in the struct.
en: But in `C` I simply written:

fr: Si j'avais eu à faire ça en Ruby, je pense qu'il m'aurait fallu pour chaque bloc de l'entête écrire un bout de code de lecture du bon nombre d'octets.
fr: Alors qu'en `C` il m'a suffit d'écrire: 

<code class="c">
fread(&header,sizeof(header),1,wav)
</code>

en: Only one step to fill my data structure. Magic!

fr: Et en une seule étape ma structure de donnée a été remplie avec les valeurs souhaitées. Magique !

en: Then, get an int value coded on two Bytes is also not a natural operation for high level language.
en: In `C`, to read a sequence of 2 Bytes numbers I only had to write:

fr: Ensuite, récupérer un entier à partir de deux octets n'est pas non plus une opération naturelle dans les nouveaux langages de programmation.
fr: Alors qu'en `C`. Pour récupérer un entier codé sur 16 bits il suffit d'écrire :

<code class="c">
short value=0;
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
    char        id[4];          // should always contain "RIFF"
    int     totallength;    // total file length minus 8
    char        wavefmt[8];     // should be "WAVEfmt "
    int     format;         // 16 for PCM format
    short     pcm;            // 1 for PCM format
    short     channels;       // channels
    int     frequency;      // sampling frequency
    int     bytes_per_second;
    short     bytes_by_capture;
    short     bits_per_sample;
    char        data[4];        // should always contain "data"
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

en: Of course it is only a hack. 
en: But we can see how easy and clean it should be to improve.
en: As I say often: the right tool for your need instead of the same tool for all your needs. 
en: Because here `C` is clearly far superior than Ruby to handle this simple tasks.

fr: Bien entendu ce code n'est qu'un _hack_.
fr: Mais on voit bien comment on peut facilement améliorer ce code, ajouter des cas possibles par exemple.
fr: Comme je dis souvent : le bon outil pour la bonne tâche.
fr: On voit en effet que pour cette tâche `C` est bien supérieur à Ruby par exemple.

en: I am curious to know if somebody know a nice way to do this with Ruby or Python.

en: _edit: for compatibility reasons (64bit machines) used `int16_t` instead of `short` and `int` instead of `int`._
fr: _màj : pour des raisons de compatibilité (machines 64 bits) j'ai utilisé `int16_t` au lieu de `short` et `int` au lieu de `int`.

fr: Je serai curieux de savoir s'il existe un manière plus propre en Ruby que je ne connais pas.
fr: Certainement qu'en Python ça doit être la cas.

begindiv(intro)

en: Edit (2): after most consideration about portability I made an _hopefully_ more portable version. 
en: But I must confess this task was a bit tedious.
en: The code remain as readable as before.
en: But I had to use some compiler specific declaration to force the structure to be packed:

fr: Màj (2) : après toutes les remarques concernant la portabilité. 
fr: J'ai fait une nouvelle version qui devrait être plus portable.
fr: Elle fait aussi plus de test pour vérifier le fichier.
fr: Cependant j'utilise une assertion spécifique à `gcc` pour être certain que la structure de donnée n'ai pas de "trou" :

<code class="c">
__attribute__((__packed__))
</code>

en: Therefore this implementation should for big and little endian architecture. 
en: However, it must be compiled with `gcc`.
en: The new code make more tests but still don't use `mmap`.
en: Here it is:

fr: Le nouveau code n'utilise pas mmap et devrait être plus compatible.  
fr: Voici le dernier résultat :

enddiv

<code class="c" file="wavsum2.c">
#include <stdio.h>
#include <stdlib.h>
#include <string.h> // for memcmp
#include <stdint.h> // for int16_t and int32_t

struct wavfile
{
    char    id[4];          // should always contain "RIFF"
    int32_t totallength;    // total file length minus 8
    char    wavefmt[8];     // should be "WAVEfmt "
    int32_t format;         // 16 for PCM format
    int16_t pcm;            // 1 for PCM format
    int16_t channels;       // channels
    int32_t frequency;      // sampling frequency
    int32_t bytes_per_second;
    int16_t bytes_by_capture;
    int16_t bits_per_sample;
    char    data[4];        // should always contain "data"
    int32_t bytes_in_data;
} __attribute__((__packed__));

int is_big_endian(void) {
    union {
        uint32_t i;
        char c[4];
    } bint = {0x01000000};
    return bint.c[0]==1;
}

int main(int argc, char *argv[]) {
    char *filename=argv[1];
    FILE *wav = fopen(filename,"rb");
    struct wavfile header;

    if ( wav == NULL ) {
        fprintf(stderr,"Can't open input file %s\n", filename);
        exit(1);
    }


    // read header
    if ( fread(&header,sizeof(header),1,wav) < 1 ) {
        fprintf(stderr,"Can't read input file header %s\n", filename);
        exit(1);
    }

    // if wav file isn't the same endianness than the current environment
    // we quit
    if ( is_big_endian() ) {
        if (   memcmp( header.id,"RIFX", 4) != 0 ) {
            fprintf(stderr,"ERROR: %s is not a big endian wav file\n", filename); 
            exit(1);
        }
    } else {
        if (   memcmp( header.id,"RIFF", 4) != 0 ) {
            fprintf(stderr,"ERROR: %s is not a little endian wav file\n", filename); 
            exit(1);
        }
    }

    if (   memcmp( header.wavefmt, "WAVEfmt ", 8) != 0 
        || memcmp( header.data, "data", 4) != 0 
            ) {
        fprintf(stderr,"ERROR: Not wav format\n"); 
        exit(1); 
    }
    if (header.format != 16) {
        fprintf(stderr,"\nERROR: not 16 bit wav format.");
        exit(1);
    }
    fprintf(stderr,"format: %d bits", header.format);
    if (header.format == 16) {
        fprintf(stderr,", PCM");
    } else {
        fprintf(stderr,", not PCM (%d)", header.format);
    }
    if (header.pcm == 1) {
        fprintf(stderr, " uncompressed" );
    } else {
        fprintf(stderr, " compressed" );
    }
    fprintf(stderr,", channel %d", header.pcm);
    fprintf(stderr,", freq %d", header.frequency );
    fprintf(stderr,", %d bytes per sec", header.bytes_per_second );
    fprintf(stderr,", %d bytes by capture", header.bytes_by_capture );
    fprintf(stderr,", %d bits per sample", header.bytes_by_capture );
    fprintf(stderr,"\n" );

    if ( memcmp( header.data, "data", 4) != 0 ) { 
        fprintf(stderr,"ERROR: Prrroblem?\n"); 
        exit(1); 
    }
    fprintf(stderr,"wav format\n");

    // read data
    long long sum=0;
    int16_t value;
    int i=0;
    fprintf(stderr,"---\n", value);
    while( fread(&value,sizeof(value),1,wav) ) {
        if (value<0) { value=-value; }
        sum += value;
    }
    printf("%lld\n",sum);
    exit(0);
}
</code>


en: _Edit(3)_: 
en: On [reddit](http://reddit.com)
en: [Bogdanp](http://www.reddit.com/user/Bogdanp)
en: proposed a Python version:
fr: Màj(3) : 
fr: Sur [reddit](http://reddit.com)
fr: [Bogdanp](http://www.reddit.com/user/Bogdanp)
fr: a proposé une version en Python :

<code class="python" file="wavsum.py">
#!/usr/bin/env python
from struct import calcsize, unpack
from sys import argv, exit

def word_iter(f):
    while True:
        _bytes = f.read(2)

    if len(_bytes) != 2:
        raise StopIteration

    yield unpack("=h", _bytes)[0]

try:
    with open(argv[1], "rb") as f:
        wav = "=4ci8cihhiihh4ci"
        wav_size = calcsize(wav)
        metadata = unpack(wav, f.read(wav_size))

        if "".join(metadata[:4]) != "RIFF":
            print "error: not wav file."
            exit(1)

        print sum(abs(word) for word in word_iter(f))
except IOError:
    print "error: can't open input file '%s'." % argv[1]
    exit(1)
</code>


en: and [luikore](http://www.reddit.com/user/luikore)
en: proposed an impressive Ruby version:
fr: et [luikore](http://www.reddit.com/user/luikore) a proposé une version Ruby assez impressionnante :

<code class="ruby" file="wavsum.rb">
data = ARGF.read
 keys = %w[id totallength wavefmt format
       pcm channels frequency bytes_per_second
         bytes_by_capture bits_per_sample
           data bytes_in_data sum
 ]
 values = data.unpack 'Z4 i Z8 i s s i i s s Z4 i s*'
 sum = values.drop(12).map(&:abs).inject(:+)
 keys.zip(values.take(12) << sum) {|k, v|
       puts "#{k.ljust 17}: #{v}"
 }
</code>
