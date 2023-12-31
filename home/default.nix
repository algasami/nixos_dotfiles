{ config, pkgs, constants, btop_gpu_nix, ...}:
{
  
  imports = [
    (import ./hyprland {inherit config pkgs constants;})
    (import ./btop_gpu.nix {inherit config pkgs constants btop_gpu_nix;})
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
