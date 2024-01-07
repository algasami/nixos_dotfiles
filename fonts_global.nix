# global fonts
{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    source-code-pro
    dejavu_fonts
    noto-fonts
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
      "Noto Sans"
      "DejaVu Sans"
    ];
    serif = [
      "Noto Serif"
      "DejaVu Serif"
    ];
  };
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-chewing
    fcitx5-gtk
  ];
}
