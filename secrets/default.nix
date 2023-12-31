{ config, pkgs, agenix, mysecrets, constants, ... }:

{
  imports = [
     agenix.nixosModules.default
  ];
  environment.systemPackages = [ agenix.packages.${pkgs.system}.default ];


  age.identityPaths = [ 
    "/home/${constants.username}/.ssh/id_ed25519"
  ];

  age.secrets = {
    "ssh-default"= {
      symlink = true;
      file = "${mysecrets}/ssh-default.age";
      mode = "0600";
      owner = constants.username;
    };
  };

}
