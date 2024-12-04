#pragma once

#include "private/widget_defs.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum QtC_AbstractButton_Signal {
    QtC_AbstractButton_Signal_clicked  = 1,
    QtC_AbstractButton_Signal_pressed  = 2,
    QtC_AbstractButton_Signal_released = 3,
    QtC_AbstractButton_Signal_toggled  = 4,
} QtC_AbstractButton_Signal;

void QtC_AbstractButton_connect(
    const QtC_AbstractButton* self,
    QtC_AbstractButton_Signal signal,
    const void* function
);

void QtC_AbstractButton_setText(
    QtC_AbstractButton* self,
    const QtC_String* label
);

#ifdef __cplusplus
}
#endif
