#include <QtWidgets/QListView>

#include <QtC6/private/common.h>
#include <QtC6/listview.h>

extern "C" {

QtC_ListView* QtC_ListView_create(QtC_Widget* parent) {
    QListView* list = new QListView(
        reinterpret_cast<QWidget*>(parent)
    );

    return reinterpret_cast<QtC_ListView*>(list);
}

}
