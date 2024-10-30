#pragma once

#include "private/common.h"
#include "private/widget_defs.h"
#include "layout.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(BoxLayout);

typedef enum QtC_BoxLayout_Direction {
    QtC_BoxLayout_Direction_LeftToRight = 0,
    QtC_BoxLayout_Direction_RightToLeft = 1,
    QtC_BoxLayout_Direction_TopToBottom = 2,
    QtC_BoxLayout_Direction_BottomToTop = 3,
} QtC_BoxLayout_Direction;

QtC_BoxLayout* QtC_BoxLayout_new(
    QtC_BoxLayout_Direction direction,
    QtC_Widget* parent
);

void QtC_BoxLayout_addLayout(
    QtC_BoxLayout* self,
    QtC_Layout* child_layout
);

#ifdef __cplusplus
}
#endif
