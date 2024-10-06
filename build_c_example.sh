#!/bin/sh

$CC \
    -o qt-c \
    -lQt5Core \
    -lQt5Widgets \
    -lstdc++ \
    src/main.c \
    -I include/ \
    zig-out/lib/libQtC.a
