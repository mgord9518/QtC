#pragma once

#include "private/common.h"
#include "private/widget_defs.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(PushButton);

QtC_PushButton* QtC_PushButton_new(
    const QtC_Icon* icon,
    const QtC_String* label,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
