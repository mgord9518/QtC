#pragma once

#include "../private/boxlayout_macros.h"
#include "../widgets/widget.h"

#ifdef __cplusplus
extern "C" {
#endif

BOXLAYOUT_DECLARE(BoxLayout);

QtC_BoxLayout* QtC_BoxLayout_create(QtC_Widget*);

#ifdef __cplusplus
}
#endif
