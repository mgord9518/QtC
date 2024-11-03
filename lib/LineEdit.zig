const c = @import("qt.zig").c;

const LineEdit = @This();
const Widget = @import("Widget.zig");

pub const InitOptions = struct {
    parent: ?*Widget = null,
};

pub fn init(opts: InitOptions) *LineEdit {
    return @ptrCast(c.QtC_LineEdit_create(
        @ptrCast(opts.parent),
    ));
}

pub fn deinit(self: *LineEdit) void {
    self.widget().object().deinit();
}

pub fn widget(self: *LineEdit) *Widget {
    return @ptrCast(self);
}
