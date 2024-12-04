#pragma once

#include <stdbool.h>
#include "qt.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Object QtC_Object;
typedef void(*QtC_Object_FnType)();

QtC_Object* QtC_Object_new(
    void* parent
);

void QtC_Object_delete(
    QtC_Object* self
);

bool QtC_Object_blockSignals(
    QtC_Object* self,
    bool block
);

QtC_Object* QtC_Object_parent(
    QtC_Object* self
);

void QtC_Object_setParent(
    QtC_Object* self,
    QtC_Object* parent
);

bool QtC_Object_signalsBlocked(
    QtC_Object* self
);

void QtC_Object_connect(
    const QtC_Object* sender,
    const void* signal,
    const void* function
);

#ifdef __cplusplus
}
#endif
