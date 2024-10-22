#include <QtWidgets/QWidget>

#include <QtC6/private/common.h>
#include <QtC6/string.h>
#include <stdint.h>

extern "C" {

QtC_String* QtC_String_create(const char* string, size_t string_len) {
    QString* qstring = new QString();

    return reinterpret_cast<QtC_String*>(
        qstring->fromUtf8(string, string_len)
    );
}

}
