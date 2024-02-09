{ config, pkgs, ... }:
{
  imports = [
    (import ./haskell.nix {inherit config pkgs;}) 
    (import ./javascript.nix {inherit config pkgs;}) 
  ];
}
