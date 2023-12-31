{ config, pkgs, ...}: let
in {
  home.packages = [
    pkgs.nvtop
  ];
}
