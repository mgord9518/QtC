const std = @import("std");

fn init() callconv(.C) void {
    std.debug.print("INIT\n", .{});
}

export const init_array: [1]*const fn () callconv(.C) void linksection(".init_array") = .{&init};

pub const FunctionType = enum {
    function,
};

// Not using a union here because it's a bit ugly when combined with a struct
pub const Type = struct {
    pub const Builtin = enum {
        bool,
        signed_char,
        char,
        int,
        float,
        float128,
        string,
        basic_string,
    };

    pub const PointerType = enum {
        pointer,
        reference,
    };

    builtin: ?Builtin = null,
    class: ?[]const u8 = null,

    @"const": ?bool = false,

    pointer: ?PointerType = null,
};

pub const QtClass = enum {
    Widget,
    Layout,
};

pub fn qtMangle(
    comptime class: QtClass,
    comptime method_name: []const u8,
    comptime function_args: ?[]const Type,
) []const u8 {
    return mangle(
        &.{"Q" ++ @tagName(class)},
        method_name,
        .function,
        &.{},
        function_args orelse &.{},
    );
}

pub fn newMangle(
    comptime nest: ?[]const []const u8,
    comptime function_name: []const u8,
    comptime function_type: FunctionType,
    comptime template_args: []const Type,
    comptime function_args: []const []const u8,
) []const u8 {
    comptime {
        var ret: []const u8 = "_Z";

        // First, mangle the namespace
        if (nest) |n| {
            ret = ret ++ "N";

            for (n) |namespace| {
                // Special name for std
                if (std.mem.eql(u8, namespace, "std")) {
                    ret = ret ++ "St";
                    continue;
                }

                ret = std.fmt.comptimePrint("{s}{d}{s}", .{
                    ret,
                    namespace.len,
                    namespace,
                });
            }
        }

        ret = std.fmt.comptimePrint("{s}{d}{s}", .{
            ret,
            function_name.len,
            function_name,
        });

        if (nest) |_| ret = ret ++ "E";

        if (template_args.len > 0) {
            ret = ret ++ "I";
            ret = ret ++ mangleArguments(template_args);
            ret = ret ++ "E";
        }

        for (function_args) |arg| {
            ret = ret ++ arg;
        }
        //ret = ret ++ mangleArguments(function_args);

        return ret;
    }

    _ = function_type;

    unreachable;
}

fn mangle(
    comptime nest: ?[]const []const u8,
    comptime function_name: []const u8,
    comptime function_type: FunctionType,
    comptime template_args: []const Type,
    comptime function_args: []const Type,
) []const u8 {
    comptime {
        var ret: []const u8 = "_Z";

        // First, mangle the namespace
        if (nest) |n| {
            ret = ret ++ "N";

            for (n) |namespace| {
                // Special name for std
                if (std.mem.eql(u8, namespace, "std")) {
                    ret = ret ++ "St";
                    continue;
                }

                ret = std.fmt.comptimePrint("{s}{d}{s}", .{
                    ret,
                    namespace.len,
                    namespace,
                });
            }
        }

        ret = std.fmt.comptimePrint("{s}{d}{s}", .{
            ret,
            function_name.len,
            function_name,
        });

        if (nest) |_| ret = ret ++ "E";

        if (template_args.len > 0) {
            ret = ret ++ "I";
            ret = ret ++ mangleArguments(template_args);
            ret = ret ++ "E";
        }

        ret = ret ++ mangleArguments(function_args);

        return ret;
    }

    _ = function_type;

    unreachable;
}

fn mangleArguments(comptime arguments: []const Type) []const u8 {
    comptime {
        var ret: []const u8 = "";

        for (arguments) |arg| {
            std.debug.assert((arg.class == null or arg.builtin == null) and (arg.class != null or arg.builtin != null));

            if (arg.pointer) |p| {
                switch (p) {
                    .pointer => ret = ret ++ "P",
                    .reference => ret = ret ++ "R",
                }
            }

            if (arg.@"const") |c| {
                if (c) ret = ret ++ "K";
            }

            if (arg.builtin) |b| {
                ret = ret ++ builtinToString(b);
            }

            if (arg.class) |class| {
                ret = std.fmt.comptimePrint("{s}{d}{s}", .{
                    ret,
                    class.len,
                    class,
                });
            }
        }

        return ret;
    }

    unreachable;
}

fn builtinToString(builtin: Type.Builtin) []const u8 {
    return switch (builtin) {
        .int => "i",
        .bool => "b",
        .signed_char => "a",
        .char => "c",
        .float => "f",
        .float128 => "g",
        .string => "Ss",
        .basic_string => "Sb",
    };
}
