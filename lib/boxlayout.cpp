#include <QtWidgets/QBoxLayout>

#include <QtC6/private/boxlayout_macros.h>
#include <QtC6/layout.h>
#include <QtC6/widget.h>

extern "C" {

BOXLAYOUT_DEFINE(BoxLayout);

QtC_BoxLayout* QtC_BoxLayout_create(QtC_BoxLayout_Direction direction, void* parent) {
    return reinterpret_cast<QtC_BoxLayout*>(
        new QBoxLayout(
            static_cast<QBoxLayout::Direction>(direction),
            reinterpret_cast<QWidget*>(parent)
        )
    );
}

}
