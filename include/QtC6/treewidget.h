#pragma once

#include "private/widget_defs.h"
#include "private/common.h"
#include "stringlist.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(TreeWidget);

QtC_TreeWidget* QtC_TreeWidget_new(
    QtC_Widget* parent
);

void QtC_TreeWidget_setColumnCount(
    QtC_TreeWidget* self,
    int columns
);

void QtC_TreeWidget_setHeaderLabels(
    QtC_TreeWidget* self,
    const QtC_StringList* labels
);

#ifdef __cplusplus
}
#endif
