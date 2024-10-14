#pragma once

#include "common.h"
#include "layout_macros.h"

// TODO

typedef struct QtC_BoxLayout QtC_BoxLayout;

typedef enum QtC_BoxLayout_Direction {
    QtC_BoxLayout_Direction_LeftToRight = 0,
    QtC_BoxLayout_Direction_RightToLeft = 1,
    QtC_BoxLayout_Direction_TopToBottom = 2,
    QtC_BoxLayout_Direction_BottomToTop = 3,
} QtC_BoxLayout_Direction;

#define BOXLAYOUT_DECLARE(Self) \
    LAYOUT_DECLARE(Self)

#define BOXLAYOUT_DEFINE(Self) \
    LAYOUT_DEFINE(Self)

