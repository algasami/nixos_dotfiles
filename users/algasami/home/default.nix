{ config, pkgs, constants, mysecrets, btop_gpu_nix, eww_wayland_nix, ...}:
{
  
  imports = [
    (import ./hyprland {inherit mysecrets config pkgs constants eww_wayland_nix;})
    (import ./fonts.nix {inherit config pkgs;})
    (import ./security.nix {inherit config pkgs;})
    (import ./btop_gpu.nix {inherit config pkgs constants btop_gpu_nix;})
    (import ./programs {inherit config pkgs constants;})
    (import ./languages {inherit config pkgs constants;})
  ];
  nixpkgs.config.allowUnfree = true;

  home.username = constants.username;
  home.homeDirectory = "/home/${constants.username}";

  home.stateVersion = "23.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    VISUAL = "nvim";
    DIFFPROG = "nvim -d";
    MANPAGER = "nvim +Man!";
    MANWIDTH = 999;
  };

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

  services.gnome-keyring.enable = true;
}
