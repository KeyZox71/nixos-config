{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    theme.enable = lib.mkEnableOption "Can be used to enable catppuccin";
  };

  config = lib.mkIf config.theme.enable {
    catppuccin = {
    	enable = true;
		flavor = "frappe";
		accent = "lavender";
    };
  };
}
