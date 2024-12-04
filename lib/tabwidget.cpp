#include <QtWidgets/QTabWidget>

#include <QtC6/private/common.h>
#include <QtC6/tabwidget.h>

extern "C" {

QtC_COMMON_FUNCTIONS(TabWidget);

QtC_TabWidget* QtC_TabWidget_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS(TabWidget, new QTabWidget(
        QtC_TO_CLASS(Widget, parent)
    ));
}

}
