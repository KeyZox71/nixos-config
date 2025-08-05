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
    ./telescope.nix
    ./undotree.nix
	./treesitter.nix
  ];

  plugins = {
    todo-comments.enable = true;
    tmux-navigator.enable = true;
    # vim-be-good.enable = true;
    illuminate.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
  };
  
}
