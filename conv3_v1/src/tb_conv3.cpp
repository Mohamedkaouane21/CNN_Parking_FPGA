#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "data_path.h"

#define IN_SIZE  3200
#define OUT_SIZE 4096
#define TOLERANCE 1e-4f

void conv3(const float *in, float *out);

int main() {
    float *input  = (float*)malloc(IN_SIZE  * sizeof(float));
    float *output = (float*)malloc(OUT_SIZE * sizeof(float));
    float *golden = (float*)malloc(OUT_SIZE * sizeof(float));

    printf("--- Chargement ---\n");
    char path[512]; FILE *f;
    snprintf(path, sizeof(path), "%s/input_pool2.bin", DATA_DIR);
    f = fopen(path, "rb"); if (!f) { printf("ERROR: %s\n", path); return 1; }
    fread(input, sizeof(float), IN_SIZE, f); fclose(f);

    snprintf(path, sizeof(path), "%s/golden_conv3.bin", DATA_DIR);
    f = fopen(path, "rb"); if (!f) { printf("ERROR: %s\n", path); return 1; }
    fread(golden, sizeof(float), OUT_SIZE, f); fclose(f);
    printf("input=%d floats, golden=%d floats\n", IN_SIZE, OUT_SIZE);

    printf("--- Kernel ---\n");
    conv3(input, output);

    printf("--- Comparaison ---\n");
    float max_diff = 0.0f; int errors = 0;
    int max_i = 0;
    for (int i = 0; i < OUT_SIZE; i++) {
        float d = fabsf(output[i] - golden[i]);
        if (d > max_diff) { max_diff = d; max_i = i; }
        if (d > TOLERANCE) errors++;
    }
    printf("Max diff : %.2e  at [%d]\n", max_diff, max_i);
    printf("Erreurs  : %d / %d\n", errors, OUT_SIZE);
    if (errors == 0) printf(">>> CSIM PASSED <<<\n");
    else             printf(">>> CSIM FAILED <<<\n");

    free(input); free(output); free(golden);
    return errors;
}
