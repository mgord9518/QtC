CXX?=g++
CXXFLAGS?=-Iinclude -O3 -Wall -Werror

CC?=gcc
CFLAGS?=-Iinclude -O2 -Wall -Werror

LDFLAGS=-lstdc++ -lQt6Core -lQt6Widgets

objects= \
	application.o \
	paintdevice.o \
	layout.o boxlayout.o \
	widget.o label.o pushbutton.o

all: qt-c libQtC.so

clean:
	rm $(objects) qt-c libQtC.a libQtC.so

qt-c: libQtC.a
	$(CC) -o qt-c src/main.c libQtC.a $(LDFLAGS) $(CFLAGS)

libQtC.a: $(objects)
	ar rcs libQtC.a $(objects)

libQtC.so: $(objects)
	$(CC) -o libQtC.so -shared $(objects)

$(objects): %.o: lib/%.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@
