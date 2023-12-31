{
  description = "NixOS Flake config for algasami@nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    agenix.url = "github:ryantm/agenix/564595d0ad4be7277e07fa63b5a991b3c645655d";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mysecrets = { url = "git+ssh://git@github.com/algasami/nixos-secrets?ref=main&shallow=1"; flake = false; };
    constants = { url = "path:/etc/nixos/constants"; flake = true; };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, constants,  ... }: let
in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = constants.allSystemAttrs.x64_system;
      specialArgs = inputs;
      modules = [
        # we are all separate modules!
        ./configuration.nix
        ./theme_global.nix
        ./fonts_global.nix
        ./audio_global.nix

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