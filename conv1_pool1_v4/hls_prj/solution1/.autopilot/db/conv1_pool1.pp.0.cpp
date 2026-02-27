# 1 "src/conv1_pool1.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 376 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/badhak/Vitis/2024.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 105 "/home/badhak/Vitis/2024.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
extern "C" {






    void _ssdm_op_IfRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_IfWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_StreamRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_StreamWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned _ssdm_StreamSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_ReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Read(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_WriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Write(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_op_MemShiftRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_PrintNone(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintInt(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintDouble(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Wait(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Poll(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Return(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecSynModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecTopModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDecl(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDef(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecConnection(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecChannel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecSensitive(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecModuleInst(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPortMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecReset(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPlatform(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecClockDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPowerDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecRegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecRegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopName(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopTripCount(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecStateBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecStateEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecInterface(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecDataflowPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecLatency(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecParallel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProtocol(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecOccurrence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecResource(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecResourceLimit(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecCHCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecFUCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIFCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIPCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecMemCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecExt(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_SpecArrayDimSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_RegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_RegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_InlineAll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineLoop(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_Inline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineSelf(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecArrayMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayPartition(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayReshape(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecStream(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecStable(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecStableContent(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBindPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipoDepth(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecExpr(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecExprBalance(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecDependence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecLoopMerge(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopFlatten(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopRewind(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecFuncInstantiation(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncBuffer(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncExtract(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecConstant(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_DataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecDataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBitsMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecLicense(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void __xilinx_ip_top(...) __attribute__ ((nothrow)) __attribute__((overloadable));


}
# 2 "<built-in>" 2
# 1 "src/conv1_pool1.cpp" 2
# 27 "src/conv1_pool1.cpp"
# 1 "src/weights.h" 1
# 13 "src/weights.h"
static const float WEIGHTS[3][3][1][16] = {

    {
        { { -0.18545382f, 0.11667291f, -0.15661177f, 0.02482803f, -0.04042519f, -0.10340019f, -0.12002148f, -0.05027333f, 0.17119472f, -0.12003387f, -0.11850077f, 0.15814190f, 0.18023796f, 0.00299091f, -0.18901634f, 0.06125121f } },
        { { -0.06115279f, 0.16001746f, -0.01086228f, -0.00261217f, 0.17881347f, 0.12672371f, -0.06432910f, -0.03490468f, 0.10290530f, 0.07985544f, -0.09788157f, 0.10992927f, 0.08770306f, 0.01422858f, 0.12032425f, 0.00808248f } },
        { { -0.18847005f, -0.07082877f, 0.01020867f, -0.13242798f, 0.16667396f, 0.18935460f, 0.26139069f, 0.14436804f, 0.10013115f, -0.03365058f, 0.04179195f, 0.13943525f, 0.16460061f, 0.10890982f, -0.11446173f, 0.11288565f } }
    },

    {
        { { 0.11892932f, -0.19067976f, 0.19375975f, 0.10441896f, 0.09018248f, -0.12877461f, -0.00596354f, -0.11024584f, -0.05322596f, -0.15995677f, 0.04955069f, -0.05786858f, -0.11984923f, 0.03735891f, -0.00625678f, -0.14626969f } },
        { { -0.06259483f, 0.13984071f, 0.07625394f, 0.19871204f, 0.03754380f, 0.10672668f, -0.13521026f, -0.01815067f, -0.03023178f, 0.02145959f, -0.06945395f, -0.12239245f, 0.09471501f, -0.04207036f, 0.08814812f, -0.00727041f } },
        { { 0.04705385f, 0.12580149f, -0.01084123f, -0.19431300f, 0.14854254f, -0.10133055f, 0.14978291f, -0.15153271f, 0.16756749f, -0.01505348f, 0.03693531f, -0.23070835f, -0.01716252f, 0.15816097f, -0.00165548f, -0.03371074f } }
    },

    {
        { { 0.12994830f, -0.05109822f, -0.02004592f, 0.12217906f, -0.17407382f, 0.03871706f, -0.09530997f, -0.12351885f, -0.11589471f, 0.05952335f, 0.02496160f, -0.14782494f, 0.15117301f, -0.06720104f, 0.10304287f, 0.14127113f } },
        { { -0.02065124f, -0.02456407f, 0.11231690f, 0.08697736f, -0.13414842f, -0.12347194f, -0.12526487f, 0.10971068f, -0.15027869f, -0.07009789f, 0.14856526f, 0.02593327f, -0.12630399f, -0.06443352f, -0.11650075f, -0.07726239f } },
        { { 0.20663954f, -0.12810421f, 0.14246947f, 0.16373292f, -0.02497129f, -0.05785205f, 0.10263943f, 0.10962801f, -0.10914987f, 0.18910520f, -0.12744893f, 0.13087545f, -0.13984834f, -0.11114042f, -0.12037245f, -0.00622035f } }
    }
};

static const float BIASES[16] = {
    -0.00135119f, -0.00966804f, -0.00236660f, -0.02323654f, -0.01174016f, 0.01141881f, 0.00555323f, 0.01558531f, -0.03015595f, 0.00268703f, -0.02171047f, -0.01077329f, -0.00450367f, -0.02555879f, -0.00818119f, -0.01941174f
};
# 28 "src/conv1_pool1.cpp" 2

static const int IN_H = 48;
static const int IN_W = 48;
static const int CONV_H = IN_H - 3 + 1;
static const int CONV_W = IN_W - 3 + 1;
static const int OUT_H = CONV_H / 2;
static const int OUT_W = CONV_W / 2;

__attribute__((sdx_kernel("conv1_pool1", 0))) void conv1_pool1(
    const float *in,
          float *out
) {
#line 58 "/home/badhak/Téléchargements/conv1_pool1_v4/run_all.tcl"
#pragma HLSDIRECTIVE TOP name=conv1_pool1
# 39 "src/conv1_pool1.cpp"

#pragma HLS INTERFACE m_axi port=in bundle=AXI_IN depth=2304 offset=slave
#pragma HLS INTERFACE m_axi port=out bundle=AXI_OUT depth=8464 offset=slave
#pragma HLS INTERFACE s_axilite port=return
# 53 "src/conv1_pool1.cpp"
 float in_buf[IN_H][IN_W];
#pragma HLS ARRAY_PARTITION variable=in_buf dim=2 cyclic factor=8





 float conv_buf[16][CONV_H][CONV_W];
#pragma HLS ARRAY_PARTITION variable=conv_buf dim=1 complete




 LOAD:
    for (int i = 0; i < IN_H * IN_W; i++) {
#pragma HLS PIPELINE II=1
 in_buf[i / IN_W][i % IN_W] = in[i];
    }
# 89 "src/conv1_pool1.cpp"
    CONV_OC:
    for (int oc = 0; oc < 16; oc++) {
        CONV_OY:
        for (int oy = 0; oy < CONV_H; oy++) {
            CONV_OX:
            for (int ox = 0; ox < CONV_W; ox++) {
#pragma HLS PIPELINE II=1

 float acc = BIASES[oc];

                CONV_KY:
                for (int ky = 0; ky < 3; ky++) {
#pragma HLS UNROLL
 CONV_KX:
                    for (int kx = 0; kx < 3; kx++) {
#pragma HLS UNROLL

 acc += in_buf[oy + ky][ox + kx]
                             * WEIGHTS[ky][kx][0][oc];
                    }
                }


                conv_buf[oc][oy][ox] = (acc > 0.0f) ? acc : 0.0f;
            }
        }
    }
# 127 "src/conv1_pool1.cpp"
    POOL_OC:
    for (int oc = 0; oc < 16; oc++) {
        POOL_PY:
        for (int py = 0; py < OUT_H; py++) {
            POOL_PX:
            for (int px = 0; px < OUT_W; px++) {
#pragma HLS PIPELINE II=1

 int sy = py * 2;
                int sx = px * 2;

                float v00 = conv_buf[oc][sy ][sx ];
                float v01 = conv_buf[oc][sy ][sx + 1];
                float v10 = conv_buf[oc][sy + 1][sx ];
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
