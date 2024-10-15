#pragma once

typedef struct QtC_Widget QtC_Widget;

#define QtC_TO_CLASS(Class, object) \
    reinterpret_cast<Q##Class*>(object)

#define QtC_FROM_CLASS(Class, object) \
    reinterpret_cast<QtC_##Class*>(object)

#define QtC_TO_CONST_CLASS(Class, object) \
    reinterpret_cast<const Q##Class*>(object)

#define QtC_FROM_CONST_CLASS(Class, object) \
    reinterpret_cast<const QtC_##Class*>(object)

