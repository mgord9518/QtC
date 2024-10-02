#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_QWidget QtC_QWidget;

QtC_QWidget* QtC_QWidget_create();

void QtC_QWidget_destroy(
    QtC_QWidget* widget
);

void QtC_QWidget_resize(
    QtC_QWidget* widget,
    int w,
    int h
);

void QtC_QWidget_show(
    QtC_QWidget* widget
);

#ifdef __cplusplus
}
#endif
