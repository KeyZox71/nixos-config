{
  self,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    self.homeModules.default
    ../nixpkgs-conf.nix

    ./packages.nix
  ];

  keyzox = {
    cli.enable = true;
    theme.enable = true;
    kitty.enable = true;
    darkman.enable = true;
  };

  programs.kitty.package = lib.mkForce pkgs.emptyDirectory;
  catppuccin.cursors.enable = lib.mkForce false;
  programs.zsh = {
    shellAliases = {
      re = "nix run nixpkgs#home-manager -- switch --flake /home/adjoly/nixos-config#42adjoly";
      bgs = "brightnessctl set";
      wl-copy = "xclip -i -selection clipboard";
    };
    envExtra = lib.mkBefore ''
      export SSH_AUTH_SOCK=$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
    '';
  };

  programs.zsh.shellAliases = {
    code = "flatpak run com.visualstudio.code";
  };

  programs.kitty.font.size = 13; # for kitty

  programs.nh = {
	enable = true;
	flake = "/home/adjoly/nixos-config";
  };

  home.stateVersion = "24.05";
}
