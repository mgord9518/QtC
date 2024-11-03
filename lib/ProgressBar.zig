const qt = @import("qt.zig");
const c = qt.c;

const ProgressBar = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *ProgressBar {
    return @ptrCast(c.QtC_ProgressBar_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *ProgressBar) void {
    c.QtC_ProgressBar_delete(@ptrCast(self));
}

pub fn widget(self: *ProgressBar) *Widget {
    return @ptrCast(self);
}
