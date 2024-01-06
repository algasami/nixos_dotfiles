{config, nixpkgs, pkgs, ... }:
{
  nixpkgs.config.cudaSupport = false;
  environment.systemPackages = with pkgs; [
  ];
}
