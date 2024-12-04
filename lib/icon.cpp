#include <QtGui/QIcon>

#include <QtC6/private/common.h>
#include <QtC6/icon.h>

extern "C" {

QtC_COMMON_FUNCTIONS(Icon);

QtC_Icon* QtC_Icon_new() {
    return QtC_FROM_CLASS(Icon, new QIcon());
}

QtC_Icon* QtC_Icon_fromTheme(QtC_Icon_ThemeIcon icon) {
    QIcon* icon_object = new QIcon();
    *icon_object = QIcon::fromTheme(static_cast<QIcon::ThemeIcon>(icon));

    return QtC_FROM_CLASS(Icon, icon_object);
}

}
