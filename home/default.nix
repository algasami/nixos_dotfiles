{ config, pkgs, constants, ...}:
{
  
  imports = [
    (import ./hyprland {inherit config pkgs constants;})
    (import ./programs {inherit config pkgs constants;})
  ];
  nixpkgs.config.allowUnfree = true;

  home.username = "algasami";
  home.homeDirectory = "/home/algasami";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
  programs.wofi.enable = true;
  services.cliphist.enable = true;
  programs.xplr.enable = true;
  programs.firefox = {
    enable = true;
  };
}
