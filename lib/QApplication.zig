const QApplication = @This();

const c = @cImport({
    @cInclude("QApplication.h");
});

pub fn init(argc: u32, argv: [*c][*c]u8) *QApplication {
    return @ptrCast(c.QtC_QApplication_create(
        @intCast(argc),
        argv,
    ));
}

pub fn exec(app: *QApplication) void {
    c.QtC_QApplication_exec(@ptrCast(app));
}
