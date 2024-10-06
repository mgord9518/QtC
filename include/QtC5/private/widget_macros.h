#pragma once

#include "object_macros.h"
#include "paintdevice_macros.h"

typedef struct QtC_Widget QtC_Widget;

#define WIDGET_DECLARE(Widget) \
    OBJECT_DECLARE(Widget) \
    PAINTDEVICE_DECLARE(Widget) \
    void QtC_##Widget##_resize(QtC_##Widget*, int, int); \
    void QtC_##Widget##_show(QtC_##Widget*); \
    void QtC_##Widget##_setWindowTitle(QtC_##Widget*, const char*, int); \
    void QtC_##Widget##_setParentWidget(QtC_##Widget*, QtC_Widget*); \

#define WIDGET_DEFINE(Widget) \
    OBJECT_DEFINE(Widget) \
    PAINTDEVICE_DEFINE(Widget) \
    void QtC_##Widget##_resize(QtC_##Widget* wid, int w, int h) { \
        reinterpret_cast<Q##Widget*>(wid)->resize(w, h); \
    } \
    void QtC_##Widget##_show(QtC_##Widget* wid) { \
        reinterpret_cast<Q##Widget*>(wid)->show(); \
    } \
    void QtC_##Widget##_setWindowTitle(QtC_##Widget* wid, const char* label, int label_len) { \
        reinterpret_cast<Q##Widget*>(wid)->setWindowTitle(QString::fromUtf8(label, label_len)); \
    } \
    /* As the QObject.setParent and QWidget.setParent methods are not compatible,
     * this function must have a different name */ \
    void QtC_##Widget##_setParentWidget(QtC_##Widget* wid, QtC_Widget* parent) { \
        reinterpret_cast<Q##Widget*>(wid)->setParent( \
            reinterpret_cast<QWidget*>(parent) \
        ); \
    } \

