#include <QtWidgets/QAbstractButton>
#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/widget.h>
#include <QtC6/icon.h>
#include <QtC6/abstractbutton.h>

extern "C" {

QtC_COMMON_FUNCTIONS(AbstractButton);

void QtC_AbstractButton_connect(const QtC_AbstractButton* self, QtC_AbstractButton_Signal signal, const void* function) {
    auto connect_impl = [=] () {
        ((void (*)())(function))();
    };

    switch (signal) {
    case QtC_AbstractButton_Signal_clicked:
        QObject::connect(
            QtC_TO_CONST_CLASS(AbstractButton, self),
            &QAbstractButton::clicked,
            connect_impl
        );
        break;
    case QtC_AbstractButton_Signal_pressed:
        QObject::connect(
            QtC_TO_CONST_CLASS(AbstractButton, self),
            &QAbstractButton::pressed,
            connect_impl
        );
        break;
    case QtC_AbstractButton_Signal_released:
        QObject::connect(
            QtC_TO_CONST_CLASS(AbstractButton, self),
            &QAbstractButton::released,
            connect_impl
        );
        break;
    case QtC_AbstractButton_Signal_toggled:
        QObject::connect(
            QtC_TO_CONST_CLASS(AbstractButton, self),
            &QAbstractButton::toggled,
            connect_impl
        );
        break;
    }
}

void QtC_AbstractButton_setText(QtC_AbstractButton* self, const QtC_String* label) {
    QtC_TO_CLASS(AbstractButton, self)->setText(
        *QtC_TO_CONST_CLASS(String, label)
    );
}

}
