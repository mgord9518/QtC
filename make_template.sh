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

#include \"private/widget_defs.h\"
#include \"private/common.h\"

#ifdef __cplusplus
extern \"C\" {
#endif

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
};

pub fn init(opts: InitOptions) *$widget_name {
    return @ptrCast(c.QtC_${widget_name}_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *$widget_name) void {
    c.QtC_${widget_name}_delete(@ptrCast(self));
}

pub fn widget(self: *$widget_name) *Widget {
    return @ptrCast(self);
}" > "lib/${widget_name}.zig"

echo "Appending to: \`include/$prefix/private/widget_defs.h\` \`lib/qt_widgets.zig\`"

grep -qxF "DEF($widget_name)" "include/$prefix/private/widget_defs.h" || echo "DEF($widget_name)" >> "include/$prefix/private/widget_defs.h"
grep -qxF "pub const @\"$widget_name\" = @import(\"${widget_name}.zig\");" "lib/qt_widgets.zig" || echo "pub const @\"$widget_name\" = @import(\"${widget_name}.zig\");" >> "lib/qt_widgets.zig"

