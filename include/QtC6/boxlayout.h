#pragma once

#include "private/boxlayout_macros.h"
#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

BOXLAYOUT_DECLARE(BoxLayout);

QtC_BoxLayout* QtC_BoxLayout_create(
    QtC_BoxLayout_Direction direction,
    void* parent
);

#ifdef __cplusplus
}
#endif
