#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_String QtC_String;

const QtC_String* QtC_String_create(
    const char* string,
    int string_len
);

#ifdef __cplusplus
}
#endif
