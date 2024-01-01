{ config, pkgs , btop_gpu_nix, constants, ... }:
{
  home.packages = [
    btop_gpu_nix.packages.${constants.defaultSystem}.default
  ];
}
