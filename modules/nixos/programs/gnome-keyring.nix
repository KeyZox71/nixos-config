{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.programs.gnome-keyring.enable = lib.mkEnableOption "to enable gnome gnome-keyring";
  };

  config = lib.mkIf config.keyzox.programs.gnome-keyring.enable {
    programs.seahorse.enable = true;
    services.gnome.gnome-keyring.enable = true;
  };
}
