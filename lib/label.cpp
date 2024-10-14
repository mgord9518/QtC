#include <stdio.h>

#include <QtWidgets/QLabel>
#include <QtWidgets/QWidget>

#include <QtC6/private/widget_macros.h>
#include <QtC6/qt.h>
#include <QtC6/label.h>
#include <QtC6/widget.h>

extern "C" {

LABEL_DEFINE(Label);

// TODO: flags
QtC_Label* QtC_Label_create(const char* label, int label_len, void* parent, QtC_WindowFlags flags) {
    QLabel* label_widget = new QLabel(
        QString::fromUtf8(label, label_len),
        reinterpret_cast<QWidget*>(parent),
        static_cast<Qt::WindowFlags>(flags)
    );

    return reinterpret_cast<QtC_Label*>(label_widget);
}

}
