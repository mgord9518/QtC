CXX?=g++ -O2 -Wall

all: executable

executable: libQtC
	$(CC) -o qt-c \
		src/main.c \
		build/libQtC.a \
		-lQt5Core \
		-lQt5Widgets \
		-lstdc++ \
		-I include

libQtC: widgets
	$(CXX) -c -o build/libQtC_Application.o lib/application.cpp -lstdc++ -I include
	ar rcs build/libQtC.a \
		build/libQtC_Application.o \
		build/libQtC_widgets.Label.o \
		build/libQtC_widgets.PushButton.o \
		build/libQtC_widgets.Widget.o

widgets: widget_Widget widget_Label widget_PushButton

widget_Widget:
	$(CXX) -c -o build/libQtC_widgets.Widget.o lib/widgets/widget.cpp -lstdc++ -I include

widget_Label:
	$(CXX) -c -o build/libQtC_widgets.Label.o lib/widgets/label.cpp -lstdc++ -I include

widget_PushButton:
	$(CXX) -c -o build/libQtC_widgets.PushButton.o lib/widgets/pushbutton.cpp -lstdc++ -I include
