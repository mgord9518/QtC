#include <QApplication.h>
#include <QPushButton.h>
#include <QWidget.h>

int main(int argc, char** argv) {
    QtC_QApplication* app = QtC_QApplication_create(
        argc,
        argv
    );    

    QtC_QWidget* window = QtC_QWidget_create();

    char text[] = "Hello, world!";
    QtC_QPushButton* button = QtC_QPushButton_create(
        text,
        sizeof(text),
        window
    );

    QtC_QWidget_resize(window, 500, 500);
    QtC_QWidget_show(window);

    QtC_QApplication_exec(app);
}
