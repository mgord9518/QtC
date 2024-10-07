#include <QtC5/application.h>
#include <QtC5/widgets/pushbutton.h>
#include <QtC5/widgets/label.h>
#include <QtC5/layouts/boxlayout.h>

int main(int argc, char** argv) {
    QtC_Application* app = QtC_Application_create(
        argc,
        argv
    );    

    QtC_Widget* window = QtC_Widget_create();

    char window_title[] = "Qt with C!";
    QtC_Widget_setWindowTitle(window, window_title, sizeof(window_title));


    char text[] = "Hello, world!";
    QtC_PushButton* button = QtC_PushButton_create(
        text,
        sizeof(text),
        0
    );

    QtC_BoxLayout* layout = QtC_BoxLayout_create(window);
    QtC_BoxLayout_addWidget(layout, (QtC_Widget*)button);

    QtC_Widget_resize(window, 500, 500);
    QtC_Widget_show(window);

    QtC_Application_exec(app);
}
