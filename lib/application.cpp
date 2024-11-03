#include <QtWidgets/QApplication>
#include <QtC6/application.h>

#include <QtC6/private/common.h>

extern "C" {

QtC_COMMON_FUNCTIONS(Application);

QtC_Application* QtC_Application_new(int argc, char* argv[]) {
    return reinterpret_cast<QtC_Application*>(
        new QApplication(argc, argv)
    );
}

void QtC_Application_exec(QtC_Application* app) {
    reinterpret_cast<QApplication*>(app)->exec();
}

}
