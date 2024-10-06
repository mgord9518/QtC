#include <stdio.h>

#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

#include <QtC5/widgets/pushbutton.h>
#include <QtC5/widgets/widget.h>

extern "C" {

WIDGET_DEFINE(PushButton);

QtC_PushButton* QtC_PushButton_create(const char* label, int label_len, QtC_Widget* parent) {
    QPushButton* but = new QPushButton(
        QString::fromUtf8(label, label_len),
        reinterpret_cast<QWidget*>(parent)
    );

    return reinterpret_cast<QtC_PushButton*>(but);
}

}
