#include <QtWidgets/QListWidget>

#include <QtC6/private/common.h>
#include <QtC6/listwidget.h>
#include <QtC6/string.h>

extern "C" {

QtC_COMMON_FUNCTIONS(ListWidget);

QtC_ListWidget* QtC_ListWidget_create(QtC_Widget* parent) {
    QListWidget* list = new QListWidget(
        reinterpret_cast<QWidget*>(parent)
    );

    return reinterpret_cast<QtC_ListWidget*>(list);
}

void QtC_ListWidget_addItemString(QtC_ListWidget* self, const QtC_String* item) {
    QtC_TO_CLASS(ListWidget, self)->addItem(
        *QtC_TO_CONST_CLASS(String, item)
    );
}

}
