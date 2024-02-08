{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    grimblast
    gimp # edit
  ];
}
