#include <QtWidgets/QColumnView>

#include <QtC6/private/common.h>
#include <QtC6/columnview.h>

extern "C" {

QtC_COMMON_FUNCTIONS(ColumnView);

QtC_ColumnView* QtC_ColumnView_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS(ColumnView, new QColumnView(
        QtC_TO_CLASS(Widget, parent)
    ));
}

}
