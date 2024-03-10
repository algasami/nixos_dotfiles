{ config, pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    font.name = "Mononoki Nerd Font";
    font.size = 16;
    # font.package has already been taken care of (strict global font)
    theme = "Catppuccin-Frappe";
  };
}
