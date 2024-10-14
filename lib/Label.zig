const qtc = @import("qtc.zig");

const Label = @This();
const Widget = @import("Widget.zig");

pub fn Impl(comptime name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn setText(wid: *Self, lab: []const u8) void {
            qtc.QtC_fn(name, "setText")(
                @ptrCast(wid),
                lab.ptr,
                @intCast(lab.len),
            );
        }

        pub fn deinit(self: *Self) void {
            self.widget().object().deinit();
        }

        pub fn widget(self: *Self) *Widget.Impl(name) {
            return @ptrCast(self);
        }

        pub fn label(self: *Self) *Self {
            return self;
        }
    };
}

pub fn init(lab: []const u8, parent: ?*anyopaque, flags: u32) *Impl("Label") {
    return @ptrCast(qtc.QtC_fn("Label", "create")(
        lab.ptr,
        @intCast(lab.len),
        parent,
        flags,
    ));
}
