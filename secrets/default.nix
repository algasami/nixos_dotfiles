{ config, pkgs, agenix, mysecrets, constants, ... }:

{
  imports = [
     agenix.nixosModules.default
  ];
  environment.systemPackages = [ agenix.packages.${pkgs.system}.default ];


  age.identityPaths = [ 
    "/persist/home/${constants.username}/.ssh/id_ed25519"
  ];

  age.secrets = {
    "ssh-default"= {
      symlink = true;
      file = "${mysecrets}/ssh-default.age";
      mode = "0600";
      owner = constants.username;
    };
  };

  environment.etc = {
    "agenix/ssh-default" = {
      source = config.age.secrets."ssh-default".path;
      mode = "0600";
      user = constants.username;
    };
  };
}
