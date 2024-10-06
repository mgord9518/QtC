const std = @import("std");
const qt = @import("qt");
const widgets = qt.widgets;

pub fn main() !void {
    const app = qt.Application.init();

    const window = widgets.Widget.init();
    defer window.deinit();

    window.widget().setWindowTitle("Qt with Zig!");

    const button = widgets.PushButton.init("Hello, world!", window);
    defer button.deinit();

    const label = widgets.Label.init("bruh", window);
    defer label.deinit();

    window.widget().resize(500, 500);
    window.widget().show();

    app.exec();
}
