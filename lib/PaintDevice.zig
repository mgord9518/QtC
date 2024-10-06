const Object = @This();

pub const c = @cImport({
    @cInclude("QtC/widgets/widget.h");
    @cInclude("QtC/widgets/label.h");
    @cInclude("QtC/widgets/pushbutton.h");
});

pub fn Gen(comptime paint_device_name: []const u8) type {
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
