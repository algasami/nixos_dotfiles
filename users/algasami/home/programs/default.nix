{ config, pkgs, constants, ...}:
{
  imports = [
    (import ./nvim.nix {inherit config pkgs;})
    (import ./fish.nix {inherit config pkgs;})
    (import ./git.nix {inherit config pkgs constants;})
    (import ./kitty.nix {inherit config pkgs;})
    (import ./gtk.nix {inherit config pkgs;})
    (import ./audio.nix {inherit config pkgs;})
    (import ./eye-protection.nix {inherit config pkgs;})
    (import ./playerctld.nix {inherit config pkgs;})
    (import ./nix-index.nix {inherit config pkgs;})
    (import ./screenshot.nix {inherit config pkgs;})
    (import ./notification.nix {inherit config pkgs;})
  ];
  programs.vscode.enable = true;
  programs.obs-studio.enable = true;
}
