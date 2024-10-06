#include <stdio.h>

#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

#include <QtC/widgets/pushbutton.h>
#include <QtC/widgets/widget.h>

extern "C" {

WIDGET_DEFINE(PushButton);

QtC_PushButton* QtC_PushButton_create(const char* label, int label_len, QtC_Widget* parent) {
    QPushButton* but;

    try {
        but = new QPushButton(
            QString::fromUtf8(label, label_len),
            reinterpret_cast<QWidget*>(parent)
        );
    } catch (const std::bad_alloc&) {
        printf("ALLOC ERROR\n");
    }

    return reinterpret_cast<QtC_PushButton*>(but);
}

}
