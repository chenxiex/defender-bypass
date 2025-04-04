#include <stdio.h>

int main()
{
    FILE *infile;
    FILE *outfile;
    int ch; // 修改类型为 int
    infile = fopen("input.bin", "rb");
    if (infile == NULL)
    {
        printf("Error opening input file.\n");
        return 1;
    }
    outfile = fopen("output.bin", "wb");
    if (outfile == NULL)
    {
        printf("Error opening output file.\n");
        fclose(infile);
        return 1;
    }
    while ((ch = fgetc(infile)) != EOF)
    {
        ch ^= 78;
        fputc(ch, outfile);
    }
    fclose(infile);
    fclose(outfile);
    printf("File encoded successfully.\n");
    return 0;
}