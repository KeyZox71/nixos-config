{
  config,
  pkgs,
  lib,
  outputs,
  inputs,
  self,
  ...
}:

{
  users.users.adjoly = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "kanelthego@t";
    extraGroups = [
      "docker"
      "audio"
      "video"
      "input"
      "networkmanager"
      "wheel"
      "sudo"
      "wireshark"
    ];
  };
  home-manager = {
    useUserPackages = lib.mkDefault true;
    extraSpecialArgs = { inherit inputs outputs self; };
    users.adjoly = import ../home/${config.networking.hostName};
  };
  programs.zsh.enable = true;
  nix.settings = {
    trusted-users = [ "@wheel" ];
    trusted-substituters = [ "https://prismlauncher.cachix.org" ];
    trusted-public-keys = [
      "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
    ];
  };
  nixpkgs.overlays = [
    (_final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;
}
