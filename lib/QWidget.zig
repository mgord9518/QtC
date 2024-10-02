const QWidget = @This();

const c = @cImport({
    @cInclude("QWidget.h");
});

pub fn init() *QWidget {
    return @ptrCast(c.QtC_QWidget_create());
}

pub fn deinit(widget: *QWidget) void {
    c.QtC_QWidget_destroy(@ptrCast(widget));
}

pub fn resize(widget: *QWidget, w: u32, h: u32) void {
    c.QtC_QWidget_resize(
        @ptrCast(widget),
        @intCast(w),
        @intCast(h),
    );
}

pub fn show(widget: *QWidget) void {
    c.QtC_QWidget_show(
        @ptrCast(widget),
    );
}
