const Object = @This();

pub const c = @cImport({
    @cInclude("QtC/object.h");
    @cInclude("QtC/widgets/widget.h");
    @cInclude("QtC/widgets/label.h");
    @cInclude("QtC/widgets/pushbutton.h");
});

pub fn Gen(comptime object_name: []const u8) type {
    return struct {
        const Self = @This();

        pub fn deinit(obj: *Self) void {
            @field(c, "QtC_" ++ object_name ++ "_destroy")(@ptrCast(obj));
        }

        pub fn parent(obj: *const Self) ?*Self {
            return @ptrCast(
                @field(c, "QtC_" ++ object_name ++ "_parent")(@ptrCast(obj)),
            );
        }

        pub fn setParent(obj: *Self, new_parent: ?*Object) void {
            @field(c, "QtC_" ++ object_name ++ "_setParent")(@ptrCast(obj), @ptrCast(new_parent));
        }
    };
}

pub fn init(parent: *Object) *Object {
    return @ptrCast(c.QtC_Object_create(parent));
}

pub fn deinit(obj: *Object) void {
    obj.object().deinit();
}

pub fn object(obj: *Object) *Gen("Object") {
    return @ptrCast(obj);
}
