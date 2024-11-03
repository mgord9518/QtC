#pragma once

#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Application QtC_Application;

QtC_COMMON_DECLS(Application);

QtC_Application* QtC_Application_new(
    int argc,
    char* argv[]
);

void QtC_Application_exec(
    QtC_Application* self
);

#ifdef __cplusplus
}
#endif
