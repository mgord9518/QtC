#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/widget.h>

extern "C" {

// TODO: WindowFlags
QtC_Widget* QtC_Widget_create(void* parent) {
    return reinterpret_cast<QtC_Widget*>(
        new QWidget(
            reinterpret_cast<QWidget*>(parent)
        )
    );
}

void QtC_Widget_resize(QtC_Widget* self, int w, int h) {
    QtC_TO_CLASS(Widget, self)->resize(w, h);
}

void QtC_Widget_show(QtC_Widget* self) {
    QtC_TO_CLASS(Widget, self)->show();
}

void QtC_Widget_setWindowTitle(QtC_Widget* self, const char* label, int label_len) {
    QtC_TO_CLASS(Widget, self)->setWindowTitle(QString::fromUtf8(label, label_len));
}

void QtC_Widget_setParent(QtC_Widget* self, QtC_Widget* parent) {
    QtC_TO_CLASS(Widget, self)->setParent(
        QtC_TO_CLASS(Widget, parent)
    );
}

}
