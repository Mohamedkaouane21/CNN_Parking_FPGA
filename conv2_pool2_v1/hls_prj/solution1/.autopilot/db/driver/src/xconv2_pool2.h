// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XCONV2_POOL2_H
#define XCONV2_POOL2_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xconv2_pool2_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XConv2_pool2_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XConv2_pool2;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XConv2_pool2_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XConv2_pool2_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XConv2_pool2_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XConv2_pool2_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XConv2_pool2_Initialize(XConv2_pool2 *InstancePtr, UINTPTR BaseAddress);
XConv2_pool2_Config* XConv2_pool2_LookupConfig(UINTPTR BaseAddress);
#else
int XConv2_pool2_Initialize(XConv2_pool2 *InstancePtr, u16 DeviceId);
XConv2_pool2_Config* XConv2_pool2_LookupConfig(u16 DeviceId);
#endif
int XConv2_pool2_CfgInitialize(XConv2_pool2 *InstancePtr, XConv2_pool2_Config *ConfigPtr);
#else
int XConv2_pool2_Initialize(XConv2_pool2 *InstancePtr, const char* InstanceName);
int XConv2_pool2_Release(XConv2_pool2 *InstancePtr);
#endif

void XConv2_pool2_Start(XConv2_pool2 *InstancePtr);
u32 XConv2_pool2_IsDone(XConv2_pool2 *InstancePtr);
u32 XConv2_pool2_IsIdle(XConv2_pool2 *InstancePtr);
u32 XConv2_pool2_IsReady(XConv2_pool2 *InstancePtr);
void XConv2_pool2_Continue(XConv2_pool2 *InstancePtr);
void XConv2_pool2_EnableAutoRestart(XConv2_pool2 *InstancePtr);
void XConv2_pool2_DisableAutoRestart(XConv2_pool2 *InstancePtr);

void XConv2_pool2_Set_in_r(XConv2_pool2 *InstancePtr, u64 Data);
u64 XConv2_pool2_Get_in_r(XConv2_pool2 *InstancePtr);
void XConv2_pool2_Set_out_r(XConv2_pool2 *InstancePtr, u64 Data);
u64 XConv2_pool2_Get_out_r(XConv2_pool2 *InstancePtr);

void XConv2_pool2_InterruptGlobalEnable(XConv2_pool2 *InstancePtr);
void XConv2_pool2_InterruptGlobalDisable(XConv2_pool2 *InstancePtr);
void XConv2_pool2_InterruptEnable(XConv2_pool2 *InstancePtr, u32 Mask);
void XConv2_pool2_InterruptDisable(XConv2_pool2 *InstancePtr, u32 Mask);
void XConv2_pool2_InterruptClear(XConv2_pool2 *InstancePtr, u32 Mask);
u32 XConv2_pool2_InterruptGetEnabled(XConv2_pool2 *InstancePtr);
u32 XConv2_pool2_InterruptGetStatus(XConv2_pool2 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
