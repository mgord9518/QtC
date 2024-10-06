#pragma once

#include <stdbool.h>

typedef struct QtC_Object QtC_Object; \

#define OBJECT_DECLARE(Object) \
    void QtC_##Object##_destroy(QtC_##Object*); \
    bool QtC_##Object##_blockSignals(QtC_##Object*, bool); \
    QtC_Object* QtC_##Object##_parent(const QtC_##Object*); \
    void QtC_##Object##_setParent(QtC_##Object*, QtC_Object*); \
    bool QtC_##Object##_signalsBlocked(const QtC_##Object*); \

#define OBJECT_DEFINE(Object) \
    void QtC_##Object##_destroy(QtC_##Object* obj) { \
        delete reinterpret_cast<Q##Object*>(obj); \
    } \
    bool QtC_##Object##_blockSignals(QtC_##Object* obj, bool block) { \
        return reinterpret_cast<Q##Object*>(obj)->blockSignals(block); \
    } \
    QtC_Object* QtC_##Object##_parent(const QtC_##Object* obj) { \
        return reinterpret_cast<QtC_Object*>( \
            reinterpret_cast<const Q##Object*>(obj)->parent() \
        ); \
    } \
    void QtC_##Object##_setParent(QtC_##Object* obj, QtC_Object* parent) { \
        qobject_cast<QObject*>(reinterpret_cast<Q##Object*>(obj))->setParent( \
            reinterpret_cast<QObject*>(parent) \
        ); \
    } \
    bool QtC_##Object##_signalsBlocked(const QtC_##Object* obj) { \
        return reinterpret_cast<const Q##Object*>(obj)->signalsBlocked(); \
    } \

