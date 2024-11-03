const qt = @import("qt.zig");
const c = qt.c;

const TreeWidgetItem = @This();
const TreeWidget = qt.widgets.TreeWidget;

pub const InitOptions = struct {
    parent: ?*TreeWidget = null,
    type: ItemType = .type,
};

pub fn init(opts: InitOptions) *TreeWidgetItem {
    return @ptrCast(c.QtC_TreeWidgetItem_new(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *TreeWidgetItem) void {
    c.QtC_TreeWidgetItem_delete(@ptrCast(self));
}

pub fn setText(self: *TreeWidgetItem, column: u32, text: []const u8) void {
    const str = c.QtC_String_new(text.ptr, @intCast(text.len));
    defer c.QtC_String_delete(str);

    c.QtC_TreeWidgetItem_setText(@ptrCast(self), @intCast(column), str);
}

pub const ItemType = enum(c_uint) {
    type = 0,
    user_type = 1000,
    _,
};
