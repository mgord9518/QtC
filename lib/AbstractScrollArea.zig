const AbstractScrollArea = @This();

const c = @import("qt.zig").c;

const Frame = @import("Frame.zig");

//pub fn setParent(wid: *Widget, new_parent: ?*Widget) void {
//    c.QtC_Widget_setParentWidget(
//        @ptrCast(wid),
//        @ptrCast(new_parent),
//    );
//}

pub fn frame(self: *AbstractScrollArea) *Frame {
    return @ptrCast(self);
}
