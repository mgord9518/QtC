#pragma once

#include "common.h"
#include "layoutitem_macros.h"
#include "widget_macros.h"

// TODO

typedef struct QtC_Layout QtC_Layout;

#define LAYOUT_DECLARE(Self) \
    LAYOUTITEM_DECLARE(Self) \
    void QtC_FN(Self, addWidget, void* child); \

#define LAYOUT_DEFINE(Self) \
    LAYOUTITEM_DEFINE(Self) \
    void QtC_FN(Self, addWidget, void* child) { \
        QtC_TO_CLASS(Self, self)->addWidget( \
            QtC_TO_CLASS(Widget, child) \
        ); \
    } \

