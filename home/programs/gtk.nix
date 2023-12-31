{ config, pkgs, ...}:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Teal-Dark";
      package = pkgs.catppuccin-gtk; # already overridden in /etc/nixos/theme.nix!
    };
  };
}
