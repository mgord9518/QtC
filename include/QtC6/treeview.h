#pragma once

#include <stdbool.h>
#include "private/widget_defs.h"
#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(TreeView);

QtC_TreeView* QtC_TreeView_new(
    QtC_Widget* parent
);

void QtC_TreeView_setRootIsDecorated(
    QtC_TreeView* self,
    bool show
);

#ifdef __cplusplus
}
#endif
