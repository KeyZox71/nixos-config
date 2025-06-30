{
  self,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    self.homeModules.default
    ../adjoly/nixpkgs-conf.nix

    ./packages.nix
  ];

  keyzox = {
    cli.enable = true;
    theme.enable = true;
    kitty.enable = true;
    darkman.enable = true;
    nextcloud.enable = true;
  };

  programs.kitty.package = lib.mkForce pkgs.emptyDirectory;
  catppuccin.cursors.enable = lib.mkForce false;
  programs.zsh = {
    shellAliases = {
      re = "nix run nixpkgs#home-manager -- switch --flake /home/adjoly/nixos-config#42adjoly";
    };
    envExtra = lib.mkBefore ''
      export SSH_AUTH_SOCK=$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
    '';
  };

  programs.kitty.font.size = 13; # for kitty

  home.stateVersion = "24.05";
}
