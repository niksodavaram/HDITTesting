#pragma once

#include <ntdef.h>
#include <wdm.h>
#include <ntddk.h>
#include <wdf.h>

// Forward declarations
DRIVER_INITIALIZE DriverEntry;
EVT_WDF_DRIVER_DEVICE_ADD EvtDriverDeviceAdd;
EVT_WDF_DEVICE_D0_ENTRY EvtDeviceD0Entry;
EVT_WDF_DEVICE_D0_EXIT EvtDeviceD0Exit;

// Test framework structures
typedef struct _TEST_CONTEXT {
    WDFDEVICE Device;
    WDFQUEUE Queue;
    WDFINTERRUPT Interrupt;
} TEST_CONTEXT, *PTEST_CONTEXT;

WDF_DECLARE_CONTEXT_TYPE_WITH_NAME(TEST_CONTEXT, GetTestContext)