#include <QtWidgets/QWidget>

#include <QtC/private/widget_macros.h>
#include <QtC/widgets/widget.h>

extern "C" {

WIDGET_DEFINE(Widget);

QtC_Widget* QtC_Widget_create() {
    return reinterpret_cast<QtC_Widget*>(
        new QWidget()
    );
}

}
