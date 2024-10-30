#pragma once

#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_String QtC_String;

QtC_COMMON_DECLS(String);

QtC_String* QtC_String_new(
    const char* string,
    int string_len
);

#ifdef __cplusplus
}
#endif
