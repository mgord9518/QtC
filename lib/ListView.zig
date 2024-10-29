const ListView = @This();

const c = @import("qt.zig").c;

const Widget = @import("Widget.zig");
const AbstractItemView = @import("AbstractItemView.zig");

//pub fn setParent(wid: *Widget, new_parent: ?*Widget) void {
//    c.QtC_Widget_setParentWidget(
//        @ptrCast(wid),
//        @ptrCast(new_parent),
//    );
//}

pub fn init(parent: ?*Widget) *ListView {
    return @ptrCast(c.QtC_ListView_create(
        @ptrCast(parent),
    ));
}

pub fn widget(self: *ListView) *Widget {
    return @ptrCast(self);
}

pub fn abstractItemView(self: *ListView) *AbstractItemView {
    return @ptrCast(self);
}
