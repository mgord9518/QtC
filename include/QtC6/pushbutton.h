#pragma once

#include "private/widget_defs.h"
#include "string.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_PushButton* QtC_PushButton_create(
    const QtC_String* label,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
