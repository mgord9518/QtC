#pragma once

#include "common.h"
#include "object_macros.h"
#include "paintdevice_macros.h"

typedef struct QtC_Widget QtC_Widget;

#define WIDGET_DECLARE(Self) \
    OBJECT_DECLARE(Self) \
    PAINTDEVICE_DECLARE(Self) \
    void QtC_FN(Self, resize, int width, int height); \
    void QtC_FN(Self, show); \
    void QtC_FN(Self, setWindowTitle, const char* label, int label_len); \
    /* As the QObject.setParent and QWidget.setParent methods are not compatible,
     * this function must have a different name */ \
    void QtC_FN(Self, setParentWidget, QtC_Widget* parent); \

#define WIDGET_DEFINE(Self) \
    OBJECT_DEFINE(Self) \
    PAINTDEVICE_DEFINE(Self) \
    void QtC_FN(Self, resize, int w, int h) { \
        QtC_TO_CLASS(Self, self)->resize(w, h); \
    } \
    void QtC_FN(Self, show) { \
        QtC_TO_CLASS(Self, self)->show(); \
    } \
    void QtC_FN(Self, setWindowTitle, const char* label, int label_len) { \
        QtC_TO_CLASS(Self, self)->setWindowTitle(QString::fromUtf8(label, label_len)); \
    } \
    void QtC_FN(Self, setParentWidget, QtC_Widget* parent) { \
        QtC_TO_CLASS(Self, self)->setParent( \
            QtC_TO_CLASS(Self, parent) \
        ); \
    } \

