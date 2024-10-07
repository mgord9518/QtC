const std = @import("std");

const BoxLayout = @This();

const Widget = @import("../Widget.zig");
const Object = @import("../Object.zig");

const type_name = "BoxLayout";

pub const c = Object.c;

pub fn Gen(comptime layout_name: []const u8) type {
    return struct {
        const Self = @This();
        pub const QtZig_is_layout = true;

        pub fn addWidget(self: *Self, child: anytype) void {
            const T = @typeInfo(@TypeOf(child)).Pointer.child;

            if (!@hasDecl(T, "QtZig_is_widget") or !T.QtZig_is_widget) {
                @compileError("Invalid type, must be Widget");
            }

            @field(c, "QtC_" ++ layout_name ++ "_addWidget")(
                @ptrCast(self),
                @ptrCast(child),
            );
        }
    };
}

pub fn init(parent: ?*Widget) *BoxLayout {
    return @ptrCast(
        c.QtC_BoxLayout_create(@ptrCast(parent)),
    );
}

pub fn deinit(lay: *BoxLayout) void {
    lay.object().deinit();
}

pub fn object(lay: *BoxLayout) *Object.Gen(type_name) {
    return @ptrCast(lay);
}

pub fn layout(lay: *BoxLayout) *Gen(type_name) {
    return @ptrCast(lay);
}
