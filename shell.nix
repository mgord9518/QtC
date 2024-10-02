# TODO: support Qt6

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    cmake
    qt5Full
    zig_0_13
  ];
}
