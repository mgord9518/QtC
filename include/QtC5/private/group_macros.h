#pragma once
// TODO

#include "widget_macros.h"

typedef struct QtC_Group QtC_Group;

#define GROUP_DECLARE(Group) \
    WIDGET_DECLARE(Group) \
    void QtC_##Widget##_resize(QtC_##Widget*, int, int); \

#define WIDGET_DEFINE(Group) \
    WIDGET_DEFINE(Group) \
    void QtC_##Widget##_resize(QtC_##Widget* wid, int w, int h) { \
        reinterpret_cast<Q##Widget*>(wid)->resize(w, h); \
    } \

