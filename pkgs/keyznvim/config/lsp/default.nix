{
  liteMode,
  pkgs,
  ...
}:
{
  imports = [
    ./lspconfig.nix
  ];
  lsp = {
    servers = import ./servers { inherit pkgs liteMode; };
    onAttach = "

	";
    keymaps = [
      {
        key = "K";
        lspBufAction = "hover";
      }
    ];
  };
}
