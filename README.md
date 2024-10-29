WIP Qt6 bindings for C

Once I think they've gotten to a decently usable point, the Zig bindings will
be moved to their own repo

Development environment:
```sh
Nix:
  nix-shell   # Non-flake systems (lame!)
  nix develop # Flake-enabled systems

Ubuntu:
  # Not yet tested, please open an issue if this doesn't work!
  # If you want to build with Zig you'll have to install it manually or use
  # zigup
  sudo apt install qt6-base-dev build-essential

# TODO: other systems
```

Building:
```sh
make -j   # Builds QtC library and `qt-c` test executable
zig build # Builds QtC library and `qt-zig` test executable (zig-out)
```
