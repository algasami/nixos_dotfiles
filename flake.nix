{
  description = "NixOS Flake config for algasami@nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    unstable_nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mysecrets = { url = "git+ssh://git@github.com/algasami/nixos-secrets?ref=main&shallow=1"; flake = false; };
    constants = { url = "path:./constants"; flake = true; };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, constants, ... }: let
in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = constants.defaultSystem;
      specialArgs = inputs;
      modules = [
        # we are all separate modules!
        ./configuration.nix
        ./shells.nix
        ./theme_global.nix
        ./fonts_global.nix
        ./audio_global.nix
        ./game.nix
        ./overlays.nix

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
