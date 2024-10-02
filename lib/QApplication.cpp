#include <QApplication>
#include "../include/QApplication.h"

extern "C" {

QtC_QApplication* QtC_QApplication_create(int argc, char* argv[]) {
    return reinterpret_cast<QtC_QApplication*>(new QApplication(argc, argv));
}

void QtC_QApplication_exec(QtC_QApplication* app) {
    reinterpret_cast<QApplication*>(app)->exec();
}

}
