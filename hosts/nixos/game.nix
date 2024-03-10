{ config, pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  environment.systemPackages = [
    pkgs.mangohud
    pkgs.gamescope
  ];
}
