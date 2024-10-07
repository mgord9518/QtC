const Label = @This();
const Widget = @import("../Widget.zig");
const Object = @import("../Object.zig");

const type_name = "Label";

const c = Widget.c;

pub fn init(label: []const u8, parent: ?*Widget) *Label {
    return @ptrCast(c.QtC_Label_create(
        label.ptr,
        @intCast(label.len),
        @ptrCast(parent),
    ));
}

pub fn deinit(label: *Label) void {
    label.object().deinit();
}

pub fn widget(wid: *Label) *Widget.Gen(type_name) {
    return @ptrCast(wid);
}

pub fn object(wid: *Label) *Object.Gen(type_name) {
    return @ptrCast(wid);
}
