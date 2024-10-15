const c = @import("qt.zig").c;
const Object = @This();

pub fn deinit(obj: *Object) void {
    c.QtC_Object_destroy(@ptrCast(obj));
}

pub fn parent(obj: *const Object) ?*Object {
    return @ptrCast(
        c.QtC_Object_parent(@ptrCast(obj)),
    );
}

pub fn setParent(obj: *Object, new_parent: ?*void) void {
    c.QtC_Object_setParent(
        @ptrCast(obj),
        new_parent,
    );
}

pub fn object(self: *Object) *Object {
    return self;
}

pub fn init(parent_object: *?anyopaque) *Object {
    return @ptrCast(c.QtC_Object_create(parent_object));
}
