const Label = @This();
const Widget = @import("Widget.zig");

const c = Widget.c;

pub fn init(label: []const u8, parent: ?*Widget) *Label {
    return @ptrCast(c.QtC_Label_create(
        label.ptr,
        @intCast(label.len),
        @ptrCast(parent),
    ));
}

pub fn deinit(label: *Label) void {
    label.widget().deinit();
}

pub fn widget(wid: *Label) *Widget.WidgetGen("Label") {
    return @ptrCast(wid);
}
