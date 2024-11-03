#pragma once

#define QtC_TO_CLASS(Class, object) \
    reinterpret_cast<Q##Class*>(object)

#define QtC_FROM_CLASS(Class, object) \
    reinterpret_cast<QtC_##Class*>(object)

#define QtC_TO_CONST_CLASS(Class, object) \
    reinterpret_cast<const Q##Class*>(object)

#define QtC_FROM_CONST_CLASS(Class, object) \
    reinterpret_cast<const QtC_##Class*>(object)

#define QtC_COMMON_FUNCTIONS(Class) \
    void QtC_##Class##_delete(QtC_##Class* object) { \
        delete reinterpret_cast<Q##Class*>(object); \
    }

#define QtC_COMMON_DECLS(Class) \
    void QtC_##Class##_delete(QtC_##Class* object);

