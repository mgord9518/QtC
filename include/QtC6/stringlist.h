#pragma once

#include "private/common.h"
#include "string.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_StringList QtC_StringList;

QtC_COMMON_DECLS(StringList);

QtC_StringList* QtC_StringList_new();

void QtC_StringList_append(
    QtC_StringList* self,
    const QtC_String* text
);

#ifdef __cplusplus
}
#endif
