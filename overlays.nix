{ config, nixpkgs, ... }:
# this file stores various overlays
{
  nixpkgs.overlays = [
    (final: prev: {
      eww = prev.eww.override {
          withWayland = true;
      };
    })
  ];
}
