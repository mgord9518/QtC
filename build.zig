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

    const lib = try buildLibQtC5(b, .{
        .name = "QtC5",
        .target = target,
        .optimize = optimize,
    });

    exe.linkLibrary(lib);

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

pub fn buildLibQtC5(
    b: *std.Build,
    options: std.Build.ExecutableOptions,
) !*std.Build.Step.Compile {
    const lib = b.addStaticLibrary(.{
        .name = "QtC5",
        .target = options.target,
        .optimize = options.optimize,
        .strip = options.strip orelse false,
    });

    lib.addIncludePath(b.path("include"));
    lib.addIncludePath(b.path("private_include"));

    lib.addCSourceFiles(.{
        .root = b.path("."),
        .files = &.{
            "lib/widget.cpp",
            "lib/application.cpp",
            "lib/layouts/boxlayout.cpp",
            "lib/widgets/pushbutton.cpp",
            "lib/widgets/label.cpp",
        },
    });

    lib.linkLibCpp();
    lib.linkSystemLibrary("Qt5Core");
    lib.linkSystemLibrary("Qt5Widgets");

    return lib;
}
