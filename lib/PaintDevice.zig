const Object = @This();

pub const c = @cImport({
    @cInclude("QtC5/widgets/widget.h");
    @cInclude("QtC5/widgets/label.h");
    @cInclude("QtC5/widgets/pushbutton.h");
});

pub fn Impl(comptime paint_device_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn colorCount(paint_device: *const Self) u32 {
            return @intCast(@field(c, "QtC_" ++ paint_device_name ++ "_colorCount")(@ptrCast(paint_device)));
        }

        pub fn depth(paint_device: *const Self) u32 {
            return @intCast(@field(c, "QtC_" ++ paint_device_name ++ "_depth")(@ptrCast(paint_device)));
        }
    };
}
