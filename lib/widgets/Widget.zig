const Widget = @This();

pub const c = @cImport({
    @cInclude("QtC/widgets/widget.h");
    @cInclude("QtC/widgets/label.h");
    @cInclude("QtC/widgets/pushbutton.h");
});

pub fn WidgetGen(comptime widget_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn deinit(wid: *Self) void {
            @field(c, "QtC_" ++ widget_name ++ "_destroy")(@ptrCast(wid));
        }

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
    };
}

pub fn init() *Widget {
    return @ptrCast(c.QtC_Widget_create());
}

pub fn deinit(wid: *Widget) void {
    wid.widget().deinit();
}

pub fn widget(wid: *Widget) *WidgetGen("Widget") {
    return @ptrCast(wid);
}
