const qt = @import("qt.zig");
const c = qt.c;

const TabWidget = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *TabWidget {
    return @ptrCast(c.QtC_TabWidget_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *TabWidget) void {
    c.QtC_TabWidget_delete(@ptrCast(self));
}

pub fn widget(self: *TabWidget) *Widget {
    return @ptrCast(self);
}
