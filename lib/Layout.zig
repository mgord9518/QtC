const qt = @import("qt.zig");
const c = qt.c;

const Layout = @This();

const Widget = @import("Widget.zig");
const Object = @import("Object.zig");

pub fn addWidget(self: *Layout, child: ?*Widget) void {
    c.QtC_Layout_addWidget(
        @ptrCast(self),
        @ptrCast(child),
    );
}

pub fn deinit(self: *Layout) void {
    self.widget().object().deinit();
}

pub fn layout(self: *Layout) *Layout {
    return self;
}

pub fn setAlignment(self: *Layout, child: *Widget, alignment: qt.Alignment) bool {
    return c.QtC_Layout_setAlignment(
        @ptrCast(self),
        @ptrCast(child),
        @intFromEnum(alignment.vertical) | @intFromEnum(alignment.horizontal),
    );
}

pub const Direction = enum(u2) {
    left_to_right = 0,
    right_to_left = 1,
    top_to_bottom = 2,
    bottom_to_top = 3,
};
