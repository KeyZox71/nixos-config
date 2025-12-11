{
  ...
}:
{

  opts.completeopt = [
    "menu"
    "menuone"
    "noselect"
  ];
  plugins = {
    luasnip.enable = true;
    lspkind = {
      enable = true;

      settings.cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
          neorg = "[neorg]";
          nixpkgs_maintainers = "[nixpkgs]";
        };
      };
    };
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
          "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
        };
        completion = {
          autoComplete = [
            "require('cmp.types').cmp.TriggerEvent.TextChanged"
          ];
        };
        sources = [
          { name = "path"; }
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          { name = "neorg"; }
          { name = "nixpkgs_maintainers"; }
        ];
      };
    };
  };
}
