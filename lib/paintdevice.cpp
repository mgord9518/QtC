#include <QtGui/QPaintDevice>

#include <QtC6/private/common.h>
#include <QtC6/paintdevice.h>

extern "C" {

int QtC_PaintDevice_colorCount(const QtC_PaintDevice* self) {
    return QtC_TO_CONST_CLASS(PaintDevice, self)->colorCount();
}

int QtC_PaintDevice_depth(const QtC_PaintDevice* self) {
    return QtC_TO_CONST_CLASS(PaintDevice, self)->depth();
}

}
