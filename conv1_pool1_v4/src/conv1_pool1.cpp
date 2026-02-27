// ============================================================
// conv1_pool1.cpp
// Kernel HLS : Conv2D 3x3 valid + ReLU + MaxPool 2x2 stride 2
//
// Convention poids : W[KH][KW][IN_C][OUT_C]  (TensorFlow/Keras)
//   Acces : WEIGHTS[ky][kx][ic][oc]
//
// Pipeline :
//   1. Chargement DDR -> BRAM (in_buf)
//   2. Conv 3x3 + biais + ReLU -> conv_buf (BRAM)
//   3. MaxPool 2x2 stride 2    -> DDR (out)
//
// Dimensions :
//   Entree  : 48x48x1     (2304 floats, row-major)
//   Conv    : 46x46x16    (padding valid : 48-3+1=46)
//   Sortie  : 23x23x16    (8464 floats, channel-first)
//
// Ordre memoire sortie (channel-first) :
//   out[ oc * OUT_H * OUT_W + py * OUT_W + px ]
//
// Interface AXI :
//   in     -> m_axi (burst DDR -> BRAM)
//   out    -> m_axi (burst BRAM -> DDR)
//   return -> s_axilite (registre de controle PYNQ)
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

    // ----------------------------------------------------------
    // Buffers on-chip (BRAM)
    // ----------------------------------------------------------

    // in_buf[48][48] = 9 Ko
    // Partition cyclic factor=8 sur les colonnes :
    // la conv lit 3 pixels consecutifs sur la meme ligne ->
    // sans partition, 3 lectures sequentielles sur le meme banc -> II=3.
    // Avec 8 bancs, les 3 lectures tombent sur des bancs differents -> II=1.
    float in_buf[IN_H][IN_W];
#pragma HLS ARRAY_PARTITION variable=in_buf dim=2 cyclic factor=8

    // conv_buf[16][46][46] = 132 Ko
    // Partition complete sur les canaux (dim=1) :
    // 16 bancs independants -> la pool lit oc fixe, 4 adresses differentes
    // -> toutes accessibles en 1 cycle.
    float conv_buf[OUT_C][CONV_H][CONV_W];
#pragma HLS ARRAY_PARTITION variable=conv_buf dim=1 complete

    // ----------------------------------------------------------
    // ETAPE 1 : DDR -> BRAM   (burst m_axi, 1 float/cycle)
    // ----------------------------------------------------------
    LOAD:
    for (int i = 0; i < IN_H * IN_W; i++) {
#pragma HLS PIPELINE II=1
        in_buf[i / IN_W][i % IN_W] = in[i];
    }

    // ----------------------------------------------------------
    // ETAPE 2 : Conv 3x3 + biais + ReLU
    //
    // Boucles : OC(16) -> OY(46) -> OX(46) [PIPELINE II=1]
    //                               KY(3)  [UNROLL complet]
    //                               KX(3)  [UNROLL complet]
    //                               IC(1)  [UNROLL complet, trivial]
    //
    // Acces poids : WEIGHTS[ky][kx][0][oc]
    //   Convention TF/Keras : le dernier indice est le canal de sortie.
    //   Pour oc fixe, le synthétiseur instancie 9 MACs en parallele
    //   (KH*KW=9 apres UNROLL KY+KX).
    //
    // Note : la boucle OC est a l'exterieur car conv_buf[oc] est
    // partitionne par canal. Ecrire dans conv_buf[oc][oy][ox] avec
    // oc fixe dans la boucle externe evite tout conflit de banc BRAM.
    // ----------------------------------------------------------
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
                        // IN_C == 1 : ic=0 fixe, pas de boucle ic
                        acc += in_buf[oy + ky][ox + kx]
                             * WEIGHTS[ky][kx][0][oc];
                    }
                }

                // ReLU
                conv_buf[oc][oy][ox] = (acc > 0.0f) ? acc : 0.0f;
            }
        }
    }

    // ----------------------------------------------------------
    // ETAPE 3 : MaxPool 2x2 stride 2 -> DDR
    //
    // Pour chaque (oc, py, px) :
    //   max des 4 pixels du patch 2x2 dans conv_buf
    //   ecriture dans out (m_axi burst)
    //
    // Les 4 lectures de conv_buf tombent sur le meme banc oc
    // (partition complete dim=1) -> aucun conflit -> II=1.
    // ----------------------------------------------------------
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
