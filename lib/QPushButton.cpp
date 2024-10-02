#include <stdio.h>

#include <QPushButton>
#include <QWidget>
#include <QString>
#include "../include/QPushButton.h"
#include "../include/QWidget.h"

extern "C" {

QtC_QPushButton* QtC_QPushButton_create(const char* label, int label_len, QtC_QWidget* parent) {
    QPushButton* but;

    try {
        but = new QPushButton(
            QString::fromUtf8(label, label_len),
            reinterpret_cast<QWidget*>(parent)
        );
    } catch (const std::bad_alloc&) {
        printf("ALLOC ERROR\n");
    }

    return reinterpret_cast<QtC_QPushButton*>(but);
}

void QtC_QPushButton_destroy(QtC_QPushButton* button) {
    delete reinterpret_cast<QPushButton*>(button);
}

void QtC_QPushButton_resize(QtC_QPushButton* button, int w, int h) {
    reinterpret_cast<QPushButton*>(button)->resize(w, h);
}

void QtC_QPushButton_show(QtC_QPushButton* button) {
    reinterpret_cast<QPushButton*>(button)->show();
}

}
