const Pixmap = @This();

const c = @import("qt.zig").c;

const PaintDevice = @import("PaintDevice.zig");

pub fn loadFromFile(self: *Pixmap, filename: []const u8, format: ?[]const u8, flags: ?u32) bool {
    _ = format;

    return c.QtC_Pixmap_loadFromFile(
        @ptrCast(self),
        filename.ptr,
        @intCast(filename.len),
        null,
        @intCast(flags orelse 0),
    );
}

pub fn pixmap(self: *Pixmap) *Pixmap {
    return self;
}

pub fn paintDevice(self: *Pixmap) *PaintDevice {
    return @ptrCast(self);
}

pub fn init(width: u32, height: u32) *Pixmap {
    return @ptrCast(c.QtC_Pixmap_create(
        @intCast(width),
        @intCast(height),
    ));
}
