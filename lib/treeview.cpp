#include <QtWidgets/QTreeView>

#include <stdbool.h>
#include <QtC6/private/common.h>
#include <QtC6/treeview.h>

extern "C" {

QtC_COMMON_FUNCTIONS(TreeView);

QtC_TreeView* QtC_TreeView_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS(TreeView, new QTreeView(
        QtC_TO_CLASS(Widget, parent)
    ));
}

void QtC_TreeView_setRootIsDecorated(QtC_TreeView* self, bool show) {
    QtC_TO_CLASS(TreeView, self)->setRootIsDecorated(show);
}

}
