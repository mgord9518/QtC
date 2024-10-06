CXX?=g++ -O2 -Wall
BUILD_DIR=build

all: executable

clean:
	rm -r $(BUILD_DIR)

executable: libQtC
	$(CC) -o qt-c \
		src/main.c \
		$(BUILD_DIR)/libQtC.a \
		-lQt5Core \
		-lQt5Widgets \
		-lstdc++ \
		-I include

libQtC: widgets
	$(CXX) -c -o $(BUILD_DIR)/libQtC_Application.o lib/application.cpp -lstdc++ -I include
	ar rcs $(BUILD_DIR)/libQtC.a \
		$(BUILD_DIR)/libQtC_Application.o \
		$(BUILD_DIR)/libQtC_widgets.Label.o \
		$(BUILD_DIR)/libQtC_widgets.PushButton.o \
		$(BUILD_DIR)/libQtC_widgets.Widget.o

widgets: build_dir widget_Widget widget_Label widget_PushButton

widget_Widget:
	$(CXX) -c -o $(BUILD_DIR)/libQtC_widgets.Widget.o lib/widgets/widget.cpp -lstdc++ -I include

widget_Label:
	$(CXX) -c -o $(BUILD_DIR)/libQtC_widgets.Label.o lib/widgets/label.cpp -lstdc++ -I include

widget_PushButton:
	$(CXX) -c -o $(BUILD_DIR)/libQtC_widgets.PushButton.o lib/widgets/pushbutton.cpp -lstdc++ -I include

build_dir:
	mkdir -p $(BUILD_DIR)
