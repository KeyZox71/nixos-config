{
  liteMode,
  self,
  ...
}:
{
  imports = [
    self.nixvimModules.servers

    ./cmp.nix
  ];

  lsp = {
    keymaps = [
      {
        mode = "n";
        key = "K";
        lspBufAction = "hover";
      }
    ];
    inlayHints.enable = true;
  };
  lsp.servers."*" = {
    settings = {
      capabilities = {
        textDocument = {
          semanticTokens = {
            multilineTokenSupport = true;
          };
        };
      };
    };
  };
  extraConfigLua = ''
    vim.diagnostic.enable()
    vim.diagnostic.config({
      virtual_text = true
    })
  '';

  plugins.lspconfig.enable = true;

  keyzox.lsp = {
    liteMode = liteMode;
    enabled = [
      "clangd"
      "gopls"
      "bashls"
      "solidity_ls"
      "nixd"
      "lua_ls"
      "ts_ls"
	  "hls"
	  "ocamllsp"
    ];
    serversPath = ./servers;
  };
}
