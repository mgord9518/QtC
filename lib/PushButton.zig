const c = @import("qt.zig").c;

const PushButton = @This();
const Widget = @import("Widget.zig");
const AbstractButton = @import("AbstractButton.zig");

pub const Options = struct {
    parent: ?*Widget = null,
    label: []const u8 = "",
};

pub fn init(opts: Options) *PushButton {
    const str = c.QtC_String_new(opts.label.ptr, @intCast(opts.label.len));
    defer c.QtC_String_delete(str);

    return @ptrCast(c.QtC_PushButton_create(
        str,
        @ptrCast(opts.parent),
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
