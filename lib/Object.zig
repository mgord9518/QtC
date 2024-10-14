const qtc = @import("qtc.zig");
const Object = @This();

const type_name = "Object";

pub fn Impl(comptime object_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn deinit(obj: *Self) void {
            qtc.QtC_fn(object_name, "destroy")(@ptrCast(obj));
        }

        pub fn parent(obj: *const Self) ?*Self {
            return @ptrCast(
                qtc.QtC_fn(object_name, "parent")(@ptrCast(obj)),
            );
        }

        pub fn setParent(obj: *Self, new_parent: ?*void) void {
            qtc.QtC_fn(object_name, "setParent")(
                @ptrCast(obj),
                new_parent,
            );
        }

        pub fn object(self: *Self) *Self {
            return self;
        }
    };
}

pub fn init(parent: *?anyopaque) *Impl(type_name) {
    return @ptrCast(qtc.QtC_fn(type_name, "create")(parent));
}
