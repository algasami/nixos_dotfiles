(final: prev:
{
  # eww enable wayland compilation
  eww = prev.eww.override {
    withWayland = true;
  };

  # enable gpu monitoring for nvidia graphics cards
  btop = let
    pname = "btop";
    version = "1.3.0";
  in prev.btop.overrideAttrs {
    inherit pname version;
    src = prev.pkgs.fetchFromGitHub {
      owner = "aristocratos";
      repo = "${pname}";
      rev = "v${version}";
      hash = "sha256-QQM2/LO/EHovhj+S+4x3ro/aOVrtuxteVVvYAd6feTk=";
    };
    nativeBuildInputs = with prev.pkgs; [
      patchelf
      coreutils
      gnumake
    ];
    hardeningDisable = [ "all" ];
    phases = [ "unpackPhase" "buildPhase" "installPhase" "postInstall" "fixupPhase" "postFixup" ];
    buildPhase = ''
      echo START BUILDING
      make GPU_SUPPORT=true VERBOSE=true
    '';
    installPhase = ''
      mkdir $out
      make install PREFIX=$out
    '';
    postFixup = ''
      patchelf \
      --add-needed /run/opengl-driver/lib/libnvidia-ml.so \
      $out/bin/btop
    '';
  };
})
