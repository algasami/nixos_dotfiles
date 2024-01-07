{ config, pkgs, unstable_nixpkgs, constants, ... }: let
  unstable_pkgs = unstable_nixpkgs.legacyPackages.${constants.defaultSystem};
in {
  # steam can only be global for some reasons
  # (global libs...)
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
    args = [];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    wlr = {
      enable = true;
      settings = {
        screencast = {
          output_name = "DP-3";
          max_fps = 30;
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        };
      };
    };
  };
  programs.gamemode.enable = true;
  # game optimization

  
  environment.systemPackages = [
    pkgs.mangohud
    unstable_pkgs.vinegar
    pkgs.wineWowPackages.stable
  ];
}
