#include <QtWidgets/QLineEdit>

#include <QtC6/private/common.h>
#include <QtC6/widget.h>
#include <QtC6/lineedit.h>

extern "C" {

QtC_LineEdit* QtC_LineEdit_create(QtC_Widget* parent) {
    return QtC_FROM_CLASS(LineEdit, new QLineEdit(
        QtC_TO_CLASS(Widget, parent)
    ));
}

}
