const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const qt_module = b.addModule("qt", .{
        .root_source_file = b.path("lib/qt.zig"),
    });

    qt_module.addIncludePath(b.path("include"));

    const exe = b.addExecutable(.{
        .name = "qt-zig",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("qt", qt_module);

    const lib = try buildLibQtC6(b, .{
        .name = "QtC6",
        .target = target,
        .optimize = optimize,
    });

    exe.linkLibrary(lib);
    exe.linkSystemLibrary("Qt6Core");
    exe.linkSystemLibrary("Qt6Widgets");
    exe.linkSystemLibrary("Qt6Gui");

    b.installArtifact(lib);
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

pub fn buildLibQtC6(
    b: *std.Build,
    options: std.Build.ExecutableOptions,
) !*std.Build.Step.Compile {
    const lib = b.addStaticLibrary(.{
        .name = "QtC6",
        .target = options.target,
        .optimize = options.optimize,
        .strip = options.strip orelse false,
    });

    lib.addIncludePath(b.path("include"));

    lib.addCSourceFiles(.{
        .root = b.path("."),
        .files = &.{
            "lib/object.cpp",
            "lib/widget.cpp",
            "lib/application.cpp",
            "lib/layout.cpp",
            "lib/boxlayout.cpp",
            "lib/pushbutton.cpp",
            "lib/label.cpp",
            "lib/pixmap.cpp",
        },
        .flags = &.{
            "-Wall",
            "-Werror",
        },
    });

    lib.linkLibCpp();
    lib.linkSystemLibrary("Qt6Core");
    lib.linkSystemLibrary("Qt6Widgets");
    lib.linkSystemLibrary("Qt6Gui");

    return lib;
}
