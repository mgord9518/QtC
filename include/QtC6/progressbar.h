#pragma once

#include "private/widget_defs.h"
#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(ProgressBar);

QtC_ProgressBar* QtC_ProgressBar_new(
    QtC_Widget* parent,
);

#ifdef __cplusplus
}
#endif
