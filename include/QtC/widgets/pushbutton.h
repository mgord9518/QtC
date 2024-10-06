#pragma once

#include "../private/widget_macros.h"
#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_PushButton QtC_PushButton;

WIDGET_DECLARE(PushButton);

QtC_PushButton* QtC_PushButton_create(
    const char* str,
    int size,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
