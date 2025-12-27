{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.fonts = lib.mkEnableOption "to install all my defaults fonts";
  };

  config = lib.mkIf config.keyzox.fonts {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono

        jetbrains-mono
		open-dyslexic
        noto-fonts
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [
            "Noto Serif"
            "Noto Color Emoji"
          ];
          sansSerif = [
            "Noto Sans"
			"OpenDyslexic"
            # "JetBrains Mono"
            "Noto Color Emoji"
          ];
          monospace = [
            "JetBrainsMono Nerd Font Mono"
            "Noto Emoji"
          ];
          emoji = [
            "Noto Color Emoji"
          ];
        };
      };
    };

  };
}
