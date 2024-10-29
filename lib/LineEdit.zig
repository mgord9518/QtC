const c = @import("qt.zig").c;

const LineEdit = @This();
const Widget = @import("Widget.zig");

pub fn init(parent: ?*Widget) *LineEdit {
    return @ptrCast(c.QtC_LineEdit_create(
        @ptrCast(parent),
    ));
}

pub fn deinit(self: *LineEdit) void {
    self.widget().object().deinit();
}

pub fn widget(self: *LineEdit) *Widget {
    return @ptrCast(self);
}
