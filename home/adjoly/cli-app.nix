{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    fzf
    tmux
    zoxide
    direnv
    ripgrep
    thefuck
    starship
    ripgrep-all
    unstable.yazi
    bash-language-server
    inputs.timmy.packages.${pkgs.system}.timmy
  ];
}
