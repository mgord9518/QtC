const AbstractButton = @This();

const qtc = @import("qtc.zig");

const type_name = "AbstractButton";

pub fn Impl(comptime widget_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn setText(self: *Self, label: []const u8) void {
            qtc.QtC_fn(widget_name, "setText")(
                @ptrCast(self),
                label.ptr,
                @intCast(label.len),
            );
        }

        pub fn deinit(self: *Self) void {
            self.widget().object().deinit();
        }

        pub fn widget(self: *Self) *Self {
            return self;
        }
    };
}
