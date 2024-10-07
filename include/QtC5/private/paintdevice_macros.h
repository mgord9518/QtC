#pragma once

#include "common.h"

typedef struct QtC_PaintDevice QtC_PaintDevice;

#define PAINTDEVICE_DECLARE(Self) \
    int QtC_FN(Self, colorCount); \
    int QtC_FN(Self, depth); \

#define PAINTDEVICE_DEFINE(Self) \
    int QtC_FN(Self, colorCount) { \
        return QtC_TO_CLASS(Self, self)->colorCount(); \
    } \
    int QtC_FN(Self, depth) { \
        return QtC_TO_CLASS(Self, self)->depth(); \
    } \

