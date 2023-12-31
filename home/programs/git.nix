{ config, pkgs, constants, ...}: let
in {
  programs.git = {
    enable = true;
    userName = constants.username;
    userEmail = constants.useremail;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
