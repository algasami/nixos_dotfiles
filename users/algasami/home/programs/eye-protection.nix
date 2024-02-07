{ config, pkgs, ...}: {
  services.gammastep = {
    enable = true;
    tray = false;
    temperature = {
      day = 5700;
      night = 4000;
    };
    # https://gitlab.com/chinstrap/gammastep/-/blob/master/gammastep.conf.sample?ref_type=heads
    settings = {
      general = {
        fade = "1"; # gradually apply the new screen temperature/brightness over a couple of seconds.
        brightness-day = "1.0";
        brightness-night = "0.8";
        location-provider = "manual";
      };
      manual = {
        lat = "25.10"; # latitude
        lon = "121.60"; # longitude
      };
    };
  };
}
