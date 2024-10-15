#pragma once

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Object QtC_Object;

QtC_Object* QtC_Object_create(
    void* parent
);

void QtC_Object_destroy(
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

#ifdef __cplusplus
}
#endif
