#pragma once

#include "widget.h"
#include "string.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_PushButton QtC_PushButton;

QtC_PushButton* QtC_PushButton_create(
    const QtC_String* label,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
