{
  lib,
  config,
  pkgs,
  inputs,
  outputs,
  self,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  options = {
    keyzox.home-manager.enable = lib.mkEnableOption "Can be used to enable my home-manager config (takes ../../home/)";
	keyzox.home-manager.username = lib.mkOption {
	  type = lib.types.str;
	  default = "adjoly";
	  example = "kanelTheGoat";
	  description = "Can be used to change the username";
	};
  };

  config = lib.mkIf config.keyzox.home-manager.enable {
    home-manager = {
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = { inherit inputs outputs self; };
      users.${config.keyzox.home-manager.username} = import (../../home/${config.networking.hostName});
    };
  };
}
