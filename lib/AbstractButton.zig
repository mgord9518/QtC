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

pub fn widget(self: *AbstractButton) *Widget {
    return @ptrCast(self);
}
