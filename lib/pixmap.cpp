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
bool QtC_Pixmap_loadFromFile(QtC_Pixmap* self, const char* filename, int filename_len, const char* format, int flags) {
    QPixmap* pixmap = reinterpret_cast<QPixmap*>(self);

    return pixmap->load(
        QString::fromUtf8(filename, filename_len),
        format
    );
}

}
