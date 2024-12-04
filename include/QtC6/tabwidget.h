#pragma once

#include "private/widget_defs.h"
#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(TabWidget);

QtC_TabWidget* QtC_TabWidget_new(
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
