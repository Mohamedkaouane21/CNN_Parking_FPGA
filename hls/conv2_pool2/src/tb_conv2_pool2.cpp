// tb_conv2_pool2.cpp
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "data_path.h"

#define IN_SIZE  8464   // 16*23*23
#define OUT_SIZE 3200   // 32*10*10
#define OUT_C    32
#define OUT_H    10
#define OUT_W    10
#define TOLERANCE 1e-4f

void conv2_pool2(const float *in, float *out);

int main() {
    float *input  = (float*)malloc(IN_SIZE  * sizeof(float));
    float *output = (float*)malloc(OUT_SIZE * sizeof(float));
    float *golden = (float*)malloc(OUT_SIZE * sizeof(float));

    char path[512];
    FILE *f;

    printf("--- Chargement des fichiers ---\n");

    snprintf(path, sizeof(path), "%s/input_pool1.bin", DATA_DIR);
    f = fopen(path, "rb");
    if (!f) { printf("ERROR: impossible d'ouvrir %s\n", path); return 1; }
    fread(input, sizeof(float), IN_SIZE, f); fclose(f);

    snprintf(path, sizeof(path), "%s/golden_pool2.bin", DATA_DIR);
    f = fopen(path, "rb");
    if (!f) { printf("ERROR: impossible d'ouvrir %s\n", path); return 1; }
    fread(golden, sizeof(float), OUT_SIZE, f); fclose(f);

    printf("--- Appel du kernel ---\n");
    conv2_pool2(input, output);

    printf("--- Comparaison avec golden ---\n");
    float max_diff = 0.0f;
    int max_oc = 0, max_py = 0, max_px = 0;
    int errors = 0;

    for (int oc = 0; oc < OUT_C; oc++)
        for (int py = 0; py < OUT_H; py++)
            for (int px = 0; px < OUT_W; px++) {
                int idx = oc * OUT_H * OUT_W + py * OUT_W + px;
                float diff = fabsf(output[idx] - golden[idx]);
                if (diff > max_diff) { max_diff = diff; max_oc = oc; max_py = py; max_px = px; }
                if (diff > TOLERANCE) errors++;
            }

    printf("Max diff : %.2e at [oc=%d][py=%d][px=%d]\n", max_diff, max_oc, max_py, max_px);
    printf("Erreurs  : %d / %d\n", errors, OUT_SIZE);
    printf(errors == 0 ? ">>> CSIM PASSED <<<\n" : ">>> CSIM FAILED <<<\n");

    free(input); free(output); free(golden);
    return errors;
}
