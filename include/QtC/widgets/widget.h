#pragma once

#include "../private/widget_macros.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Widget QtC_Widget;

WIDGET_DECLARE(Widget);

QtC_Widget* QtC_Widget_create();

#ifdef __cplusplus
}
#endif
