#include <QtWidgets/QWidget>

#include <QtC6/qt.h>
#include <QtC6/private/common.h>
#include <QtC6/string.h>
#include <QtC6/widget.h>
#include <QtC6/layout.h>

extern "C" {

QtC_COMMON_FUNCTIONS(Widget);

QtC_Widget* QtC_Widget_new(QtC_Widget* parent, QtC_WindowFlags flags) {
    return QtC_FROM_CLASS(Widget, new QWidget(
        QtC_TO_CLASS(Widget, parent),
        static_cast<Qt::WindowFlags>(flags)
    ));
}

void QtC_Widget_resize(QtC_Widget* self, int w, int h) {
    QtC_TO_CLASS(Widget, self)->resize(w, h);
}

void QtC_Widget_setMinimumSize(QtC_Widget* self, int w, int h) {
    QtC_TO_CLASS(Widget, self)->setMinimumSize(w, h);
}

void QtC_Widget_setMaximumSize(QtC_Widget* self, int w, int h) {
    QtC_TO_CLASS(Widget, self)->setMaximumSize(w, h);
}

void QtC_Widget_show(QtC_Widget* self) {
    QtC_TO_CLASS(Widget, self)->show();
}

void QtC_Widget_setWindowTitle(QtC_Widget* self, const QtC_String* label) {
    QtC_TO_CLASS(Widget, self)->setWindowTitle(
        *QtC_TO_CONST_CLASS(String, label)
    );
}

void QtC_Widget_setLayout(QtC_Widget* self, QtC_Layout* layout) {
    QtC_TO_CLASS(Widget, self)->setLayout(
        QtC_TO_CLASS(Layout, layout)
    );
}

void QtC_Widget_setParent(QtC_Widget* self, QtC_Widget* parent) {
    QtC_TO_CLASS(Widget, self)->setParent(
        QtC_TO_CLASS(Widget, parent)
    );
}

}
