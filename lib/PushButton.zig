const c = @import("qt.zig").c;

const PushButton = @This();
const Widget = @import("Widget.zig");
const AbstractButton = @import("AbstractButton.zig");

pub fn init(label: []const u8, parent: ?*anyopaque) *PushButton {
    const str = c.QtC_String_create(label.ptr, @intCast(label.len));

    return @ptrCast(c.QtC_PushButton_create(
        str,
        @ptrCast(parent),
    ));
}

pub fn deinit(button: *PushButton) void {
    button.widget().object().deinit();
}

pub fn abstractButton(button: *PushButton) *AbstractButton {
    return @ptrCast(button);
}

pub fn widget(button: *PushButton) *Widget {
    return @ptrCast(button);
}
