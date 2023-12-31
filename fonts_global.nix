# global fonts
{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
  ];
  fonts.fontconfig.antialias = true;
}
