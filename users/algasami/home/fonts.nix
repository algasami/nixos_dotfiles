{ config, pkgs, ... }:
{
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-chewing
    fcitx5-gtk
  ];
}
