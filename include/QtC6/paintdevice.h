#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct QtC_PaintDevice QtC_PaintDevice;

int QtC_PaintDevice_colorCount(
    const QtC_PaintDevice* self
);

int QtC_PaintDevice_depth(
    const QtC_PaintDevice* self
);

#ifdef __cplusplus
}
#endif
