{ config, nixpkgs, pkgs, ... }:
# this file stores various overlays
{
  nixpkgs.overlays = [
    
    # This overlay compiles eww with wayland support
    (final: prev: {
      eww = prev.eww.override {
          withWayland = true;
      };
    })
    # This overlay compiles btop with libnvidia-ml.so library
    (final: prev: {
      btop = prev.btop.overrideAttrs {
        nativeBuildInputs = with pkgs; [
          patchelf
          coreutils
          gnumake
        ];
        buildPhase = ''
          make GPU_SUPPORT=true VERBOSE=true
        '';
        installPhase = ''
          mkdir $out
          make install PREFIX=$out
        '';
        postInstall = "";
        postFixup = ''
          patchelf \
          --add-needed /run/opengl-driver/lib/libnvidia-ml.so \
          $out/bin/btop
        '';
      };
    })
  ];
}
