#pragma once

#include "private/label_macros.h"
#include "widget.h"
#include "qt.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Label QtC_Label;

LABEL_DECLARE(Label);

QtC_Label* QtC_Label_create(
    const char* str,
    int size,
    void* parent,
    QtC_WindowFlags flags
);

#ifdef __cplusplus
}
#endif
