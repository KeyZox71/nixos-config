{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  options = {
    keyzox.services.tailscale.enable = lib.mkEnableOption "To enable tailscale";
  };

  config = lib.mkIf config.keyzox.services.tailscale.enable {
    services.tailscale = {
      enable = true;
      extraUpFlags = lib.mkBefore [ "--accept-routes" ];
	  package = inputs.unstablepkgs.legacyPackages.${pkgs.system}.tailscale;
    };
  };
}
