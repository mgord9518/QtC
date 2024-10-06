#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_Application QtC_Application;

QtC_Application* QtC_Application_create(
    int argc,
    char* argv[]
);

void QtC_Application_destroy(
    QtC_Application* app
);

void QtC_Application_exec(
    QtC_Application* app
);

#ifdef __cplusplus
}
#endif
