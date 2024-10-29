const AbstractItemView = @This();

const c = @import("qt.zig").c;

const AbstractScrollArea = @import("AbstractScrollArea.zig");

//pub fn setParent(wid: *Widget, new_parent: ?*Widget) void {
//    c.QtC_Widget_setParentWidget(
//        @ptrCast(wid),
//        @ptrCast(new_parent),
//    );
//}

pub fn abstractScrollArea(self: *AbstractItemView) *AbstractScrollArea {
    return @ptrCast(self);
}
