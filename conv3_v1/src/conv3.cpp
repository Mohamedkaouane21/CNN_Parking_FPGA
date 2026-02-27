// conv3.cpp  v2
// Sortie en ordre C,H,W (acces DDR contigus -> petit buffer AXI_OUT)
// La transposition H,W,C se fait sur le ARM en Python (4096 floats = trivial)

#include <ap_int.h>
#include "weights3.h"

#define IN_C   32
#define IN_H   10
#define IN_W   10
#define CONV_H  8
#define CONV_W  8
#define OUT_C  64

void conv3(const float *in, float *out)
{
#pragma HLS INTERFACE m_axi port=in  bundle=AXI_IN  depth=3200
#pragma HLS INTERFACE m_axi port=out bundle=AXI_OUT depth=4096
#pragma HLS INTERFACE s_axilite port=return

    float in_buf[IN_C][IN_H][IN_W];
#pragma HLS ARRAY_PARTITION variable=in_buf dim=3 cyclic factor=3

    // -------------------------------------------------------
    // 1. Chargement DDR -> BRAM
    // -------------------------------------------------------
    LOAD_IC:
    for (int ic = 0; ic < IN_C; ic++) {
        LOAD_IY:
        for (int iy = 0; iy < IN_H; iy++) {
#pragma HLS PIPELINE II=1
            LOAD_IX:
            for (int ix = 0; ix < IN_W; ix++) {
                in_buf[ic][iy][ix] = in[ic * IN_H * IN_W + iy * IN_W + ix];
            }
        }
    }

    // -------------------------------------------------------
    // 2. Conv2D + ReLU, ecriture en ordre C,H,W (burst-friendly)
    // -------------------------------------------------------
    CONV_OC:
    for (int oc = 0; oc < OUT_C; oc++) {
        CONV_OY:
        for (int oy = 0; oy < CONV_H; oy++) {
            CONV_OX:
            for (int ox = 0; ox < CONV_W; ox++) {
                float acc = BIASES3[oc];
                CONV_IC:
                for (int ic = 0; ic < IN_C; ic++) {
                    CONV_KY:
                    for (int ky = 0; ky < C3_KH; ky++) {
                        CONV_KX:
                        for (int kx = 0; kx < C3_KW; kx++) {
#pragma HLS PIPELINE II=1
                            acc += in_buf[ic][oy+ky][ox+kx] * WEIGHTS3[ky][kx][ic][oc];
                        }
                    }
                }
                float val = (acc > 0.0f) ? acc : 0.0f;
                // Ordre C,H,W
                out[oc * CONV_H * CONV_W + oy * CONV_W + ox] = val;
            }
        }
    }
}
