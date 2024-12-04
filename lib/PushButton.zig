const std = @import("std");
const qt = @import("qt.zig");
const c = qt.c;

const PushButton = @This();

pub const InitOptions = struct {
    icon: ?*const qt.Icon = null,
    parent: ?*qt.widgets.Widget = null,
    label: []const u8 = "",
};

pub fn init(opts: InitOptions) *PushButton {
    const str = c.QtC_String_new(opts.label.ptr, @intCast(opts.label.len));
    defer c.QtC_String_delete(str);

    var icon: ?*const c.QtC_Icon = @ptrCast(opts.icon);
    if (icon == null) {
        std.debug.print("new\n", .{});
        icon = c.QtC_Icon_new();
    }

    // Only free this data if we own it
    //defer if (opts.icon == null) c.QtC_Icon_delete(@constCast(icon));

    return @ptrCast(c.QtC_PushButton_create(
        icon,
        str,
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *PushButton) void {
    c.QtC_PushButton_delete(@ptrCast(self));
}

pub fn abstractButton(self: *PushButton) *qt.widgets.AbstractButton {
    return @ptrCast(self);
}

pub fn widget(self: *PushButton) *qt.widgets.Widget {
    return @ptrCast(self);
}

pub fn object(self: *PushButton) *qt.Object {
    return @ptrCast(self);
}
