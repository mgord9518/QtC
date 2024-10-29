const c = @import("qt.zig").c;

const Label = @This();
const qt = @import("qt.zig");
const Widget = @import("Widget.zig");
const Pixmap = @import("Pixmap.zig");

pub fn setText(self: *Label, text: []const u8) void {
    const str = c.QtC_String_create(text.ptr, @intCast(text.len));

    c.QtC_Label_setText(@ptrCast(self), str);
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

pub fn setAlignment(self: *Label, alignment: qt.Alignment) void {
    c.QtC_Label_setAlignment(
        @ptrCast(self),
        @intFromEnum(alignment.vertical) | @intFromEnum(alignment.horizontal),
    );
}

pub fn init(text: []const u8, parent: ?*anyopaque, flags: u32) *Label {
    const str = c.QtC_String_create(text.ptr, @intCast(text.len));

    return @ptrCast(c.QtC_Label_create(
        str,
        parent,
        flags,
    ));
}
