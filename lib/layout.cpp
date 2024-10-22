#include <QtWidgets/QLayout>

#include <QtC6/private/common.h>

#include <QtC6/widget.h>
#include <QtC6/layout.h>

extern "C" {

void QtC_Layout_addWidget(QtC_Layout* self, QtC_Widget* child) {
    QtC_TO_CLASS(Layout, self)->addWidget(
        QtC_TO_CLASS(Widget, child)
    );
}

bool QtC_Layout_setAlignment(QtC_Layout* self, QtC_Widget* child, QtC_Alignment align) {
    return QtC_TO_CLASS(Layout, self)->setAlignment(
        QtC_TO_CLASS(Widget, child),
        static_cast<Qt::Alignment>(align)
    );
}

}
