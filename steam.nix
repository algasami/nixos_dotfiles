{ config, pkgs, ... }:
{
  # steam can only be global for some reasons
  # (global libs...)
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
