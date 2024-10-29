#pragma once

#include "string.h"
#include "widget.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_LineEdit QtC_LineEdit;

QtC_LineEdit* QtC_LineEdit_create(
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif
