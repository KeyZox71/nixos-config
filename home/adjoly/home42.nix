{ inputs, pkgs, ... }:

{
  imports = [

    ./cli-app.nix
    ./unstable-overlay.nix

    ./themes/catppuccin.nix

    ./programs/git.nix
    ./programs/tmux.nix
    ./programs/pogit.nix
    ./programs/neovim.nix
    ./programs/direnv.nix
    ./programs/shell/zsh42.nix

    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      beeper
      discord
      obsidian
    ];
    stateVersion = "24.05";
  };
}
