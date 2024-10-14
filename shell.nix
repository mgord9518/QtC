{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    gnumake
    qt6.qtbase
    zig_0_13
  ];

  # Need for dlopen to work
  #LD_LIBRARY_PATH = pkgs.qt6.qtbase.outPath + "/lib";
}
