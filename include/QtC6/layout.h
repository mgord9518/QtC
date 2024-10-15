#pragma once

#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Layout QtC_Layout;

QtC_Layout* QtC_Layout_create(
    QtC_Widget* parent
);

void QtC_Layout_addWidget(
    QtC_Layout* self,
    void* child
);

#ifdef __cplusplus
}
#endif
