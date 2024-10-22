pub const Application = @import("Application.zig");

pub const Pixmap = @import("Pixmap.zig");

pub const layouts = struct {
    pub const BoxLayout = @import("BoxLayout.zig");
};

pub const widgets = struct {
    pub const Widget = @import("Widget.zig");

    pub const AbstractButton = @import("AbstractButton.zig");
    pub const PushButton = @import("PushButton.zig");

    pub const Label = @import("Label.zig");
};

pub fn assertType(comptime T: type, comptime type_name: []const u8) void {
    comptime {
        if (!isType(T, type_name)) {
            @compileError("Invalid type given; must be " ++ type_name ++ ".");
        }
    }
}

pub fn isType(comptime T: type, comptime type_name: []const u8) bool {
    comptime {
        const type_info = @typeInfo(T);
        const Child = type_info.Pointer.child;

        //return @hasDecl(Child, "QtZig_is_" ++ type_name) and @field(Child, "QtZig_is_" ++ type_name);
        return @hasDecl(Child, "QtZig_is_" ++ type_name);
    }

    unreachable;
}

pub const Alignment = struct {
    horizontal: HorizontalAlignment,
    vertical: VerticalAlignment,

    pub const HorizontalAlignment = enum(c_uint) {
        left = 0x001,
        right = 0x002,
        center = 0x004,
        justify = 0x008,
    };

    pub const VerticalAlignment = enum(c_uint) {
        top = 0x020,
        bottom = 0x040,
        center = 0x080,
        baseline = 0x100,
    };
};

pub const c = @cImport({
    @cInclude("QtC6/application.h");
    @cInclude("QtC6/object.h");
    @cInclude("QtC6/layout.h");
    @cInclude("QtC6/boxlayout.h");
    @cInclude("QtC6/widget.h");
    @cInclude("QtC6/label.h");
    @cInclude("QtC6/pushbutton.h");
    @cInclude("QtC6/pixmap.h");
});
