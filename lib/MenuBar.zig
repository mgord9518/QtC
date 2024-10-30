const qt = @import("qt.zig");
const c = qt.c;

const MenuBar = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *MenuBar {
    return @ptrCast(c.QtC_MenuBar_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *MenuBar) void {
    c.QtC_MenuBar_delete(@ptrCast(self));
}

pub fn addMenu(self: *MenuBar, label: []const u8) void {
    const str = c.QtC_String_new(label.ptr, @intCast(label.len));
    defer c.QtC_String_delete(str);

    c.QtC_MenuBar_addMenuString(@ptrCast(self), str);
}

pub fn widget(self: *MenuBar) *Widget {
    return @ptrCast(self);
}

pub fn menuBar(self: *MenuBar) *MenuBar {
    return self;
}
