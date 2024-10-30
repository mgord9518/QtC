#include <QtWidgets/QBoxLayout>

#include <QtC6/private/common.h>
#include <QtC6/private/widget_defs.h>
#include <QtC6/boxlayout.h>

extern "C" {

QtC_COMMON_FUNCTIONS(BoxLayout);

QtC_BoxLayout* QtC_BoxLayout_new(QtC_BoxLayout_Direction direction, QtC_Widget* parent) {
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
