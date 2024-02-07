# https://github.com/Harmos274/nixfiles/blob/d00481cbf47225c8c0b981c8d73ab7e202de2c5b/lib/default.nix

{ inputs, overlays, constants, mysecrets }:
{
  mkSystem = { hostname, system, users ? [ ] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs system hostname;
      };
      modules = [
        ../hosts/${hostname}
        {
          networking.hostName = hostname;

          # Allow unfree packages
          nixpkgs = {
            inherit overlays;
            config.allowUnfree = true;
          };

          # Add each input as a registry
          nix.registry = inputs.nixpkgs.lib.mapAttrs'
            (n: v: inputs.nixpkgs.lib.nameValuePair n { flake = v; })
            inputs;
        }
      ] ++ inputs.nixpkgs.lib.forEach users (u: ../users/${u}/system);
    };

  mkHome = { username, system, hostname }:
    inputs.home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit hostname inputs constants mysecrets;
      };
      pkgs = builtins.getAttr system inputs.nixpkgs.outputs.legacyPackages;
      modules = [
        ../users/${username}/home
        {
          nixpkgs = {
            inherit overlays;
            config.allowUnfree = true;
          };
          programs = {
            home-manager.enable = true;
            git.enable = true;
          };

          # systemd restart services
          systemd.user.startServices = "sd-switch";

          home = {
            inherit username;
            homeDirectory = "/home/${username}";
          };
        }
      ];
    };
}
