{
  ...
}:
{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      default_integrations = true;
      flavour = "auto";
      background = {
        dark = "frappe";
        light = "latte";
      };
      integrations = {
        cmp = true;
        telescope.enabled = true;
        treesitter = true;
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          virtual_text = {
            errors = [ "italic" ];
            hints = [ "italic" ];
            information = [ "italic" ];
            warnings = [ "italic" ];
            ok = [ "italic" ];
          };
          underlines = {
            errors = [ "underline" ];
            hints = [ "underline" ];
            information = [ "underline" ];
            warnings = [ "underline" ];
          };
        };
      };
    };
  };
}
