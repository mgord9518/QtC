#include <QtWidgets/QMenuBar>

#include <QtC6/private/common.h>
#include <QtC6/string.h>
#include <QtC6/menubar.h>

extern "C" {

QtC_COMMON_FUNCTIONS(MenuBar);

QtC_MenuBar* QtC_MenuBar_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS(MenuBar, new QMenuBar(
        QtC_TO_CLASS(Widget, parent)
    ));
}

void QtC_MenuBar_addMenuString(QtC_MenuBar* self, const QtC_String* label) {
    QtC_TO_CLASS(MenuBar, self)->addMenu(
        *QtC_TO_CONST_CLASS(String, label)
    );
}

}
