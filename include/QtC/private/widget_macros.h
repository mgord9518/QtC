#define WIDGET_DECLARE(Widget) \
    void QtC_##Widget##_destroy(QtC_##Widget*); \
    void QtC_##Widget##_resize(QtC_##Widget*, int, int); \
    void QtC_##Widget##_show(QtC_##Widget*); \
    void QtC_##Widget##_setWindowTitle(QtC_##Widget*, const char*, int); \

#define WIDGET_DEFINE(Widget) \
    void QtC_##Widget##_destroy(QtC_##Widget* wid) { \
        delete reinterpret_cast<Q##Widget*>(wid); \
    } \
    void QtC_##Widget##_resize(QtC_##Widget* wid, int w, int h) { \
        reinterpret_cast<Q##Widget*>(wid)->resize(w, h); \
    } \
    void QtC_##Widget##_show(QtC_##Widget* wid) { \
        reinterpret_cast<Q##Widget*>(wid)->show(); \
    } \
    void QtC_##Widget##_setWindowTitle(QtC_##Widget* wid, const char* label, int label_len) { \
        reinterpret_cast<Q##Widget*>(wid)->setWindowTitle(QString::fromUtf8(label, label_len)); \
    } \

