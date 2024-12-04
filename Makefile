CXX?=g++
CXXFLAGS?=-Iinclude -O3 -Wall -Werror

CC?=gcc
CFLAGS?=-Iinclude -O2 -Wall -Werror

LDFLAGS=-lstdc++ -lQt6Core -lQt6Widgets -lQt6Gui

objects= \
	application.o \
	object.o paintdevice.o pixmap.o string.o icon.o \
	layout.o boxlayout.o \
	widget.o label.o abstractbutton.o pushbutton.o

all: qt-c libQtC6.so

clean:
	rm $(objects) qt-c libQtC6.a libQtC6.so

qt-c: libQtC6.a
	$(CC) -o qt-c src/main.c libQtC6.a $(LDFLAGS) $(CFLAGS)

libQtC6.a: $(objects)
	ar rcs libQtC6.a $(objects)

libQtC6.so: $(objects)
	$(CC) -o libQtC6.so -shared $(objects)

$(objects): %.o: lib/%.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@
