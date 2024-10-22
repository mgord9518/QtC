#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

typedef struct QtC_String QtC_String;

// TODO: WindowFlags
QtC_Widget* QtC_String_fromUtf8(
    const char* string,
    size_t string_len
);

#ifdef __cplusplus
}
#endif
