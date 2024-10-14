const qt = @import("qt.zig");
const qtc = @import("qtc.zig");

const std = @import("std");

const BoxLayout = @This();

const Widget = @import("Widget.zig");
const Object = @import("Object.zig");

const type_name = "BoxLayout";

pub fn Impl(comptime layout_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn addWidget(self: *Self, child: ?*anyopaque) void {
            qtc.QtC_fn(layout_name, "addWidget")(
                @ptrCast(self),
                child,
            );
        }

        pub fn deinit(self: *Self) void {
            self.widget().object().deinit();
        }

        pub fn layout(self: *Self) *Self {
            return self;
        }
    };
}

pub const Direction = enum(u2) {
    left_to_right = 0,
    right_to_left = 1,
    top_to_bottom = 2,
    bottom_to_top = 3,
};

pub fn init(direction: Direction, parent: ?*anyopaque) *Impl(type_name) {
    return @ptrCast(
        qtc.QtC_fn("BoxLayout", "create")(
            @intFromEnum(direction),
            parent,
        ),
    );
}
