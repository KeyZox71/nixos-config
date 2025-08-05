{
  liteMode,
  pkgs,
  self,
  ...
}:
{
  imports = [
    self.nixvimModules.servers
  ];

  lsp = {
    onAttach = "";
    keymaps = [
      {
        key = "K";
        lspBufAction = "hover";
      }
    ];
  };

  plugins.lspconfig.enable = true;

  keyzox.lsp.liteMode = liteMode;
  keyzox.lsp.enabled = [
    "clangd"
    "gopls"
    "bashls"
    "solidity_ls" # need custom conf
    "nixd" # also need custom conf
    "lua_ls"
    "ts_ls" # filetypes
  ];
}
