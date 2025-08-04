{
  ...
}:
{
  imports = [
    ./42header.nix
    ./autodarkmode.nix
    ./auto-session.nix
    ./harpoon.nix
    ./oil.nix
  ];

  plugins = {
    tmux-navigator.enable = true;
    # vim-be-good.enable = true;
    illuminate.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
  };
}
