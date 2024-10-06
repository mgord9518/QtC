# TODO: support Qt6

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    gnumake
    qt5Full
    zig_0_13
  ];
}
