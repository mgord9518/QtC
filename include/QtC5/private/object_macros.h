#pragma once

#include <stdbool.h>
#include "common.h"

typedef struct QtC_Object QtC_Object;

#define OBJECT_DECLARE(Self) \
    void        QtC_FN(Self,       destroy); \
    bool        QtC_FN(Self,       blockSignals, bool block); \
    QtC_Object* QtC_CONST_FN(Self, parent); \
    void        QtC_FN(Self,       setParent, QtC_Object* parent); \
    bool        QtC_CONST_FN(Self, signalsBlocked); \

#define OBJECT_DEFINE(Self) \
    void QtC_FN(Self, destroy) { \
        delete QtC_TO_CLASS(Self, self); \
    } \
    bool QtC_FN(Self, blockSignals, bool block) { \
        return QtC_TO_CLASS(Self, self)->blockSignals(block); \
    } \
    QtC_Object* QtC_CONST_FN(Self, parent) { \
        return QtC_FROM_CLASS(Object, \
            QtC_TO_CONST_CLASS(Self, self)->parent() \
        ); \
    } \
    void QtC_FN(Self, setParent, QtC_Object* parent) { \
        qobject_cast<QObject*>(QtC_TO_CLASS(Self, self))->setParent( \
            QtC_TO_CLASS(Object, parent) \
        ); \
    } \
    bool QtC_CONST_FN(Self, signalsBlocked) {\
        return QtC_TO_CONST_CLASS(Self, self)->signalsBlocked(); \
    } \

