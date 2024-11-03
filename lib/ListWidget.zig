const ListWidget = @This();

const c = @import("qt.zig").c;

const Widget = @import("Widget.zig");
const ListView = @import("ListView.zig");

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *ListWidget {
    return @ptrCast(c.QtC_ListWidget_create(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *ListWidget) void {
    c.QtC_ListWidget_delete(@ptrCast(self));
}

pub fn addItem(self: *ListWidget, item: []const u8) void {
    const str = c.QtC_String_new(item.ptr, @intCast(item.len));
    defer c.QtC_String_delete(str);

    c.QtC_ListWidget_addItemString(
        @ptrCast(self),
        str,
    );
}

pub fn widget(self: *ListWidget) *Widget {
    return @ptrCast(self);
}

pub fn listView(self: *ListWidget) *ListView {
    return @ptrCast(self);
}

pub fn listWidget(self: *ListWidget) *ListWidget {
    return self;
}
