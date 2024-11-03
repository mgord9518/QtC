#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/stringlist.h>
#include <QtC6/string.h>

extern "C" {

QtC_COMMON_FUNCTIONS(StringList);

QtC_StringList* QtC_StringList_new() {
    return QtC_FROM_CLASS(StringList, new QStringList());
}

void QtC_StringList_append(QtC_StringList* self, const QtC_String* text) {
    QtC_TO_CLASS(StringList, self)->append(
        *QtC_TO_CONST_CLASS(String, text)
    );
}

}
