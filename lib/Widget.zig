const Widget = @This();

const qt = @import("qt.zig");
const c = qt.c;

const Object = qt.Object;
const PaintDevice = qt.layouts.Layout;
const Layout = qt.layouts.Layout;

pub const Options = struct {
    parent: ?*Widget = null,
    flags: qt.WindowFlags = .widget,
};

pub fn init(opts: Options) *Widget {
    return @ptrCast(c.QtC_Widget_new(
        @ptrCast(opts.parent),
        @intFromEnum(opts.flags),
    ));
}

pub fn deinit(wid: *Widget) void {
    c.QtC_Widget_delete(@ptrCast(wid));
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
    const str = c.QtC_String_new(label.ptr, @intCast(label.len));

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

pub fn setLayout(self: *Widget, layout: ?*Layout) void {
    c.QtC_Widget_setLayout(
        @ptrCast(self),
        @ptrCast(layout),
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
