const c = @import("qt.zig").c;

const PaintDevice = @This();

pub fn colorCount(paint_device: *const PaintDevice) u32 {
    return @intCast(
        c.QtC_PaintDevice_colorCount(@ptrCast(paint_device)),
    );
}

pub fn depth(paint_device: *const PaintDevice) u32 {
    return @intCast(
        c.QtC_PaintDevice_depth(@ptrCast(paint_device)),
    );
}
