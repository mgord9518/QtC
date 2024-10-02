const QPushButton = @This();
const QWidget = @import("QWidget.zig");

const c = @cImport({
    @cInclude("QPushButton.h");
});

pub fn init(label: []const u8, parent: ?*QWidget) *QPushButton {
    return @ptrCast(c.QtC_QPushButton_create(
        label.ptr,
        @intCast(label.len),
        @ptrCast(parent),
    ));
}

pub fn deinit(button: *QPushButton) void {
    c.QtC_QPushButton_destroy(@ptrCast(button));
}

pub fn resize(button: *QPushButton, w: u32, h: u32) void {
    c.QtC_QPushButton_resize(
        @ptrCast(button),
        @intCast(w),
        @intCast(h),
    );
}

pub fn show(button: *QPushButton) void {
    c.QtC_QPushButton_show(
        @ptrCast(button),
    );
}
