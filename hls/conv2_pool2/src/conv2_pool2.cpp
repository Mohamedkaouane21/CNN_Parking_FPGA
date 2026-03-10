// conv2_pool2.cpp v4
#include <ap_int.h>
#include "weights2.h"

#define IN_C   16
#define IN_H   23
#define IN_W   23
#define CONV_H 21
#define CONV_W 21
#define OUT_C  32
#define OUT_H  10
#define OUT_W  10

void conv2_pool2(const float *in, float *out)
{
#pragma HLS INTERFACE m_axi port=in  bundle=AXI_IN  depth=8464
#pragma HLS INTERFACE m_axi port=out bundle=AXI_OUT depth=3200
#pragma HLS INTERFACE s_axilite port=return

    float in_buf[IN_C][IN_H][IN_W];
#pragma HLS ARRAY_PARTITION variable=in_buf dim=3 cyclic factor=3

    float conv_buf[CONV_H][CONV_W];

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

    CONV_OC:
    for (int oc = 0; oc < OUT_C; oc++) {
        CONV_OY:
        for (int oy = 0; oy < CONV_H; oy++) {
            CONV_OX:
            for (int ox = 0; ox < CONV_W; ox++) {
                float acc = BIASES2[oc];
                CONV_IC:
                for (int ic = 0; ic < IN_C; ic++) {
                    CONV_KY:
                    for (int ky = 0; ky < C2_KH; ky++) {
                        CONV_KX:
                        for (int kx = 0; kx < C2_KW; kx++) {
#pragma HLS PIPELINE II=1
                            acc += in_buf[ic][oy+ky][ox+kx] * WEIGHTS2[ky][kx][ic][oc];
                        }
                    }
                }
                conv_buf[oy][ox] = (acc > 0.0f) ? acc : 0.0f;
            }
        }

        POOL_PY:
        for (int py = 0; py < OUT_H; py++) {
            POOL_PX:
            for (int px = 0; px < OUT_W; px++) {
#pragma HLS PIPELINE II=1
                int sy = py*2, sx = px*2;
                float v00 = conv_buf[sy  ][sx  ];
                float v01 = conv_buf[sy  ][sx+1];
                float v10 = conv_buf[sy+1][sx  ];
                float v11 = conv_buf[sy+1][sx+1];
                float maxv = v00;
                if (v01 > maxv) maxv = v01;
                if (v10 > maxv) maxv = v10;
                if (v11 > maxv) maxv = v11;
                out[oc * OUT_H * OUT_W + py * OUT_W + px] = maxv;
            }
        }
    }
}
