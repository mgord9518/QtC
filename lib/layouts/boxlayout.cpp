#include <QtWidgets/QBoxLayout>

#include <QtC5/private/boxlayout_macros.h>
#include <QtC5/layout.h>
#include <QtC5/widgets/widget.h>

extern "C" {

BOXLAYOUT_DEFINE(BoxLayout);

QtC_BoxLayout* QtC_BoxLayout_create(QtC_Widget* parent) {
    return reinterpret_cast<QtC_BoxLayout*>(
        new QBoxLayout(
            QBoxLayout::LeftToRight,
            reinterpret_cast<QWidget*>(parent)
        )
    );
}

}
