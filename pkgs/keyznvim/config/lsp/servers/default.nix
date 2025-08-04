{
  liteMode,
  pkgs,
  ...
}:
{
  "*" = {
    settings = {
      capabilities = {
        textDocument = {
          semanticTokens = {
            multilineTokenSupport = true;
          };
        };
      };
      root_markers = [
        ".git"
      ];
    };
  };
  clangd = import ./server.nix { inherit pkgs liteMode; };
}
