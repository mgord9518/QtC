#pragma once

#include "QWidget.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_QPushButton QtC_QPushButton;

QtC_QPushButton* QtC_QPushButton_create(
    const char* str,
    int size,
    QtC_QWidget* parent
);

void QtC_QPushButton_destroy(
    QtC_QPushButton* button
);

void QtC_QPushButton_show(
    QtC_QPushButton* button
);

#ifdef __cplusplus
}
#endif
