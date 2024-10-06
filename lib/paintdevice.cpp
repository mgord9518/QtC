#include <QtGui/QPaintDevice>

#include <QtC/private/paintdevice_macros.h>
#include <QtC/paintdevice.h>

extern "C" {

PAINTDEVICE_DEFINE(PaintDevice);

//QtC_Object* QtC_Object_create(QtC_Object* parent) {
//    return reinterpret_cast<QtC_Object*>(
//        new QObject(reinterpret_cast<QtC_Object*>(parent))
//    );
//}

}
