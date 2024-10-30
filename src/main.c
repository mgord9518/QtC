#include <stddef.h>

#include <QtC6/qt.h>
#include <QtC6/widget.h>
#include <QtC6/string.h>
#include <QtC6/application.h>
#include <QtC6/pushbutton.h>
#include <QtC6/label.h>
#include <QtC6/layout.h>
#include <QtC6/boxlayout.h>

#define STR(str) \
    QtC_String_new(str, sizeof(str) - 1)

int main(int argc, char** argv) {
    QtC_Application* app = QtC_Application_create(
        argc,
        argv
    );

    QtC_Widget* window = QtC_Widget_new(NULL, QtC_WindowFlags_Window);

    QtC_Widget_setWindowTitle(window, STR("Qt with C!"));

    QtC_Pixmap* pixmap = QtC_Pixmap_create(0, 0);
    QtC_Pixmap_load(pixmap, STR("clogo.png"), "png", 0);

    QtC_Label* label = QtC_Label_create(
        STR("I'm a label!"),
        NULL,
        0
    );

    QtC_Label_setPixmap(label, pixmap);

    QtC_PushButton* button = QtC_PushButton_create(
        STR("Hello, world!"),
        NULL
    );

    QtC_BoxLayout* layout = QtC_BoxLayout_new(
        QtC_BoxLayout_Direction_BottomToTop,
        window
    );

    QtC_Widget_show((QtC_Widget*)button);

    QtC_Layout_addWidget((QtC_Layout*)layout, (QtC_Widget*)button);
    QtC_Layout_addWidget((QtC_Layout*)layout, (QtC_Widget*)label);

    QtC_Widget_resize(window, 500, 500);
    QtC_Widget_show(window);

    QtC_Application_exec(app);
}
