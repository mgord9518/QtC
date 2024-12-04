#include <QtWidgets/QTreeWidget>

#include <QtC6/private/common.h>
#include <QtC6/treewidget.h>
#include <QtC6/stringlist.h>

extern "C" {

QtC_COMMON_FUNCTIONS(TreeWidget);

QtC_TreeWidget* QtC_TreeWidget_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS(TreeWidget, new QTreeWidget(
        QtC_TO_CLASS(Widget, parent)
    ));
}

void QtC_TreeWidget_setColumnCount(QtC_TreeWidget* self, int columns) {
    QtC_TO_CLASS(TreeWidget, self)->setColumnCount(
        columns
    );
}

void QtC_TreeWidget_setHeaderLabels(QtC_TreeWidget* self, const QtC_StringList* names) {
    QtC_TO_CLASS(TreeWidget, self)->setHeaderLabels(
        *QtC_TO_CONST_CLASS(StringList, names)
    );
}

void QtC_TreeWidget_setSortingEnabled(QtC_TreeWidget* self, bool enabled) {
    QtC_TO_CLASS(TreeWidget, self)->setSortingEnabled(enabled);
}

}
