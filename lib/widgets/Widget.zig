const Widget = @This();

const Object = @import("../Object.zig");
const PaintDevice = @import("../PaintDevice.zig");

const type_name = "Widget";

pub const c = Object.c;

pub fn Gen(comptime widget_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn resize(wid: *Self, w: u32, h: u32) void {
            @field(c, "QtC_" ++ widget_name ++ "_resize")(
                @ptrCast(wid),
                @intCast(w),
                @intCast(h),
            );
        }

        pub fn show(wid: *Self) void {
            @field(c, "QtC_" ++ widget_name ++ "_show")(
                @ptrCast(wid),
            );
        }

        pub fn setWindowTitle(wid: *Self, label: []const u8) void {
            @field(c, "QtC_" ++ widget_name ++ "_setWindowTitle")(
                @ptrCast(wid),
                label.ptr,
                @intCast(label.len),
            );
        }

        pub fn setParent(wid: *Self, new_parent: ?*Widget) void {
            @field(c, "QtC_" ++ widget_name ++ "_setParentWidget")(@ptrCast(wid), @ptrCast(new_parent));
        }
    };
}

pub fn init() *Widget {
    return @ptrCast(c.QtC_Widget_create());
}

pub fn deinit(wid: *Widget) void {
    wid.object().deinit();
}

pub fn widget(wid: *Widget) *Gen(type_name) {
    return @ptrCast(wid);
}

pub fn object(wid: *Widget) *Object.Gen(type_name) {
    return @ptrCast(wid);
}

pub fn paintDevice(wid: *Widget) *PaintDevice.Gen(type_name) {
    return @ptrCast(wid);
}
