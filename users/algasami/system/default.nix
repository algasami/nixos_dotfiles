{ pkgs, ... }:
{
  users.users.algasami = {
    isNormalUser = true;
    home = "/home/algasami";
    description = "algasami";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
