{ config, pkgs, constants, btop_gpu_nix, eww_wayland_nix, ...}:
{
  
  imports = [
    (import ./hyprland {inherit config pkgs constants eww_wayland_nix;})
    (import ./btop_gpu.nix {inherit config pkgs constants btop_gpu_nix;})
    (import ./programs {inherit config pkgs constants;})
  ];
  nixpkgs.config.allowUnfree = true;

  home.username = constants.username;
  home.homeDirectory = "/home/${constants.username}";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
  programs.wofi = {
    enable = true;
    style = ''
      * {
        font-family: Iosevka Nerd Font;
        font-size: 18px;
      }
    '';
  };
  services.cliphist.enable = true;
  programs.xplr.enable = true;
  programs.firefox.enable = true;
}
