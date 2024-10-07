pub const Application = @import("Application.zig");

pub const layouts = struct {
    pub const BoxLayout = @import("layouts/BoxLayout.zig");
};

pub const widgets = struct {
    pub const Widget = @import("Widget.zig");
    pub const PushButton = @import("widgets/PushButton.zig");
    pub const Label = @import("widgets/Label.zig");
};
