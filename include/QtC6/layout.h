#pragma once

#include "private/layout_macros.h"
#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

LAYOUT_DECLARE(Layout);

QtC_Layout* QtC_Layout_create(QtC_Widget*);

#ifdef __cplusplus
}
#endif
