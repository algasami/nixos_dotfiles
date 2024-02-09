{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ghc
    cabal-install
    stack
  ];
}
