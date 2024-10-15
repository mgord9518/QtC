#include <stdio.h>

#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

#include <QtC6/pushbutton.h>
#include <QtC6/widget.h>

extern "C" {

QtC_PushButton* QtC_PushButton_create(const char* label, int label_len, void* parent) {
    QPushButton* but = new QPushButton(
        QString::fromUtf8(label, label_len),
        reinterpret_cast<QWidget*>(parent)
    );

    return reinterpret_cast<QtC_PushButton*>(but);
}

}
