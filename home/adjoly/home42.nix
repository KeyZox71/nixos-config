{
  lib,
  inputs,
  pkgs,
  ...
}:

{
  imports = [

    ./cli-app.nix
    ./unstable-overlay.nix

    ./themes/catppuccin.nix

    ./services/darkman.nix

    ./programs/git.nix
    ./programs/tmux.nix
    ./programs/pogit.nix
    ./programs/kitty.nix
    ./programs/neovim.nix
    ./programs/direnv.nix
    ./programs/shell/zsh42.nix

    inputs.catppuccin.homeModules.catppuccin
  ];
  programs.home-manager.enable = true;

  programs.kitty.font = {
    name = "JetBrainsMono Nerd Font Mono";
    size = 11;
  };

  catppuccin = {
    tofi.enable = false;
    cursors.enable = false;
    waybar.enable = false;
  };

  home = {
    packages = with pkgs; [
    ];
    stateVersion = "24.05";
  };
}
