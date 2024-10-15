const c = @import("qt.zig").c;

const Label = @This();
const Widget = @import("Widget.zig");
const Pixmap = @import("Pixmap.zig");

pub fn setText(wid: *Label, lab: []const u8) void {
    c.QtC_Label_setText(
        @ptrCast(wid),
        lab.ptr,
        @intCast(lab.len),
    );
}

pub fn setPixmap(self: *Label, pixmap: ?*const anyopaque) void {
    c.QtC_Label_setPixmap(
        @ptrCast(self),
        @ptrCast(pixmap),
    );
}

pub fn setScaledContents(self: *Label, scale: bool) void {
    c.QtC_Label_setScaledContents(
        @ptrCast(self),
        scale,
    );
}

pub fn hasScaledContents(self: *const Label) bool {
    return c.QtC_Label_hasScaledContents(@ptrCast(self));
}

pub fn deinit(self: *Label) void {
    self.widget().object().deinit();
}

pub fn widget(self: *Label) *Widget {
    return @ptrCast(self);
}

pub fn label(self: *Label) *Label {
    return self;
}

pub fn init(lab: []const u8, parent: ?*anyopaque, flags: u32) *Label {
    return @ptrCast(c.QtC_Label_create(
        lab.ptr,
        @intCast(lab.len),
        parent,
        flags,
    ));
}
