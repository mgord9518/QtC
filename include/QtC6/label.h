#pragma once

#include "private/widget_defs.h"
#include "pixmap.h"
#include "string.h"
#include "qt.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_Label* QtC_Label_create(
    const QtC_String* label,
    void* parent,
    QtC_WindowFlags flags
);

void QtC_Label_setText(
    QtC_Label* self,
    const char* label,
    int label_len
);

void QtC_Label_setPixmap(
    QtC_Label* self,
    const void* pixmap
);

void QtC_Label_setScaledContents(
    QtC_Label* self,
    bool scale
);

bool QtC_Label_hasScaledContents(
    const QtC_Label* self
);

void QtC_Label_setAlignment(
    QtC_Label* self,
    QtC_Alignment align
);

#ifdef __cplusplus
}
#endif
