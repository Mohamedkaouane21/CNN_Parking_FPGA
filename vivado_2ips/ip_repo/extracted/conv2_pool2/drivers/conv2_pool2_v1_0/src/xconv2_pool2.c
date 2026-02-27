// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xconv2_pool2.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XConv2_pool2_CfgInitialize(XConv2_pool2 *InstancePtr, XConv2_pool2_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XConv2_pool2_Start(XConv2_pool2 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL) & 0x80;
    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XConv2_pool2_IsDone(XConv2_pool2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XConv2_pool2_IsIdle(XConv2_pool2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XConv2_pool2_IsReady(XConv2_pool2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XConv2_pool2_Continue(XConv2_pool2 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL) & 0x80;
    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XConv2_pool2_EnableAutoRestart(XConv2_pool2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XConv2_pool2_DisableAutoRestart(XConv2_pool2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_AP_CTRL, 0);
}

void XConv2_pool2_Set_in_r(XConv2_pool2 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IN_R_DATA, (u32)(Data));
    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IN_R_DATA + 4, (u32)(Data >> 32));
}

u64 XConv2_pool2_Get_in_r(XConv2_pool2 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IN_R_DATA);
    Data += (u64)XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IN_R_DATA + 4) << 32;
    return Data;
}

void XConv2_pool2_Set_out_r(XConv2_pool2 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_OUT_R_DATA, (u32)(Data));
    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_OUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XConv2_pool2_Get_out_r(XConv2_pool2 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_OUT_R_DATA);
    Data += (u64)XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_OUT_R_DATA + 4) << 32;
    return Data;
}

void XConv2_pool2_InterruptGlobalEnable(XConv2_pool2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_GIE, 1);
}

void XConv2_pool2_InterruptGlobalDisable(XConv2_pool2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_GIE, 0);
}

void XConv2_pool2_InterruptEnable(XConv2_pool2 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IER);
    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IER, Register | Mask);
}

void XConv2_pool2_InterruptDisable(XConv2_pool2 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IER);
    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IER, Register & (~Mask));
}

void XConv2_pool2_InterruptClear(XConv2_pool2 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv2_pool2_WriteReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_ISR, Mask);
}

u32 XConv2_pool2_InterruptGetEnabled(XConv2_pool2 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_IER);
}

u32 XConv2_pool2_InterruptGetStatus(XConv2_pool2 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv2_pool2_ReadReg(InstancePtr->Control_BaseAddress, XCONV2_POOL2_CONTROL_ADDR_ISR);
}

