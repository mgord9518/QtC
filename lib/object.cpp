#include <QObject>

#include <QtC/private/object_macros.h>
#include <QtC/object.h>

extern "C" {

OBJECT_DEFINE(Object);

QtC_Object* QtC_Object_create(QtC_Object* parent) {
    return reinterpret_cast<QtC_Object*>(
        new QObject(reinterpret_cast<QtC_Object*>(parent))
    );
}

}
