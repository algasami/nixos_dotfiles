{
  description = "NixOS Flake config for algasami@nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mysecrets = { url = "git+ssh://git@github.com/algasami/nixos-secrets?ref=main&shallow=1"; flake = false; };
    constants = { url = "path:./constants"; flake = true; };

    btop_gpu_nix = { url = "github:algasami/btop_gpu_nix?ref=main&shallow=1"; };
    eww_wayland_nix = { url = "github:algasami/eww-wayland-nix?ref=main&shallow=1"; };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, constants, agenix, ... }: let
in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = constants.allSystemAttrs.x64_system;
      specialArgs = inputs;
      modules = [
        # we are all separate modules!
        ./configuration.nix
        ./shells.nix
        ./theme_global.nix
        ./fonts_global.nix
        ./audio_global.nix
        ./cuda.nix
        ./steam.nix

        ./secrets/default.nix

        home-manager.nixosModules.home-manager

        {

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."${constants.username}" = import ./home;
          home-manager.extraSpecialArgs = inputs;
        }

      ] ;
    };
  };
}
