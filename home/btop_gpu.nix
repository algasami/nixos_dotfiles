{ config, pkgs , btop_gpu_nix, constants, ... }:
{
  home.packages = [
    btop_gpu_nix.packages.${constants.allSystemAttrs.x64_system}.default
  ];
}
