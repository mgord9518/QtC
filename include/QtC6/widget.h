#pragma once

#include "qt.h"
#include "string.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Widget QtC_Widget;

// TODO: WindowFlags
QtC_Widget* QtC_Widget_create(
    QtC_Widget*     parent,
    QtC_WindowFlags flags
);

void QtC_Widget_resize(
    QtC_Widget* self,
    int width,
    int height
);

void QtC_Widget_setMinimumSize(
    QtC_Widget* self,
    int width,
    int height
);

void QtC_Widget_setMaximumSize(
    QtC_Widget* self,
    int width,
    int height
);

void QtC_Widget_show(
    QtC_Widget* self
);

void QtC_Widget_setWindowTitle(
    QtC_Widget* self,
    const QtC_String* label
);

void QtC_Widget_setParent(
    QtC_Widget* self,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
