#pragma once

#include "common.h"
#include "widget_macros.h"

typedef struct QtC_AbstractButton QtC_AbstractButton;

#define ABSTRACTBUTTON_DECLARE(Self) \
    WIDGET_DECLARE(Self) \
    void QtC_FN(Self, setText, const char* label, int label_len); \

#define ABSTRACTBUTTON_DEFINE(Self) \
    WIDGET_DEFINE(Self) \
    void QtC_FN(Self, setText, const char* label, int label_len) { \
        QtC_TO_CLASS(Self, self)->setText( \
            QString::fromUtf8(label, label_len) \
        ); \
    } \

