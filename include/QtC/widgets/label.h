#pragma once

#include "../private/widget_macros.h"
#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Label QtC_Label;

WIDGET_DECLARE(Label);

QtC_Label* QtC_Label_create(
    const char* str,
    int size,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
