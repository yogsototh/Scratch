
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
