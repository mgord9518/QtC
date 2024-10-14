#pragma once

#include "private/widget_macros.h"

#ifdef __cplusplus
extern "C" {
#endif

WIDGET_DECLARE(Widget);

// TODO: WindowFlags
QtC_Widget* QtC_Widget_create(void* parent);

#ifdef __cplusplus
}
#endif
