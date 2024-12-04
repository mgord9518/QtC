const qt = @import("qt.zig");
const c = qt.c;

const TreeView = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *TreeView {
    return @ptrCast(c.QtC_TreeView_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *TreeView) void {
    c.QtC_TreeView_delete(@ptrCast(self));
}

pub fn setRootIsDecorated(self: *TreeView, show: bool) void {
    c.QtC_TreeView_setRootIsDecorated(@ptrCast(self), show);
}

pub fn widget(self: *TreeView) *Widget {
    return @ptrCast(self);
}
