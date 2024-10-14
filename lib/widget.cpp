#include <QtWidgets/QWidget>

#include <QtC6/private/widget_macros.h>
#include <QtC6/widget.h>

extern "C" {

WIDGET_DEFINE(Widget);

// TODO: WindowFlags
QtC_Widget* QtC_Widget_create(void* parent) {
    return reinterpret_cast<QtC_Widget*>(
        new QWidget(
            reinterpret_cast<QWidget*>(parent)
        )
    );
}

}
