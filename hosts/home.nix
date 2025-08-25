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
    users.adjoly = import (../home/${config.networking.hostName});
  };
  programs.zsh.enable = true;
  nix.settings.trusted-users = [ "@wheel" ];
}
