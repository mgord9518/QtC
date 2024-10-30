#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/string.h>

extern "C" {

QtC_COMMON_FUNCTIONS(String);

QtC_String* QtC_String_new(const char* string, int string_len) {
    return QtC_FROM_CLASS(String,
        new QString(QByteArray(string, string_len))
    );
}

}
