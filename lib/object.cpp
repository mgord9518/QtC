#include <QtCore/QObject>

#include <QtC6/private/common.h>
#include <QtC6/object.h>

extern "C" {

void QtC_Object_destroy(QtC_Object* self) {
    delete QtC_TO_CLASS(Object, self);
}

bool QtC_Object_blockSignals(QtC_Object* self, bool block) {
    return QtC_TO_CLASS(Object, self)->blockSignals(block);
}

QtC_Object* QtC_Object_parent(QtC_Object* self) {
    return QtC_FROM_CLASS(Object,
        QtC_TO_CONST_CLASS(Object, self)->parent()
    );
}

void QtC_Object_setParent(QtC_Object* self, QtC_Object* parent) {
    qobject_cast<QObject*>(QtC_TO_CLASS(Object, self))->setParent(
        QtC_TO_CLASS(Object, parent)
    );
}

bool QtC_Object_signalsBlocked(QtC_Object* self) {
    return QtC_TO_CONST_CLASS(Object, self)->signalsBlocked();
}

}
