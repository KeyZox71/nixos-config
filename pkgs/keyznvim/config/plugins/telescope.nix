{
  ...
}:
{
  plugins.telescope = {
    enable = true;
    extensions.live-grep-args.enable = true;
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>ps" = "live_grep";
    };
  };
}
