// ============================================================
// tb_conv1_pool1.cpp - Testbench csim pour conv1_pool1
// ============================================================
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include "data_path.h"

static constexpr int   IN_H      = 48;
static constexpr int   IN_W      = 48;
static constexpr int   OUT_C     = 16;
static constexpr int   OUT_H     = 23;
static constexpr int   OUT_W     = 23;
static constexpr int   IN_SIZE   = IN_H * IN_W;
static constexpr int   OUT_SIZE  = OUT_C * OUT_H * OUT_W;
static constexpr float TOLERANCE = 1e-4f;

void conv1_pool1(const float *in, float *out);

static int load_bin(const char *path, float *dst, int n) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        printf("ERROR: cannot open '%s'\n", path);
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
    static float input [IN_SIZE];
    static float output[OUT_SIZE];
    static float golden[OUT_SIZE];

    char p_in[1024];
    char p_golden[1024];
    snprintf(p_in,     sizeof(p_in),     "%s/input_48x48.bin",  DATA_DIR);
    snprintf(p_golden, sizeof(p_golden), "%s/golden_pool1.bin", DATA_DIR);

    printf("--- Chargement des fichiers ---\n");
    if (load_bin(p_in,     input,  IN_SIZE)  != 0) return 1;
    if (load_bin(p_golden, golden, OUT_SIZE) != 0) return 1;

    printf("--- Appel du kernel ---\n");
    conv1_pool1(input, output);

    printf("--- Comparaison avec golden ---\n");
    int   errors   = 0;
    float max_diff = 0.0f;
    int   max_oc   = 0;
    int   max_py   = 0;
    int   max_px   = 0;

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
                    if (errors < 8) {
                        printf("  MISMATCH [oc=%2d][py=%2d][px=%2d] "
                               "got=%.8f exp=%.8f diff=%.2e\n",
                               oc, py, px, output[idx], golden[idx], diff);
                    }
                    errors++;
                }
            }
        }
    }

    printf("Max diff : %.2e at [oc=%d][py=%d][px=%d]\n",
           max_diff, max_oc, max_py, max_px);
    printf("Erreurs  : %d / %d\n", errors, OUT_SIZE);
    printf(errors == 0 ? ">>> CSIM PASSED <<<\n" : ">>> CSIM FAILED <<<\n");
    return errors;
}
