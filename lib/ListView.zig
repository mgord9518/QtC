const ListView = @This();

const c = @import("qt.zig").c;

const Widget = @import("Widget.zig");
const AbstractItemView = @import("AbstractItemView.zig");

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *ListView {
    return @ptrCast(c.QtC_ListView_create(
        @ptrCast(opts.parent),
    ));
}

pub fn widget(self: *ListView) *Widget {
    return @ptrCast(self);
}

pub fn abstractItemView(self: *ListView) *AbstractItemView {
    return @ptrCast(self);
}
