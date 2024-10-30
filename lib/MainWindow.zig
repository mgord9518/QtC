const qt = @import("qt.zig");
const c = qt.c;
const widgets = qt.widgets;

const MainWindow = @This();
const Widget = qt.widgets.Widget;

pub const InitOptions = struct {
    parent: ?*Widget = null,
    flags: qt.WindowFlags = .widget,
};

pub fn init(opts: InitOptions) *MainWindow {
    return @ptrCast(c.QtC_MainWindow_new(
        @ptrCast(opts.parent),
        @intFromEnum(opts.flags),
    ));
}

pub fn deinit(self: *MainWindow) void {
    c.QtC_MainWindow_delete(@ptrCast(self));
}

pub fn setCentralWidget(self: *MainWindow, central_widget: *Widget) void {
    c.QtC_MainWindow_setCentralWidget(
        @ptrCast(self),
        @ptrCast(central_widget),
    );
}

pub fn menuBar(self: *MainWindow) *widgets.MenuBar {
    return @ptrCast(c.QtC_MainWindow_menuBar(
        @ptrCast(self),
    ));
}

pub fn widget(self: *MainWindow) *Widget {
    return @ptrCast(self);
}

pub fn mainWindow(self: *MainWindow) *MainWindow {
    return self;
}
