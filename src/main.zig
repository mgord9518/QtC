const std = @import("std");
const qt = @import("qt");
const widgets = qt.widgets;
const layouts = qt.layouts;

const zig_svg = @embedFile("zig.svg");

pub fn main() !void {
    const app = qt.Application.init();

    const window = widgets.Widget.init(.{});
    defer window.deinit();
    window.widget().setWindowTitle("Qt with Zig!");

    const button = widgets.PushButton.init(.{ .label = "Hello, world!" });
    defer button.deinit();
    button.widget().show();

    const label = widgets.Label.init(.{
        .label = "I'm a label!",
        .parent = window.widget(),
    });
    defer label.deinit();

    const layout = layouts.BoxLayout.init(.{
        .direction = .top_to_bottom,
        .parent = window.widget(),
    });
    defer layout.deinit();

    layout.layout().addWidget(label.widget());
    layout.layout().addWidget(button.widget());

    window.widget().resize(500, 500);
    window.widget().show();

    app.exec();
}
