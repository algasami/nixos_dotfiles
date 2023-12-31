{config, nixpkgs, pkgs, ... }:
{
  nixpkgs.config.cudaSupport = true;
  environment.systemPackages = with pkgs; [
    cudatoolkit # enable cuda
  ];
}
