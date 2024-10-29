#!/bin/sh

if [ -z $1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Create a basic Widget template based on the first argument given"
    echo
    echo "usage: $0 [CLASS NAME]"
    exit 1
fi

widget_name="$1"
widget_name_lower=$(tr '[:upper:]' '[:lower:]' <<< "$widget_name")

echo $widget_name_lower

echo -e "#pragma once

#include \"widget.h\"

#ifdef __cplusplus
extern \"C\" {
#endif

typedef struct QtC_$widget_name QtC_$widget_name;

QtC_${widget_name}* QtC_${widget_name}_create(
    QtC_Widget* parent,
);

#ifdef __cplusplus
}
#endif" > "include/QtC6/${widget_name_lower}.h"

echo "#include <QtWidgets/Q${widget_name}>

#include <QtC6/private/common.h>
#include <QtC6/${widget_name_lower}.h>

extern \"C\" {

QtC_${widget_name}* QtC_${widget_name}_create(QtC_Widget* parent) {
    return QtC_FROM_CLASS($widget_name, new Q${widget_name}(
        QtC_TO_CLASS(Widget, parent),
    ));
}

}" > "lib/${widget_name_lower}.cpp"
