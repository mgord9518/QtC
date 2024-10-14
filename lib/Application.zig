const qtc = @import("qtc.zig");

const std = @import("std");
const Application = @This();

pub fn init() *Application {
    return initWithArgs(std.os.argv);
}

pub fn initWithArgs(args: @TypeOf(std.os.argv)) *Application {
    return @ptrCast(qtc.QtC_fn("Application", "create")(
        @intCast(args.len),
        @ptrCast(args.ptr),
    ));
}

pub fn exec(app: *Application) void {
    qtc.QtC_fn("Application", "exec")(@ptrCast(app));
}
