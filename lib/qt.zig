pub const Application = @import("Application.zig");

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
