// ============================================================
// conv1_pool1.cpp
// Kernel HLS : Conv2D 3x3 valid + ReLU + MaxPool 2x2 stride 2
//
// Dimensions :
//   Entree  : 48x48x1     (2304 floats)
//   Conv    : 46x46x16    (padding valid)
//   Sortie  : 23x23x16    (8464 floats, channel-first)
// ============================================================

#include "weights.h"

static const int IN_H   = 48;
static const int IN_W   = 48;
static const int CONV_H = IN_H - KH + 1;   // 46
static const int CONV_W = IN_W - KW + 1;   // 46
static const int OUT_H  = CONV_H / 2;      // 23
static const int OUT_W  = CONV_W / 2;      // 23

void conv1_pool1(
    const float *in,
          float *out
) {
#pragma HLS INTERFACE m_axi port=in  bundle=AXI_IN  depth=2304  offset=slave
#pragma HLS INTERFACE m_axi port=out bundle=AXI_OUT depth=8464  offset=slave
#pragma HLS INTERFACE s_axilite port=return

    float in_buf[IN_H][IN_W];
#pragma HLS ARRAY_PARTITION variable=in_buf dim=2 cyclic factor=8

    float conv_buf[OUT_C][CONV_H][CONV_W];
#pragma HLS ARRAY_PARTITION variable=conv_buf dim=1 complete

    // ETAPE 1 : DDR -> BRAM
    LOAD:
    for (int i = 0; i < IN_H * IN_W; i++) {
#pragma HLS PIPELINE II=1
        in_buf[i / IN_W][i % IN_W] = in[i];
    }

    // ETAPE 2 : Conv 3x3 + biais + ReLU
    CONV_OC:
    for (int oc = 0; oc < OUT_C; oc++) {
        CONV_OY:
        for (int oy = 0; oy < CONV_H; oy++) {
            CONV_OX:
            for (int ox = 0; ox < CONV_W; ox++) {
#pragma HLS PIPELINE II=1

                float acc = BIASES[oc];

                CONV_KY:
                for (int ky = 0; ky < KH; ky++) {
#pragma HLS UNROLL
                    CONV_KX:
                    for (int kx = 0; kx < KW; kx++) {
#pragma HLS UNROLL
                        acc += in_buf[oy + ky][ox + kx]
                             * WEIGHTS[ky][kx][0][oc];
                    }
                }

                conv_buf[oc][oy][ox] = (acc > 0.0f) ? acc : 0.0f;
            }
        }
    }

    // ETAPE 3 : MaxPool 2x2 stride 2 -> DDR
    POOL_OC:
    for (int oc = 0; oc < OUT_C; oc++) {
        POOL_PY:
        for (int py = 0; py < OUT_H; py++) {
            POOL_PX:
            for (int px = 0; px < OUT_W; px++) {
#pragma HLS PIPELINE II=1

                int sy = py * 2;
                int sx = px * 2;

                float v00 = conv_buf[oc][sy    ][sx    ];
                float v01 = conv_buf[oc][sy    ][sx + 1];
                float v10 = conv_buf[oc][sy + 1][sx    ];
                float v11 = conv_buf[oc][sy + 1][sx + 1];

                float maxv = v00;
                if (v01 > maxv) maxv = v01;
                if (v10 > maxv) maxv = v10;
                if (v11 > maxv) maxv = v11;

                out[oc * OUT_H * OUT_W + py * OUT_W + px] = maxv;
            }
        }
    }
}
