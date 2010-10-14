-----
isHidden:       false
menupriority:   1
kind:           article
created_at:     2010-10-14T11:04:58+02:00
title: Fun with wav
author_name: Yann Esposito
author_uri: yannesposito.com
# tags:
-----

begindiv(intro)

<%= tldr %> Playing to process a `wav` file. `C` was easier and cleaner than Ruby.

enddiv

I had to calculate the sum of the absolute value of datas of a `.wav` file.
For efficiency (and fun) reasons, I had chosen `C` language.


It was a long time I didn't used `C`.
From my memory it was a pain to read and write to files.
But I was really impressed by how clean the code is.
And it is even more impressive knowing I used mostly low level functions.


A `wav` file has an header containing many meta-datas.
This header was optimized to take the less space possible.
Therefore, header is thinked with Bytes.


- The 4th first Bytes must contains `RIFF` in ASCII,
- the following 4th Bytes is an 32 bits integer giving the size of the file minus 8, etc...


Surprisingly, I believe read this kind of file with a higher level language would have more difficult than in `C`.
Proof: I only have to search on the web the complete header format and write it in a struct.


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

If I had to read it in Ruby (for example), I believe I'd had to write a read entry for each bloc value.
But in `C` I simply written:


<code class="c">
fread(&header,sizeof(header),1,wav);
</code>

Only one step to fill my data structure. Magic!


Then, get an int value coded on two Bytes is also not a natural operation for high level language.
In `C`, to read a sequence of 2 Bytes numbers I only had to write:


<code class="c">
int16_t value=0;
while( fread(&value,sizeof(value),1,wav) ) {
    // do something with value
}
</code>

Finally I ended with the following code. Remark I know the wav format (16 bit / 48000Hz):


<code class="c" file="wavsum.c">
#include <stdio.h>
#include <stdlib.h>

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

Of course it is only a hack. 
But we can see how easy and clean it should be to improve.
As I say often: the right tool for your need instead of the same tool for all your needs. 
Because here `C` is clearly far superior than Ruby to handle this simple tasks.


I am curious to know if somebody know a nice way to do this with Ruby or Python.

_edit: for compatibility reasons (64bit machines) used `int16_t` instead of `short` and `int32_t` instead of `int`._

