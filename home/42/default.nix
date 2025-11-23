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
    tssh = "docker exec -it tailscale-42 tailscale ssh";
    tsqr = "docker compose -f ~/Documents/compose.yml up -d && docker exec -it tailscale-42 tailscale up --qr --accept-dns --hostname=tailscale-42 --accept-routes";
  };

  programs.kitty = {
    package = lib.mkForce pkgs.emptyDirectory;
    font = {
      size = 13.5; # for kitty
    };
  };

  programs.nh = {
    enable = true;
    flake = "/home/adjoly/nixos-config";
  };

  home.stateVersion = "24.05";
}
