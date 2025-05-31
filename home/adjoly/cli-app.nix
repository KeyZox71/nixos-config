{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    fzf
    btop
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
