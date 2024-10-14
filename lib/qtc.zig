pub const c = @cImport({
    @cInclude("QtC6/application.h");
    @cInclude("QtC6/object.h");
    @cInclude("QtC6/boxlayout.h");
    @cInclude("QtC6/widget.h");
    @cInclude("QtC6/label.h");
    @cInclude("QtC6/pushbutton.h");
});

pub fn QtC_fn(comptime type_name: []const u8, comptime fn_name: []const u8) @TypeOf(@field(c, "QtC_" ++ type_name ++ "_" ++ fn_name)) {
    return @field(c, "QtC_" ++ type_name ++ "_" ++ fn_name);
}
