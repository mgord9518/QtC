const c = @import("qt.zig").c;

const std = @import("std");
const Application = @This();

pub const InitOptions = struct {
    args: ?@TypeOf(std.os.argv) = null,
};

pub fn init(opts: InitOptions) *Application {
    const args = opts.args orelse std.os.argv;

    return @ptrCast(c.QtC_Application_new(
        @intCast(args.len),
        @ptrCast(args.ptr),
    ));
}

pub fn deinit(self: *Application) void {
    c.QtC_Application_delete(@ptrCast(self));
}

pub fn exec(app: *Application) void {
    c.QtC_Application_exec(@ptrCast(app));
}
