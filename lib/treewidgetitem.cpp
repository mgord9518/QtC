#include <QtWidgets/QTreeWidgetItem>

#include <QtC6/private/common.h>
#include <QtC6/treewidgetitem.h>
#include <QtC6/string.h>

extern "C" {

QtC_COMMON_FUNCTIONS(TreeWidgetItem);

QtC_TreeWidgetItem* QtC_TreeWidgetItem_new(QtC_TreeWidget* parent) {
    return QtC_FROM_CLASS(TreeWidgetItem, new QTreeWidgetItem(
        QtC_TO_CLASS(TreeWidget, parent)
    ));
}

QtC_TreeWidgetItem* QtC_TreeWidgetItem_newChild(QtC_TreeWidgetItem* parent) {
    return QtC_FROM_CLASS(TreeWidgetItem, new QTreeWidgetItem(
        QtC_TO_CLASS(TreeWidgetItem, parent)
    ));
}

void QtC_TreeWidgetItem_setText(QtC_TreeWidgetItem* self, int column, const QtC_String* text) {
    QtC_TO_CLASS(TreeWidgetItem, self)->setText(
        column,
        *QtC_TO_CONST_CLASS(String, text)
    );
}

}
