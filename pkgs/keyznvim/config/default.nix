{
  ...
}:
{
  imports = [
    ./options.nix
    ./mappings.nix

    ./plugins
  ];

  viAlias = true;
  vimAlias = true;

  opts = {
    number = true;
    relativenumber = true;
  };

  clipboard.register = "unnamedplus";
  colorschemes.catppuccin.enable = true;
}
