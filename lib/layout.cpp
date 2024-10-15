#include <QtWidgets/QLayout>

#include <QtC6/private/common.h>

#include <QtC6/widget.h>
#include <QtC6/layout.h>

extern "C" {

void QtC_Layout_addWidget(QtC_Layout* self, void* child) {
    QtC_TO_CLASS(Layout, self)->addWidget(
        QtC_TO_CLASS(Widget, child)
    );
}

}
