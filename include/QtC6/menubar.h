#pragma once

#include "private/widget_defs.h"
#include "private/common.h"
#include "string.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(MenuBar);

QtC_MenuBar* QtC_MenuBar_new(
    QtC_Widget* parent
);

void QtC_MenuBar_addMenuString(QtC_MenuBar* self, const QtC_String* label);

#ifdef __cplusplus
}
#endif
