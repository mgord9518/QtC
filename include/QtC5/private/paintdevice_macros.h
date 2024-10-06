#pragma once

typedef struct QtC_PaintDevice QtC_PaintDevice;

#define PAINTDEVICE_DECLARE(PaintDevice) \
    int QtC_##PaintDevice##_colorCount(QtC_##PaintDevice*); \
    int QtC_##PaintDevice##_depth(QtC_##PaintDevice*); \

#define PAINTDEVICE_DEFINE(PaintDevice) \
    int QtC_##PaintDevice##_colorCount(QtC_##PaintDevice* dev) { \
        return reinterpret_cast<Q##PaintDevice*>(dev)->colorCount(); \
    } \
    int QtC_##PaintDevice##_depth(QtC_##PaintDevice* dev) { \
        return reinterpret_cast<Q##PaintDevice*>(dev)->depth(); \
    } \

