const qtc = @import("qtc.zig");

const PushButton = @This();
const Widget = @import("Widget.zig");
const AbstractButton = @import("AbstractButton.zig");
const PaintDevice = @import("PaintDevice.zig");

const type_name = "PushButton";

pub fn init(label: []const u8, parent: ?*anyopaque) *PushButton {
    return @ptrCast(qtc.QtC_fn("PushButton", "create")(
        label.ptr,
        @intCast(label.len),
        parent,
    ));
}

pub fn deinit(button: *PushButton) void {
    button.widget().object().deinit();
}

pub fn abstractButton(button: *PushButton) *AbstractButton.Gen(type_name) {
    return @ptrCast(button);
}

pub fn widget(button: *PushButton) *Widget.Impl(type_name) {
    return @ptrCast(button);
}
