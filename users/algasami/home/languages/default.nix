{ config, pkgs, ... }:
{
  imports = [
    (import ./haskell.nix {inherit config pkgs;}) 
  ];
}
