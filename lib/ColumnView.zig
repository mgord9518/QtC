const qt = @import("qt.zig");
const c = qt.c;

const ColumnView = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *ColumnView {
    return @ptrCast(c.QtC_ColumnView_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *ColumnView) void {
    c.QtC_ColumnView_delete(@ptrCast(self));
}

pub fn widget(self: *ColumnView) *Widget {
    return @ptrCast(self);
}
