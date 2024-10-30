const c = @import("qt.zig").c;

const Label = @This();
const qt = @import("qt.zig");
const Widget = @import("Widget.zig");
const Pixmap = @import("Pixmap.zig");

pub const Options = struct {
    parent: ?*Widget = null,
    label: []const u8 = "",
    flags: qt.WindowFlags = .widget,
};

pub fn init(opts: Options) *Label {
    const str = c.QtC_String_new(opts.label.ptr, @intCast(opts.label.len));
    defer c.QtC_String_delete(str);

    return @ptrCast(c.QtC_Label_create(
        str,
        opts.parent,
        @intFromEnum(opts.flags),
    ));
}

pub fn setText(self: *Label, text: []const u8) void {
    const str = c.QtC_String_new(text.ptr, @intCast(text.len));
    defer c.QtC_String_delete(str);

    c.QtC_Label_setText(@ptrCast(self), str);
}

pub fn setPixmap(self: *Label, pixmap: ?*const Pixmap) void {
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
