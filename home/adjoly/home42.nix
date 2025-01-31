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

    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  programs.home-manager.enable = true;

  programs.kitty.font = {
    name = "JetBrainsMono Nerd Font Mono";
    size = 11;
  };

  home = {
    packages = with pkgs; [
      beeper
    ];
    stateVersion = "24.05";
  };
}
