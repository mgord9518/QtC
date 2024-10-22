const std = @import("std");

//const required_symbols = .{
//    "qt_version_tag",
//    qtMangle("Widget", "show", &.{"v"}),
//    qtMangle("Label", "setText", &.{Reference(Const(String))}),
//    qtMangle("Label", "setPixmap", &.{Reference(Const(Pixmap))}),
//    qtMangle("Label", "setScaledContents", &.{"b"}),
//    qtConstMangle("Label", "hasScaledContents", &.{"v"}),
//
//    qtMangle("Object", "blockSignals", &.{"b"}),
//};

const required_symbols_file = @embedFile("required_symbols");
const required_symbols: []const [:0]const u8 = blk: {
    var syms: []const [:0]const u8 = &.{};

    var it = std.mem.split(u8, required_symbols_file, "\n");

    @setEvalBranchQuota(1000_000);
    while (it.next()) |name| {
        if (name.len == 0) continue;

        var c_name = name;
        c_name = c_name ++ "\x00";
        const new = c_name[0 .. c_name.len - 1 :0];

        syms = syms ++ &[_][:0]const u8{new};
    }

    break :blk syms;
};

const mangle = struct {
    const itanium = @import("itanium.zig");
};

//comptime {
//    for (required_symbols) |name| {
//        _ = Export(name);
//    }
//}

fn init() callconv(.C) void {
    const qt = std.c.dlopen("libQt6Widgets.so.6", std.c.RTLD.NOW).?;
    defer _ = std.c.dlclose(qt);

    @setEvalBranchQuota(1000_000);
    comptime {
        var it = std.mem.split(u8, required_symbols_file, "\x00");
        while (it.next()) |n| {
            const name = n[0..n.len :0];

            const f: ?*const fn () callconv(.C) void = @ptrCast(std.c.dlsym(qt, name));

            if (f == null) {
                std.debug.print("Failed to find symbol: {s}\n", .{name});
            }

            Export(name).func = f;
        }
    }
}

export const init_array: [1]*const fn () callconv(.C) void linksection(".init_array") = .{&init};

const Object = "7QObject";
const Widget = "7QWidget";
const String = "7QString";
const Pixmap = "7QPixmap";

fn Reference(class: []const u8) []const u8 {
    return "R" ++ class;
}

fn Pointer(class: []const u8) []const u8 {
    return "P" ++ class;
}

fn Const(class: []const u8) []const u8 {
    return "K" ++ class;
}

pub fn qtMangle(
    comptime class: []const u8,
    comptime method_name: []const u8,
    comptime function_args: ?[]const []const u8,
) [:0]const u8 {
    return mangle.itanium.newMangle(
        &.{"Q" ++ class},
        false,
        method_name,
        .function,
        &.{},
        function_args orelse &.{},
    );
}

pub fn qtConstMangle(
    comptime class: []const u8,
    comptime method_name: []const u8,
    comptime function_args: ?[]const []const u8,
) [:0]const u8 {
    return mangle.itanium.newMangle(
        &.{"Q" ++ class},
        true,
        method_name,
        .function,
        &.{},
        function_args orelse &.{},
    );
}

pub fn Export(name: []const u8) type {
    return struct {
        comptime {
            @export(func, .{ .name = name });
        }

        var func: ?*const fn () callconv(.C) void = undefined;
    };
}

pub fn maine() !void {
    const stdout_file = std.io.getStdOut();
    const stdout = stdout_file.writer();

    inline for (required_symbols) |name| {
        try stdout.print("{s}\n", .{name});
    }
}
