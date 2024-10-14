const Widget = @This();

const qtc = @import("qtc.zig");

const Object = @import("Object.zig");
const PaintDevice = @import("PaintDevice.zig");

const type_name = "Widget";

pub const c = Object.c;

pub fn Impl(comptime widget_name: []const u8) type {
    return struct {
        const Self = @This();
        pub const QtZig_is_Widget = true;

        pub fn deinit(wid: *Self) void {
            wid.object().deinit();
        }

        pub fn resize(wid: *Self, w: u32, h: u32) void {
            qtc.QtC_fn(widget_name, "resize")(
                @ptrCast(wid),
                @intCast(w),
                @intCast(h),
            );
        }

        pub fn show(wid: *Self) void {
            qtc.QtC_fn(widget_name, "show")(
                @ptrCast(wid),
            );
        }

        pub fn setWindowTitle(wid: *Self, label: []const u8) void {
            qtc.QtC_fn(widget_name, "setWindowTitle")(
                @ptrCast(wid),
                label.ptr,
                @intCast(label.len),
            );
        }

        pub fn setParent(wid: *Self, new_parent: ?*Widget) void {
            qtc.QtC_fn(widget_name, "setParentWidget")(
                @ptrCast(wid),
                @ptrCast(new_parent),
            );
        }

        pub fn object(wid: *Self) *Object.Impl(widget_name) {
            return @ptrCast(wid);
        }

        pub fn paintDevice(wid: *Self) *PaintDevice.Gen(type_name) {
            return @ptrCast(wid);
        }

        pub fn widget(wid: *Self) *Self {
            return wid;
        }
    };
}

pub fn init(parent: ?*anyopaque) *Impl("Widget") {
    return @ptrCast(qtc.QtC_fn("Widget", "create")(parent));
}
