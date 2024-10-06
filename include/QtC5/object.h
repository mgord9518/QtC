#pragma once

#include "private/object_macros.h"

#ifdef __cplusplus
extern "C" {
#endif

OBJECT_DECLARE(Object);

QtC_Object* QtC_Object_create(QtC_Object*);

#ifdef __cplusplus
}
#endif
