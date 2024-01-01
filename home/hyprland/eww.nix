{ config, pkgs, eww_wayland_nix, constants, ... }:
{
  home.packages = [
    eww_wayland_nix.packages."${constants.defaultSystem}".default
  ];
}
