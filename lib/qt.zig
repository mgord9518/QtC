pub const Application = @import("Application.zig");

pub const Pixmap = @import("Pixmap.zig");

pub const layouts = struct {
    pub const BoxLayout = @import("BoxLayout.zig");
};

pub const widgets = struct {
    pub const Widget = @import("Widget.zig");

    pub const AbstractButton = @import("AbstractButton.zig");
    pub const PushButton = @import("PushButton.zig");
    pub const ListView = @import("ListView.zig");
    pub const ListWidget = @import("ListWidget.zig");
    pub const LineEdit = @import("LineEdit.zig");

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
        left = c.QtC_Alignment_Left,
        right = c.QtC_Alignment_Right,
        center = c.QtC_Alignment_HCenter,
        justify = c.QtC_Alignment_Justify,
    };

    pub const VerticalAlignment = enum(c_uint) {
        top = c.QtC_Alignment_Top,
        bottom = c.QtC_Alignment_Bottom,
        center = c.QtC_Alignment_VCenter,
        baseline = c.QtC_Alignment_Baseline,
    };
};

// TODO
pub const WindowFlags = enum(c_uint) {
    widget = c.QtC_WindowFlags_Widget,
    window = c.QtC_WindowFlags_Window,
    dialog = c.QtC_WindowFlags_Dialog,
    sheet = c.QtC_WindowFlags_Sheet,
    drawer = c.QtC_WindowFlags_Drawer,
    popup = c.QtC_WindowFlags_Popup,
    tool = c.QtC_WindowFlags_Tool,
    tooltip = c.QtC_WindowFlags_ToolTip,
    splash_screen = c.QtC_WindowFlags_SplashScreen,
    sub_window = c.QtC_WindowFlags_SubWindow,
    foreign_window = c.QtC_WindowFlags_ForeignWindow,
    cover_window = c.QtC_WindowFlags_CoverWindow,
};

pub const c = @cImport({
    @cInclude("QtC6/qt.h");
    @cInclude("QtC6/abstractbutton.h");
    @cInclude("QtC6/application.h");
    @cInclude("QtC6/object.h");
    @cInclude("QtC6/layout.h");
    @cInclude("QtC6/boxlayout.h");
    @cInclude("QtC6/widget.h");
    @cInclude("QtC6/label.h");
    @cInclude("QtC6/listview.h");
    @cInclude("QtC6/listwidget.h");
    @cInclude("QtC6/lineedit.h");
    @cInclude("QtC6/pushbutton.h");
    @cInclude("QtC6/pixmap.h");
    @cInclude("QtC6/string.h");
});
