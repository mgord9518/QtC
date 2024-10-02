#include <QWidget>
#include "../include/QWidget.h"

extern "C" {

QtC_QWidget* QtC_QWidget_create() {
    return reinterpret_cast<QtC_QWidget*>(new QWidget());
}

void QtC_QWidget_destroy(QtC_QWidget* wid) {
    delete reinterpret_cast<QWidget*>(wid);
}

void QtC_QWidget_resize(QtC_QWidget* wid, int w, int h) {
    reinterpret_cast<QWidget*>(wid)->resize(w, h);
}

void QtC_QWidget_show(QtC_QWidget* wid) {
    reinterpret_cast<QWidget*>(wid)->show();
}

}
