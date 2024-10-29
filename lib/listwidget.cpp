#include <QtWidgets/QListWidget>

#include <QtC6/private/common.h>
#include <QtC6/listwidget.h>

extern "C" {

QtC_ListWidget* QtC_ListWidget_create(QtC_Widget* parent) {
    QListWidget* list = new QListWidget(
        reinterpret_cast<QWidget*>(parent)
    );

    return reinterpret_cast<QtC_ListWidget*>(list);
}

}
