#pragma once

#include "private/widget_defs.h"
#include "private/common.h"
#include "string.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(TreeWidgetItem);

QtC_TreeWidgetItem* QtC_TreeWidgetItem_new(
    QtC_TreeWidget* parent
);

QtC_TreeWidgetItem* QtC_TreeWidgetItem_newChild(
    QtC_TreeWidgetItem* parent
);

void QtC_TreeWidgetItem_setText(
    QtC_TreeWidgetItem* self,
    int column,
    const QtC_String* text
);

#ifdef __cplusplus
}
#endif
