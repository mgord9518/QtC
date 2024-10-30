#include <QtWidgets/QMainWindow>

#include <QtC6/qt.h>
#include <QtC6/private/common.h>
#include <QtC6/mainwindow.h>
#include <QtC6/widget.h>

extern "C" {

QtC_COMMON_FUNCTIONS(MainWindow);

QtC_MainWindow* QtC_MainWindow_new(QtC_Widget* parent, QtC_WindowFlags flags) {
    return QtC_FROM_CLASS(MainWindow, new QMainWindow(
        QtC_TO_CLASS(Widget, parent),
        static_cast<Qt::WindowFlags>(flags)
    ));
}

void QtC_MainWindow_setCentralWidget(QtC_MainWindow* self, QtC_Widget* widget) {
    QtC_TO_CLASS(MainWindow, self)->setCentralWidget(
        QtC_TO_CLASS(Widget, widget)
    );
}

QtC_MenuBar* QtC_MainWindow_menuBar(QtC_MainWindow* self) {
    return QtC_FROM_CLASS(MenuBar,
        QtC_TO_CLASS(MainWindow, self)->menuBar()
    );
}

}
