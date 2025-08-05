{
  liteMode,
  ...
}:
{
  imports = [
    ./color.nix
    ./options.nix
    ./mappings.nix
    ./performance.nix

    ./plugins
    ./lsp
  ];

  viAlias = true;
  vimAlias = true;

  opts = {
    number = true;
    relativenumber = true;
  };

  clipboard.register = "unnamedplus";
}
