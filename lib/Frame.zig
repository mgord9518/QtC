const Frame = @This();

const c = @import("qt.zig").c;

const Widget = @import("Widget.zig");

pub fn widget(self: *Frame) *Widget {
    return @ptrCast(self);
}
