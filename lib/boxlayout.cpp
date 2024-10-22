#include <QtWidgets/QBoxLayout>

#include <QtC6/private/common.h>
#include <QtC6/boxlayout.h>
#include <QtC6/widget.h>

extern "C" {

QtC_BoxLayout* QtC_BoxLayout_create(QtC_BoxLayout_Direction direction, void* parent) {
    return reinterpret_cast<QtC_BoxLayout*>(
        new QBoxLayout(
            static_cast<QBoxLayout::Direction>(direction),
            reinterpret_cast<QWidget*>(parent)
        )
    );
}

void QtC_BoxLayout_addLayout(QtC_BoxLayout* self, QtC_Layout* child_layout) {
    QtC_TO_CLASS(BoxLayout, self)->addLayout(
        QtC_TO_CLASS(Layout, child_layout)
    );
}


}
