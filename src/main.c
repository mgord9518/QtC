#include <stddef.h>

#include <QtC6/application.h>
#include <QtC6/pushbutton.h>
#include <QtC6/label.h>
#include <QtC6/layout.h>
#include <QtC6/boxlayout.h>

#define SLICE(str) str, sizeof(str)

int main(int argc, char** argv) {
    QtC_Application* app = QtC_Application_create(
        argc,
        argv
    );    

    QtC_Widget* window = QtC_Widget_create(NULL);

    QtC_Widget_setWindowTitle(window, SLICE("Qt with C!"));

    QtC_Label* label = QtC_Label_create(
        SLICE("I'm a label!"),
        NULL,
        0
    );

    QtC_PushButton* button = QtC_PushButton_create(
        SLICE("Hello, world!"),
        NULL
    );

    QtC_BoxLayout* layout = QtC_BoxLayout_create(
        QtC_BoxLayout_Direction_BottomToTop,
        window
    );

    QtC_Widget_show((QtC_Widget*)button);

    QtC_Layout_addWidget((QtC_Layout*)layout, button);
    QtC_Layout_addWidget((QtC_Layout*)layout, label);

    QtC_Widget_resize(window, 500, 500);
    QtC_Widget_show(window);

    QtC_Application_exec(app);
}
