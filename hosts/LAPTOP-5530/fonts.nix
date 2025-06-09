{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono

      jetbrains-mono
      noto-fonts
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Sans Mono"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "JetBrains Mono"
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
}
