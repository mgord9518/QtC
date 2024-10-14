// Generate C code to link against CPP symbols automatically

const std = @import("std");

const mangle = struct {
    const itanium = @import("itanium.zig");
};

const Widget = "7QWidget";

fn Const(class: []const u8) []const u8 {
    return "K" ++ class;
}

pub fn qtMangle(
    comptime class: []const u8,
    comptime method_name: []const u8,
    comptime function_args: ?[]const []const u8,
) []const u8 {
    return mangle.itanium.newMangle(
        &.{"Q" ++ class},
        method_name,
        .function,
        &.{},
        function_args orelse &.{},
    );
}

pub fn main() !void {
    const stdout_file = std.io.getStdOut();
    const stdout = stdout_file.writer();

    try stdout.print(
        \\static void init() __attribute__((constructor));
        \\
        \\void init() {{
        \\}}
        \\
    , .{});

    try stdout.print("{s}\n", .{
        comptime qtMangle("Widget", "show", &.{
            Widget,
            Const(Widget),
        }),
    });
}
