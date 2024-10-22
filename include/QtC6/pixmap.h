#pragma once

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Pixmap QtC_Pixmap;

QtC_Pixmap* QtC_Pixmap_create(
    int width,
    int height
);

bool QtC_Pixmap_load(
    QtC_Pixmap* self,
    const char* filename,
    int filename_len,
    const char* format,
    // TODO type
    int flags
);

bool QtC_Pixmap_loadFromData(
    QtC_Pixmap* self,
    const char* data,
    int data_len,
    const char* format,
    // TODO type
    int flags
);

//QtC_Pixmap* QtC_Pixmap_createFromXpm(
//    const char** xpm,
//);

#ifdef __cplusplus
}
#endif
