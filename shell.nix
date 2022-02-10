{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python39Full
    pkgs.poetry
    pkgs.glow
    pkgs.nodePackages.pyright

    # keep this line if you use bash
    pkgs.bashInteractive
  ];
}
