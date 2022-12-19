#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

const int LINES_PER_FILE = 30000000;

int main() {
    FILE* fin = fopen("data0.txt", "r");
    if (fin == NULL)
        printf("Failed to open input!\n"), exit(EXIT_FAILURE);

    int file_num = 1;
    while (true) {
        char file_name[128];
        sprintf(file_name, "data%d.txt", file_num);

        printf("Writing to file %s\n", file_name);

        FILE* fout = fopen(file_name, "w");
        if (fout == NULL)
            printf("Failed to open output %s\n", file_name), exit(EXIT_FAILURE);

        char line_buffer[128];
        int lines_read = 0;

        while (fgets(line_buffer, 128, fin) && lines_read < LINES_PER_FILE)
            fputs(line_buffer, fout), lines_read++;

        printf("Successfully wrote %d lines to file %s\n", lines_read, file_name);
        fclose(fout);

        file_num++;
        
        if (lines_read != LINES_PER_FILE)
            break;
    }

    fclose(fin);
}