WIP Qt6 bindings for C

Once I think they've gotten to a decently usable point, the Zig bindings will
be moved to their own repo

Building:
```sh
make -j   # Builds QtC library and `qt-c` test executable
zig build # Builds QtC library and `qt-zig` test executable (zig-out)
```
