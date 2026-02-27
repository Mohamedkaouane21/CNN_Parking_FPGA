#include <algorithm>

static inline float relu(float x) { return (x > 0.0f) ? x : 0.0f; }

// in: 48x48x1
// w : 3x3x1x16  (Kx,Ky,InC,OutC)
// b : 16
// out: 23x23x16 (conv VALID -> 46x46, pool 2x2 -> 23x23)
extern "C" void conv1_pool1(
    const float *in,
    const float *w,
    const float *b,
    float *out
) {
#pragma HLS INTERFACE m_axi port=in  offset=slave bundle=gmem0
#pragma HLS INTERFACE m_axi port=w   offset=slave bundle=gmem1
#pragma HLS INTERFACE m_axi port=b   offset=slave bundle=gmem2
#pragma HLS INTERFACE m_axi port=out offset=slave bundle=gmem3

#pragma HLS INTERFACE s_axilite port=in  bundle=control
#pragma HLS INTERFACE s_axilite port=w   bundle=control
#pragma HLS INTERFACE s_axilite port=b   bundle=control
#pragma HLS INTERFACE s_axilite port=out bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // Conv VALID output buffer: 46x46x16
    static float conv[46][46][16];
#pragma HLS ARRAY_PARTITION variable=conv complete dim=3

    // 1) Conv VALID (pas de padding): y=0..45, x=0..45
    for (int oc = 0; oc < 16; oc++) {
        for (int y = 0; y < 46; y++) {
            for (int x = 0; x < 46; x++) {
#pragma HLS PIPELINE II=1
                float acc = b[oc];

                // kernel 3x3 sur input [y..y+2][x..x+2]
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        float val = in[(y + ky) * 48 + (x + kx)];

                        // w layout Keras: (ky,kx,ic,oc) ; ic=0
                        int widx = ((ky * 3 + kx) * 16) + oc;
                        acc += val * w[widx];
                    }
                }

                conv[y][x][oc] = relu(acc);
            }
        }
    }

    // 2) MaxPool 2x2 stride 2 (VALID): 46 -> 23
    for (int oc = 0; oc < 16; oc++) {
        for (int y = 0; y < 23; y++) {
            for (int x = 0; x < 23; x++) {
#pragma HLS PIPELINE II=1
                float m = conv[y*2 + 0][x*2 + 0][oc];
                m = std::max(m, conv[y*2 + 0][x*2 + 1][oc]);
                m = std::max(m, conv[y*2 + 1][x*2 + 0][oc]);
                m = std::max(m, conv[y*2 + 1][x*2 + 1][oc]);

                out[(y * 23 + x) * 16 + oc] = m;
            }
        }
    }
}
