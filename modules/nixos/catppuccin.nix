{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    keyzox.theme.enable = lib.mkEnableOption "Can be used to enable catppuccin";
  };

  config = lib.mkIf config.keyzox.theme.enable {
    catppuccin = {
    	enable = true;
		flavor = "frappe";
		accent = "lavender";
    };
  };
}
