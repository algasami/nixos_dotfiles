{
  description = "NixOS Flake config for algasami@nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils?rev=04c1b180862888302ddfb2e3ad9eaa63afc60cf8";
    mysecrets = { url = "git+ssh://git@github.com/algasami/nixos-secrets?ref=main&shallow=1"; flake = false; };
    constants = { url = "path:./constants"; flake = true; };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, constants, mysecrets, ... }: let
  local-overlays = import ./overlays;
  overlays = with inputs; [ local-overlays ];
  lib = import ./lib { inherit inputs overlays constants mysecrets; };
  in
  {
    nixosConfigurations = {
      "nixos" = lib.mkSystem {
        hostname = "nixos";
        system = "${constants.defaultSystem}";
        users = ["${constants.username}"];
      };
    };
    homeConfigurations = {
      "${constants.username}@nixos" = lib.mkHome {
        username = "${constants.username}";
        system = "${constants.defaultSystem}";
        hostname = "nixos";
      };
    };
  } // inputs.flake-utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = import inputs.nixpkgs { inherit system overlays; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ home-manager git ];
          NIX_CONFIG = "experimental-features = nix-command flakes";
        };
      }
    );
}
