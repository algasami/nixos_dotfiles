# global fonts
{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    source-code-pro
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-extra
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
  ];
  fonts.fontconfig.antialias = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "Iosevka Nerd Font"
      "DejaVu Sans Mono"
    ];
    sansSerif = [
      "Noto Sans CJK TC"
      "DejaVu Sans"
    ];
    serif = [
      "Noto Serif CJK TC"
      "DejaVu Serif"
    ];
  };
}
