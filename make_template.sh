#!/bin/sh

prefix="QtC6"

if [ -z $1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Create a basic Widget template based on the first argument given"
    echo
    echo "usage: $0 [CLASS NAME]"
    exit 1
fi

widget_name="$1"
widget_name_lower=$(tr '[:upper:]' '[:lower:]' <<< "$widget_name")

echo "Creating files: \`include/$prefix/${widget_name_lower}.h\` \`lib/${widget_name_lower}.cpp\` \`lib/${widget_name}.zig\`"

echo -e "#pragma once

#include \"private/common.h\"
#include \"widget.h\"

#ifdef __cplusplus
extern \"C\" {
#endif

typedef struct QtC_$widget_name QtC_$widget_name;

QtC_COMMON_DECLS($widget_name);

QtC_${widget_name}* QtC_${widget_name}_new(
    QtC_Widget* parent
);

#ifdef __cplusplus
}
#endif" > "include/$prefix/${widget_name_lower}.h"

echo "#include <QtWidgets/Q${widget_name}>

#include <$prefix/private/common.h>
#include <$prefix/${widget_name_lower}.h>

extern \"C\" {

QtC_COMMON_FUNCTIONS($widget_name);

QtC_${widget_name}* QtC_${widget_name}_new(QtC_Widget* parent) {
    return QtC_FROM_CLASS($widget_name, new Q${widget_name}(
        QtC_TO_CLASS(Widget, parent)
    ));
}

}" > "lib/${widget_name_lower}.cpp"


echo "const qt = @import(\"qt.zig\");
const c = qt.c;

const $widget_name = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
    label: []const u8 = \"\",
};

pub fn init(opts: InitOptions) *$widget_name {
    const str = c.QtC_String_new(opts.label.ptr, @intCast(opts.label.len));
    defer c.QtC_String_delete(str);

    return @ptrCast(c.QtC_${widget_name}_new(
        str,
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *$widget_name) void {
    c.QtC_${widget_name}_delete(@ptrCast(self));
}

pub fn widget(self: *$widget_name) *Widget {
    return @ptrCast(self);
}" > "lib/${widget_name}.zig"
