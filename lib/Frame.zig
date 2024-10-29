const Frame = @This();

const c = @import("qt.zig").c;

const Widget = @import("Widget.zig");

//pub fn setParent(wid: *Widget, new_parent: ?*Widget) void {
//    c.QtC_Widget_setParentWidget(
//        @ptrCast(wid),
//        @ptrCast(new_parent),
//    );
//}

pub fn widget(self: *Frame) *Widget {
    return @ptrCast(self);
}
