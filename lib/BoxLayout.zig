const c = @import("qt.zig").c;

const BoxLayout = @This();

const Layout = @import("Layout.zig");
const Widget = @import("Widget.zig");

pub fn deinit(self: *BoxLayout) void {
    self.widget().object().deinit();
}

pub fn addLayout(self: *BoxLayout, child: ?*Layout) void {
    c.QtC_BoxLayout_addLayout(
        @ptrCast(self),
        @ptrCast(child),
    );
}

// TODO
pub fn layout(self: *BoxLayout) *Layout {
    return @ptrCast(self);
}

pub fn boxLayout(self: *BoxLayout) *BoxLayout {
    return self;
}

pub const Direction = enum(u2) {
    left_to_right = 0,
    right_to_left = 1,
    top_to_bottom = 2,
    bottom_to_top = 3,
};

pub fn init(direction: Direction, parent: ?*Widget) *BoxLayout {
    return @ptrCast(
        c.QtC_BoxLayout_create(
            @intFromEnum(direction),
            parent,
        ),
    );
}
