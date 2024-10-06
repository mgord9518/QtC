const PushButton = @This();
const Widget = @import("Widget.zig");

const c = Widget.c;

pub fn init(label: []const u8, parent: ?*Widget) *PushButton {
    return @ptrCast(c.QtC_PushButton_create(
        label.ptr,
        @intCast(label.len),
        @ptrCast(parent),
    ));
}

pub fn deinit(button: *PushButton) void {
    button.widget().deinit();
}

pub fn widget(button: *PushButton) *Widget.WidgetGen("Widget") {
    return @ptrCast(button);
}
