CXX?=g++
CXXFLAGS?=-Iinclude -O2 -Wall -Werror
CC?=gcc
CFLAGS?=-Iinclude -O2 -Wall -Werror
LIBS=-lstdc++ -lQt5Core -lQt5Widgets

all: qt-c

clean:
	rm *.o qt-c libQtC.a

qt-c: libQtC.a
	$(CC) -o qt-c src/main.c libQtC.a $(LIBS) $(CFLAGS)

libQtC.a: Application.o PaintDevice.o widgets.Widget.o widgets.Label.o widgets.PushButton.o
	ar rcs libQtC.a \
		Application.o \
		PaintDevice.o \
		widgets.Label.o \
		widgets.PushButton.o \
		widgets.Widget.o

Application.o:
	$(CXX) -c -o Application.o lib/application.cpp $(CXXFLAGS)

PaintDevice.o:
	$(CXX) -c -o PaintDevice.o lib/paintdevice.cpp $(CXXFLAGS)

widgets.Widget.o:
	$(CXX) -c -o widgets.Widget.o lib/widgets/widget.cpp $(CXXFLAGS)

widgets.Label.o:
	$(CXX) -c -o widgets.Label.o lib/widgets/label.cpp $(CXXFLAGS)

widgets.PushButton.o:
	$(CXX) -c -o widgets.PushButton.o lib/widgets/pushbutton.cpp $(CXXFLAGS)
