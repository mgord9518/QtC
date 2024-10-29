const ListWidget = @This();

const c = @import("qt.zig").c;

const Widget = @import("Widget.zig");
const ListView = @import("ListView.zig");

pub fn init(parent: ?*Widget) *ListWidget {
    return @ptrCast(c.QtC_ListWidget_create(
        @ptrCast(parent),
    ));
}

pub fn widget(self: *ListWidget) *Widget {
    return @ptrCast(self);
}

pub fn listView(self: *ListWidget) *ListView {
    return @ptrCast(self);
}
