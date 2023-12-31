{
  description = "This flake defines all my constants (workaround to be incorporated into nix flake)";
  outputs = { self }: rec {
    username = "algasami";
    userfullname = "algasami";
    useremail = "105358814+algasami@users.noreply.github.com";
    allSystemAttrs = {
      x64_system = "x86_64-linux";
    };
    defaultSystem = allSystemAttrs.x64_system;
    allSystems = builtins.attrValues allSystemAttrs;
  };
}
