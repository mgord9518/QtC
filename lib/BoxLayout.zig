const c = @import("qt.zig").c;

const BoxLayout = @This();

const Widget = @import("Widget.zig");
const Object = @import("Object.zig");

pub fn addWidget(self: *BoxLayout, child: ?*Widget) void {
    c.QtC_Layout_addWidget(
        @ptrCast(self),
        child,
    );
}

pub fn deinit(self: *BoxLayout) void {
    self.widget().object().deinit();
}

// TODO
pub fn layout(self: *BoxLayout) *BoxLayout {
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
