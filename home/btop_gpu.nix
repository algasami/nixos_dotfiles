{ config, pkgs , btop_gpu_nix, constants, ... }:
{
  programs.btop = {
    enable = false;
    settings = { # need home-manager to automatically inject these
      color_theme = "Tokyo Storm";
      theme_background = false;
    };
  };
  home.packages = [
    btop_gpu_nix.packages.${constants.defaultSystem}.default
  ];
}
