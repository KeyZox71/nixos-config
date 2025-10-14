{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.services.sound.enable = lib.mkEnableOption "to enable sound";
  };

  config = lib.mkIf config.keyzox.services.sound.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    services.playerctld.enable = true;
  };
}
