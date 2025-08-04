{
  ...
}:
{
  imports = [
    ./42header.nix
    ./oil.nix
  ];

  plugins = {
    tmux-navigator.enable = true;
    # vim-be-good.enable = true;
    illuminate.enable = true;
  };
}
