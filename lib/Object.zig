const c = @import("qt.zig").c;
const Object = @This();

pub fn init(parent_object: *?anyopaque) *Object {
    return @ptrCast(c.QtC_Object_new(parent_object));
}

pub fn deinit(self: *Object) void {
    c.QtC_Object_delete(@ptrCast(self));
}

pub fn parent(self: *const Object) ?*Object {
    return @ptrCast(
        c.QtC_Object_parent(@ptrCast(self)),
    );
}

pub fn setParent(self: *Object, new_parent: ?*void) void {
    c.QtC_Object_setParent(
        @ptrCast(self),
        new_parent,
    );
}

pub fn connect(self: *Object, signal: *const anyopaque, function: *const anyopaque) void {
    c.QtC_Object_connect(@ptrCast(self), signal, function);
}

pub fn object(self: *Object) *Object {
    return self;
}
