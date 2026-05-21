// ============================================================
// tb_conv2_pool2.cpp - Testbench csim pour conv2_pool2
// ============================================================
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include "data_path.h"

static constexpr int   IN_SIZE   = 8464;   // 16*23*23
static constexpr int   OUT_SIZE  = 3200;   // 32*10*10
static constexpr int   OUT_C     = 32;
static constexpr int   OUT_H     = 10;
static constexpr int   OUT_W     = 10;
static constexpr float TOLERANCE = 1e-4f;

void conv2_pool2(const float *in, float *out);

static int load_bin(const char *path, float *dst, int n) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        printf("ERROR: impossible d'ouvrir %s\n", path);
        return -1;
    }
    const size_t r = fread(dst, sizeof(float), (size_t)n, f);
    fclose(f);
    if ((int)r != n) {
        printf("ERROR: '%s' : lu %zu floats, attendu %d\n", path, r, n);
        return -1;
    }
    return 0;
}

int main() {
    float *input  = (float *)malloc((size_t)IN_SIZE  * sizeof(float));
    float *output = (float *)malloc((size_t)OUT_SIZE * sizeof(float));
    float *golden = (float *)malloc((size_t)OUT_SIZE * sizeof(float));

    if (!input || !output || !golden) {
        printf("ERROR: allocation memoire impossible\n");
        free(input);
        free(output);
        free(golden);
        return 1;
    }

    int rc = 0;
    char path[512];

    printf("--- Chargement des fichiers ---\n");

    snprintf(path, sizeof(path), "%s/input_pool1.bin", DATA_DIR);
    if (load_bin(path, input, IN_SIZE) != 0) {
        rc = 1;
        goto cleanup;
    }

    snprintf(path, sizeof(path), "%s/golden_pool2.bin", DATA_DIR);
    if (load_bin(path, golden, OUT_SIZE) != 0) {
        rc = 1;
        goto cleanup;
    }

    printf("--- Appel du kernel ---\n");
    conv2_pool2(input, output);

    printf("--- Comparaison avec golden ---\n");
    {
        float max_diff = 0.0f;
        int   max_oc   = 0;
        int   max_py   = 0;
        int   max_px   = 0;
        int   errors   = 0;

        for (int oc = 0; oc < OUT_C; oc++) {
            for (int py = 0; py < OUT_H; py++) {
                for (int px = 0; px < OUT_W; px++) {
                    const int   idx  = oc * OUT_H * OUT_W + py * OUT_W + px;
                    const float diff = fabsf(output[idx] - golden[idx]);
                    if (diff > max_diff) {
                        max_diff = diff;
                        max_oc   = oc;
                        max_py   = py;
                        max_px   = px;
                    }
                    if (diff > TOLERANCE) {
                        errors++;
                    }
                }
            }
        }

        printf("Max diff : %.2e at [oc=%d][py=%d][px=%d]\n",
               max_diff, max_oc, max_py, max_px);
        printf("Erreurs  : %d / %d\n", errors, OUT_SIZE);
        printf(errors == 0 ? ">>> CSIM PASSED <<<\n" : ">>> CSIM FAILED <<<\n");
        rc = errors;
    }

cleanup:
    free(input);
    free(output);
    free(golden);
    return rc;
}
