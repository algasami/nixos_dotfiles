{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true; # run on start
    style = ''
      ${builtins.readFile "${./macchiato.css}"}
      * { font-size: 20px; font-family: Iosevka Nerd Font; }
    '';
    settings = [{
      height = 40;
      layer = "top";
      position = "bottom";
      tray = { spacing = 10; };
      modules-center = [];
      modules-left = [
        "clock"
      ];
      modules-right = [
        "network"
        "cpu"
        "memory"
        "temperature"
      ];
      clock = {
        format = " 󱑔 {:%Y-%m-%d | %H:%M} ";
      };
      cpu = {
        format = "{usage}%   | ";
        tooltip = false;
      };
      memory = { format = "{}%   "; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr} ";
        format-disconnected = "Disconnected 󰲜  | ";
        format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰱔  | 󰕒 {bandwidthUpBits} 󰇚 {bandwidthDownBits} | ";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%)   | ";
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon} ";
        format-icons = [ " " " " " " ];
      };
    }];
  };
}
