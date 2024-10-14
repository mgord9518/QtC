#pragma once

typedef enum QtC_WindowFlags {
    QtC_WindowFlags_Widget        =               0x00000000,
    QtC_WindowFlags_Window        =               0x00000001,
    QtC_WindowFlags_Dialog        =               0x00000002 | QtC_WindowFlags_Window,
    QtC_WindowFlags_Sheet         =               0x00000004 | QtC_WindowFlags_Window,
    QtC_WindowFlags_Drawer        =    QtC_WindowFlags_Sheet | QtC_WindowFlags_Dialog,
    QtC_WindowFlags_Popup         =               0x00000008 | QtC_WindowFlags_Window,
    QtC_WindowFlags_Tool          =    QtC_WindowFlags_Popup | QtC_WindowFlags_Dialog,
    QtC_WindowFlags_ToolTip       =    QtC_WindowFlags_Popup | QtC_WindowFlags_Sheet,
    QtC_WindowFlags_SplashScreen  =  QtC_WindowFlags_ToolTip | QtC_WindowFlags_Dialog,
    QtC_WindowFlags_SubWindow     =               0x00000012,
    QtC_WindowFlags_ForeignWindow =               0x00000020 | QtC_WindowFlags_Window,
    QtC_WindowFlags_CoverWindow   =               0x00000040 | QtC_WindowFlags_Window,
} QtC_WindowFlags;

typedef enum QtC_WindowHints {
    QtC_WindowHints_MSWindowsFixedSizeDialog = 0x00000100,
} QtC_WindowHints;
