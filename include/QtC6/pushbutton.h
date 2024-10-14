#pragma once

#include "private/pushbutton_macros.h"
#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

PUSHBUTTON_DECLARE(PushButton);

QtC_PushButton* QtC_PushButton_create(
    const char* label,
    int label_len,
    void* parent
);

#ifdef __cplusplus
}
#endif
