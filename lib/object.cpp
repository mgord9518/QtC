#include <QtCore/QObject>
#include <QtWidgets/QPushButton>

#include <stdio.h>

#include <QtC6/private/widget_defs.h>
#include <QtC6/private/common.h>
#include <QtC6/object.h>

extern "C" {

void QtC_Object_delete(QtC_Object* self) {
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

void test() {
    printf("test\n");
}

// TODO
void QtC_Object_connect(const QtC_Object* sender, const void* signal, const void* function) {
//    QObject::connect(
//        QtC_TO_CONST_CLASS(PushButton, sender),
//        //(void (QPushButton::*)())(&QPushButton::clicked),
//        (void (QPushButton::*)())(*signal),
//        //(const void (*)())(function)
//        [=]() {
//            ((void (*)())(function))();
//        }
//        //static_cast<Qt::ConnectionType>(type)
//    );
}

}
