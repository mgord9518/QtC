#pragma once

#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_PushButton QtC_PushButton;

QtC_PushButton* QtC_PushButton_create(
    const char* label,
    int label_len,
    void* parent
);

#ifdef __cplusplus
}
#endif
