{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    fzf
    tmux
    zoxide
    direnv
    ripgrep
    starship
    thefuck
    unstable.yazi
    inputs.timmy.packages.${pkgs.system}.timmy
  ];
}
