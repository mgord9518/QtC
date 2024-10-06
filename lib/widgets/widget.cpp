#include <QtWidgets/QWidget>

#include <QtC5/private/widget_macros.h>
#include <QtC5/widgets/widget.h>

extern "C" {

WIDGET_DEFINE(Widget);

QtC_Widget* QtC_Widget_create() {
    return reinterpret_cast<QtC_Widget*>(
        new QWidget()
    );
}

}
