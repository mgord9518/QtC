const std = @import("std");
const qt = @import("qt");
const widgets = qt.widgets;
const layouts = qt.layouts;

pub fn main() !void {
    const app = qt.Application.init();

    const window = widgets.Widget.init(null);
    defer window.deinit();

    window.widget().setWindowTitle("Qt with Zig!");

    const button = widgets.PushButton.init("Hello, world!", null);
    defer button.deinit();
    button.widget().show();

    const label = widgets.Label.init("I'm a label!", window, 0);

    const layout = layouts.BoxLayout.init(
        .bottom_to_top,
        window,
    );

    layout.layout().addWidget(button.widget());
    layout.layout().addWidget(label.widget());

    window.widget().resize(500, 500);
    window.widget().show();

    app.exec();
}
