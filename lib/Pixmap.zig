const Pixmap = @This();

const c = @import("qt.zig").c;

const PaintDevice = @import("PaintDevice.zig");

pub fn load(self: *Pixmap, filename: []const u8, format: ?[]const u8, flags: ?u32) bool {
    const f = if (format != null) format.?.ptr else null;

    return c.QtC_Pixmap_load(
        @ptrCast(self),
        filename.ptr,
        @intCast(filename.len),
        f,
        @intCast(flags orelse 0),
    );
}

pub fn loadFromData(self: *Pixmap, data: []const u8, format: ?[]const u8, flags: ?u32) bool {
    const f = if (format != null) format.?.ptr else null;

    return c.QtC_Pixmap_loadFromData(
        @ptrCast(self),
        data.ptr,
        @intCast(data.len),
        f,
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
