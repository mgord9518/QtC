#!/bin/sh

qtwidgets_soname="/nix/store/bgfalfi93kbn8j1wfwz0x0dnk1wx9wdp-qtbase-6.8.0/lib/libQt6Widgets.so.6"
qtcore_soname="/nix/store/bgfalfi93kbn8j1wfwz0x0dnk1wx9wdp-qtbase-6.8.0/lib/libQt6Core.so.6"
qtgui_soname="/nix/store/bgfalfi93kbn8j1wfwz0x0dnk1wx9wdp-qtbase-6.8.0/lib/libQt6Gui.so.6"

out_name="qt6_shim.cpp"

symbols=$(
#nm "lib.so" \
#nm "$qtwidgets_soname" "$qtcore_soname" "$qtgui_soname" \
nm "$qtwidgets_soname" \
    -f just-symbols -U --dynamic --without-symbol-versions | grep -v "Qt_6" | grep -v "NonQt" | sort | uniq -u | perl -p -e 'chomp if eof'
)

#symbols=$(echo -ne "_Z5hellov\n")

symbol_num=$(echo "$symbols" | wc -l)

echo -n "#include <stdio.h>
#include <dlfcn.h>
#include <stdlib.h>

extern \"C\" {

#define E(symbol_name) void (*symbol_name)();
" > "$out_name"

echo "$symbols" | sed -e 's/^/E(/' | sed -e 's/$/)/' | grep -v "Qt_6" >> "$out_name"

echo "
//int main() {
static int init() __attribute__((constructor));
int init() {
    //void* handle = dlopen(\"libQt6Widgets.so.6\", RTLD_NOW);
    void* handle = dlopen(\"./lib.so\", RTLD_NOW);

" >> "$out_name"

echo "$symbols" | awk '{ print "    "$0" = (void (*)()) dlsym(handle, \""$0"\");" }' | grep -v "Qt_6" >> "$out_name"

echo "
    //hello();
    //_Z5hellov();

    //dlclose(handle);
}

}
" >> "$out_name"
