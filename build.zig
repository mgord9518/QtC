const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const qt_module = b.addModule("qt", .{
        .root_source_file = b.path("lib/qt.zig"),
    });

    qt_module.addIncludePath(b.path("include"));

    const exe = b.addExecutable(.{
        .name = "qt-c",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("qt", qt_module);

    exe.root_module.addIncludePath(b.path("include"));

    exe.linkSystemLibrary("c++");
    exe.linkSystemLibrary("Qt5Core");
    exe.linkSystemLibrary("Qt5Widgets");

    exe.addObjectFile(b.path("build/libQt_c.a"));

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
