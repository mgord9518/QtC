#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/pushbutton.h>
#include <QtC6/widget.h>
#include <QtC6/icon.h>
#include <QtC6/abstractbutton.h>

extern "C" {

QtC_COMMON_FUNCTIONS(PushButton);

QtC_PushButton* QtC_PushButton_new(const QtC_Icon* icon, const QtC_String* label, QtC_Widget* parent) {
    QPushButton* but = new QPushButton(
        *QtC_TO_CONST_CLASS(Icon, icon),
        *reinterpret_cast<const QString*>(label),
        QtC_TO_CLASS(Widget, parent)
    );

    return reinterpret_cast<QtC_PushButton*>(but);
}

}
