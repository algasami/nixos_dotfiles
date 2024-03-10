{ config, pkgs, ...}:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Latte-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk; # already overridden in /etc/nixos/theme.nix!
    };
  };
}
