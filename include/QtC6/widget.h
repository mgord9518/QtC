#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Widget QtC_Widget;

// TODO: WindowFlags
QtC_Widget* QtC_Widget_create(
    void* parent
);

void QtC_Widget_resize(
    QtC_Widget* self,
    int width,
    int height
);

void QtC_Widget_show(
    QtC_Widget* self
);

void QtC_Widget_setWindowTitle(
    QtC_Widget* self,
    const char* label,
    int label_len
);

void QtC_Widget_setParent(
    QtC_Widget* self,
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
