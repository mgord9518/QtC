const Widget = @This();

const qt = @import("qt.zig");
const c = qt.c;

const Object = @import("Object.zig");
const PaintDevice = @import("PaintDevice.zig");

pub fn init(parent: ?*Widget, flags: qt.WindowFlags) *Widget {
    return @ptrCast(c.QtC_Widget_create(
        @ptrCast(parent),
        @intFromEnum(flags),
    ));
}

pub fn deinit(wid: *Widget) void {
    wid.object().deinit();
}

pub fn resize(wid: *Widget, w: u32, h: u32) void {
    c.QtC_Widget_resize(
        @ptrCast(wid),
        @intCast(w),
        @intCast(h),
    );
}

pub fn setMinimumSize(wid: *Widget, w: u32, h: u32) void {
    c.QtC_Widget_setMinimumSize(
        @ptrCast(wid),
        @intCast(w),
        @intCast(h),
    );
}

pub fn setMaximumSize(wid: *Widget, w: u32, h: u32) void {
    c.QtC_Widget_setMaximumSize(
        @ptrCast(wid),
        @intCast(w),
        @intCast(h),
    );
}

pub fn show(wid: *Widget) void {
    c.QtC_Widget_show(
        @ptrCast(wid),
    );
}

pub fn setWindowTitle(wid: *Widget, label: []const u8) void {
    const str = c.QtC_String_create(label.ptr, @intCast(label.len));

    c.QtC_Widget_setWindowTitle(
        @ptrCast(wid),
        str,
    );
}

pub fn setParent(wid: *Widget, new_parent: ?*Widget) void {
    c.QtC_Widget_setParentWidget(
        @ptrCast(wid),
        @ptrCast(new_parent),
    );
}

pub fn object(wid: *Widget) *Object {
    return @ptrCast(wid);
}

pub fn paintDevice(wid: *Widget) *PaintDevice {
    return @ptrCast(wid);
}

pub fn widget(wid: *Widget) *Widget {
    return wid;
}
