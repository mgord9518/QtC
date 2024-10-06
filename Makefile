CXX?=g++
CXXFLAGS?=-Iinclude -O2 -Wall -Werror
CC?=gcc
CFLAGS?=-Iinclude -O2 -Wall -Werror
LIBS=-lstdc++ -lQt5Core -lQt5Widgets

base_objects=application.o paintdevice.o
widget_objects=widget.o label.o pushbutton.o
objects=$(base_objects) $(widget_objects)

all: qt-c libQtC.so

clean:
	rm *.o qt-c libQtC.a libQtC.so

qt-c: libQtC.a
	$(CC) -o qt-c src/main.c libQtC.a $(LIBS) $(CFLAGS)

libQtC.a: $(objects)
	ar rcs libQtC.a $(objects)

libQtC.so: $(objects)
	$(CC) -o libQtC.so -shared $(objects)

$(base_objects): %.o: lib/%.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

$(widget_objects): %.o: lib/widgets/%.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@
