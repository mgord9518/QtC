#include <stdio.h>

#include <QtWidgets/QLabel>
#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/qt.h>
#include <QtC6/label.h>
#include <QtC6/widget.h>
#include <QtC6/pixmap.h>

extern "C" {

// TODO: flags
QtC_Label* QtC_Label_create(const char* label, int label_len, void* parent, QtC_WindowFlags flags) {
    QLabel* self= new QLabel(
        QString::fromUtf8(label, label_len),
        reinterpret_cast<QWidget*>(parent),
        static_cast<Qt::WindowFlags>(flags)
    );

    return reinterpret_cast<QtC_Label*>(self);
}

void QtC_Label_setText(QtC_Label* self, const char* label, int label_len) {
    QtC_TO_CLASS(Label, self)->setText(
        QString::fromUtf8(label, label_len)
    );
}

void QtC_Label_setPixmap(QtC_Label* self, const void* pixmap) {
    reinterpret_cast<QLabel*>(self)->setPixmap(
        reinterpret_cast<const QPixmap&>(*(QtC_Pixmap*)pixmap)
    );
}

void QtC_Label_setScaledContents(QtC_Label* self, bool scale) {
    QtC_TO_CLASS(Label, self)->setScaledContents(scale);
}

bool QtC_Label_hasScaledContents(const QtC_Label* self) {
    return QtC_TO_CONST_CLASS(Label, self)->hasScaledContents();
}

}
