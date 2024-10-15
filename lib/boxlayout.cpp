#include <QtWidgets/QBoxLayout>

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

}
