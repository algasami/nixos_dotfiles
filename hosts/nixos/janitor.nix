{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.configurationLimit = 15;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
 };
  nix.settings.auto-optimise-store = true;
}
