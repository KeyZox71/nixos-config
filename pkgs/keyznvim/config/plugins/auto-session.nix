{
  ...
}:
{
  plugins.auto-session = {
    enable = true;
    settings = {
      enabled = true;
      session_lens = {
        load_on_setup = true;
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>wr";
      action = "<cmd>SessionSearch<cr>";
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = "<cmd>SessionSave<cr>";
    }
    {
      mode = "n";
      key = "<leader>wa";
      action = "<cmd>SessionToggleAutoSave<cr>";
    }
  ];
}
