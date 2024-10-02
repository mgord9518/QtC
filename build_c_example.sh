#!/bin/sh

$CC \
    -o main \
    -lQt5Core \
    -lQt5Widgets \
    -lstdc++ \
    src/main.c \
    -I include/ \
    build/libQt_c.a
