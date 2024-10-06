#include <stdio.h>

#include <QtWidgets/QLabel>
#include <QtWidgets/QWidget>

#include <QtC5/private/widget_macros.h>
#include <QtC5/widgets/label.h>
#include <QtC5/widgets/widget.h>

extern "C" {

WIDGET_DEFINE(Label);

// TODO: flags
QtC_Label* QtC_Label_create(const char* label, int label_len, QtC_Widget* parent) {
    QLabel* label_widget = new QLabel(
        QString::fromUtf8(label, label_len),
        reinterpret_cast<QWidget*>(parent)
    );

    return reinterpret_cast<QtC_Label*>(label_widget);
}

}
