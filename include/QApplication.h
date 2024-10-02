#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_QApplication QtC_QApplication;

QtC_QApplication* QtC_QApplication_create(
    int argc,
    char* argv[]
);

void QtC_QApplication_destroy(
    QtC_QApplication* app
);

void QtC_QApplication_exec(
    QtC_QApplication* app
);

#ifdef __cplusplus
}
#endif
