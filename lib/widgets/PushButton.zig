const PushButton = @This();
const Widget = @import("Widget.zig");
const Object = @import("../Object.zig");
const PaintDevice = @import("../PaintDevice.zig");

const type_name = "PushButton";

const c = Widget.c;

pub fn init(label: []const u8, parent: ?*Widget) *PushButton {
    return @ptrCast(c.QtC_PushButton_create(
        label.ptr,
        @intCast(label.len),
        @ptrCast(parent),
    ));
}

pub fn deinit(button: *PushButton) void {
    button.object().deinit();
}

pub fn widget(button: *PushButton) *Widget.Gen(type_name) {
    return @ptrCast(button);
}

pub fn object(button: *PushButton) *Object.Gen(type_name) {
    return @ptrCast(button);
}

pub fn paintDevice(button: *PushButton) *PaintDevice.Gen(type_name) {
    return @ptrCast(button);
}
