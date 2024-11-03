#pragma once

#include "private/widget_defs.h"
#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(ColumnView);

QtC_ColumnView* QtC_ColumnView_new(
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
