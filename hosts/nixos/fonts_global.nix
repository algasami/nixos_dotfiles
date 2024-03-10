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
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "Mononoki" ]; })
  ];
  fonts.fontconfig.antialias = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "Mononoki Nerd Font"
      "Iosevka Nerd Font"
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
