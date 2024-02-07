{ config, pkgs, constants, ... }:
{

  programs.eww = {
    enable = true;
    configDir = ./eww-config;
  };
}
