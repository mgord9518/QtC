const AbstractButton = @This();
const Widget = @import("Widget.zig");

const c = @import("qt.zig").c;

pub fn setText(self: *AbstractButton, label: []const u8) void {
    c.QtC_fn("AbstractButton", @src().fn_name)(
        @ptrCast(self),
        label.ptr,
        @intCast(label.len),
    );
}

pub fn deinit(self: *AbstractButton) void {
    self.widget().object().deinit();
}

pub fn connect(self: *AbstractButton, signal: Signal, function: *const anyopaque) void {
    c.QtC_AbstractButton_connect(
        @ptrCast(self),
        @intFromEnum(signal),
        function,
    );
}

pub fn widget(self: *AbstractButton) *Widget {
    return @ptrCast(self);
}

pub const Signal = enum(c_uint) {
    clicked = c.QtC_AbstractButton_Signal_clicked,
    pressed = c.QtC_AbstractButton_Signal_pressed,
    released = c.QtC_AbstractButton_Signal_released,
    toggled = c.QtC_AbstractButton_Signal_toggled,
};
