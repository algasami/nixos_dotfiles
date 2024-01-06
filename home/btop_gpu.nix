{ config, pkgs, constants, ... }:
{
  programs.btop = {
    enable = true;
    settings = { # need home-manager to automatically inject these
      color_theme = "Tokyo Storm";
      theme_background = false;
    };
  };
}
