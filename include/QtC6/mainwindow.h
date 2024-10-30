#pragma once

#include "private/widget_defs.h"
#include "private/common.h"
#include "menubar.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(MainWindow);

QtC_MainWindow* QtC_MainWindow_new(
    QtC_Widget* parent,
    QtC_WindowFlags flags
);

void QtC_MainWindow_setCentralWidget(
    QtC_MainWindow* self,
    QtC_Widget* widget
);

QtC_MenuBar* QtC_MainWindow_menuBar(
    QtC_MainWindow* self
);

#ifdef __cplusplus
}
#endif
