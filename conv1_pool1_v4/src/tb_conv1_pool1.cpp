// ============================================================
// tb_conv1_pool1.cpp
// Testbench CSim pour conv1_pool1.
//
// Lit input_48x48.bin et golden_pool1.bin depuis DATA_DIR
// (defini dans data_path.h, genere par run_all.tcl).
// Compare la sortie du kernel avec le golden float32.
// ============================================================

#include <cstdio>
#include <cstdlib>
#include <cmath>

#include "data_path.h"   // #define DATA_DIR "/chemin/absolu/data"

// Dimensions (mirroir exact du kernel)
#define IN_H    48
#define IN_W    48
#define OUT_C   16
#define OUT_H   23
#define OUT_W   23
#define IN_SIZE  (IN_H * IN_W)
#define OUT_SIZE (OUT_C * OUT_H * OUT_W)

// Seuil de comparaison : accumulation de 9 produits float32,
// erreur d'arrondi attendue < 1e-5 en pratique.
#define TOLERANCE 1e-4f

// Prototype du kernel
void conv1_pool1(const float *in, float *out);

// Construit un chemin complet a partir de DATA_DIR
static void make_path(char *buf, size_t sz, const char *fname) {
    snprintf(buf, sz, "%s/%s", DATA_DIR, fname);
}

// Charge un fichier binaire float32. Retourne 0 si OK, -1 si erreur.
static int load_bin(const char *path, float *dst, int n) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        printf("ERROR: cannot open '%s'\n", path);
        return -1;
    }
    size_t r = fread(dst, sizeof(float), n, f);
    fclose(f);
    if ((int)r != n) {
        printf("ERROR: '%s' : lu %zu floats, attendu %d\n", path, r, n);
        return -1;
    }
    return 0;
}

int main() {

    // Tableaux statiques : evite un stack overflow (tableaux > 32 Ko)
    static float input [IN_SIZE ];   //  9216 octets
    static float output[OUT_SIZE];   // 33856 octets
    static float golden[OUT_SIZE];   // 33856 octets

    char p_in    [1024];
    char p_golden[1024];
    make_path(p_in,     sizeof(p_in),     "input_48x48.bin");
    make_path(p_golden, sizeof(p_golden), "golden_pool1.bin");

    printf("--- Chargement des fichiers ---\n");
    printf("Input  : %s\n", p_in);
    printf("Golden : %s\n", p_golden);

    if (load_bin(p_in,     input,  IN_SIZE ) != 0) return 1;
    if (load_bin(p_golden, golden, OUT_SIZE) != 0) return 1;
    printf("Fichiers charges : input=%d floats, golden=%d floats\n",
           IN_SIZE, OUT_SIZE);

    // --- Appel du kernel ---
    printf("--- Appel du kernel ---\n");
    conv1_pool1(input, output);

    // --- Comparaison bit-exact (a TOLERANCE pres) ---
    printf("--- Comparaison avec golden ---\n");
    int    errors   = 0;
    float  max_diff = 0.0f;
    int    max_oc = 0, max_py = 0, max_px = 0;

    for (int oc = 0; oc < OUT_C; oc++) {
        for (int py = 0; py < OUT_H; py++) {
            for (int px = 0; px < OUT_W; px++) {
                int idx  = oc * OUT_H * OUT_W + py * OUT_W + px;
                float diff = fabsf(output[idx] - golden[idx]);
                if (diff > max_diff) {
                    max_diff = diff;
                    max_oc = oc; max_py = py; max_px = px;
                }
                if (diff > TOLERANCE) {
                    if (errors < 8) {
                        printf("  MISMATCH [oc=%2d][py=%2d][px=%2d] "
                               "got=%.8f  exp=%.8f  diff=%.2e\n",
                               oc, py, px,
                               output[idx], golden[idx], diff);
                    }
                    errors++;
                }
            }
        }
    }

    printf("Max diff : %.2e  at [oc=%d][py=%d][px=%d]\n",
           max_diff, max_oc, max_py, max_px);
    printf("Tolerance : %.2e\n", (float)TOLERANCE);
    printf("Erreurs   : %d / %d\n", errors, OUT_SIZE);

    if (errors == 0) {
        printf(">>> CSIM PASSED <<<\n");
        return 0;
    } else {
        printf(">>> CSIM FAILED <<<\n");
        return 1;
    }
}
