const std = @import("std");
const qt = @import("qt");
const QWidget = qt.QWidget;
const QApplication = qt.QApplication;
const QPushButton = qt.QPushButton;

pub fn main() !void {
    const app = QApplication.init(
        @intCast(std.os.argv.len),
        @ptrCast(std.os.argv.ptr),
    );

    const window = QWidget.init();

    _ = QPushButton.init("Hello, world!", window);

    window.resize(500, 500);
    window.show();

    app.exec();
}
