#pragma once

#include "widget.h"
#include "qt.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Layout QtC_Layout;

QtC_Layout* QtC_Layout_create(
    QtC_Widget* parent
);

void QtC_Layout_addWidget(
    QtC_Layout* self,
    QtC_Widget* child_widget
);

bool QtC_Layout_setAlignment(
    QtC_Layout* self,
    QtC_Widget* child,
    QtC_Alignment align
);

#ifdef __cplusplus
}
#endif
