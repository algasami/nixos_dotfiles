{ config, pkgs, constants, ...}:
{
  imports = [
    (import ./nvim.nix {inherit config pkgs;})
    (import ./git.nix {inherit config pkgs constants;})
    (import ./kitty.nix {inherit config pkgs;})
    (import ./gtk.nix {inherit config pkgs;})
    (import ./audio.nix {inherit config pkgs;})
    (import ./eye-protection.nix {inherit config pkgs;})
  ];
}