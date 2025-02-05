#include <QtGui/QPixmap>

#include <QtC6/pixmap.h>

extern "C" {

QtC_Pixmap* QtC_Pixmap_create(int width, int height) {
    QPixmap* pixmap = new QPixmap(
        width,
        height
    );

    return reinterpret_cast<QtC_Pixmap*>(pixmap);
}

// TODO: flag type
bool QtC_Pixmap_load(QtC_Pixmap* self, const QtC_String* filename, const char* format, int flags) {
    QPixmap* pixmap = reinterpret_cast<QPixmap*>(self);

    return pixmap->load(
        *reinterpret_cast<const QString*>(filename),
        format
    );
}

bool QtC_Pixmap_loadFromData(QtC_Pixmap* self, const char* data, int data_len, const char* format, int flags) {
    QPixmap* pixmap = reinterpret_cast<QPixmap*>(self);

    return pixmap->loadFromData(
        reinterpret_cast<const uchar *>(data),
        data_len,
        format
    );
}

}
