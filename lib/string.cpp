#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/string.h>

extern "C" {

const QtC_String* QtC_String_create(const char* string, int string_len) {
    return reinterpret_cast<QtC_String*>(
        new QString(QByteArray(string, string_len))
    );
}

}
