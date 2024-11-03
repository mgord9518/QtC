const qt = @import("qt.zig");
const c = qt.c;

const TreeWidget = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *TreeWidget {
    return @ptrCast(c.QtC_TreeWidget_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *TreeWidget) void {
    c.QtC_TreeWidget_delete(@ptrCast(self));
}

pub fn setColumnCount(self: *TreeWidget, columns: u32) void {
    c.QtC_TreeWidget_setColumnCount(@ptrCast(self), @intCast(columns));
}

pub fn setHeaderLabels(self: *TreeWidget, labels: []const []const u8) void {
    const list = c.QtC_StringList_new();
    defer c.QtC_StringList_delete(list);

    for (labels) |label| {
        const str = c.QtC_String_new(label.ptr, @intCast(label.len));
        defer c.QtC_String_delete(str);

        c.QtC_StringList_append(list, str);
    }

    c.QtC_TreeWidget_setHeaderLabels(@ptrCast(self), list);
}

pub fn widget(self: *TreeWidget) *Widget {
    return @ptrCast(self);
}
