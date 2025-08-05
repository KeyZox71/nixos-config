{
  ...
}:
{
  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>noh<cr>";
      options.desc = "General Clear highlights";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action.__raw = "function() vim.lsp.buf.definition() vim.cmd('normal! zz') end";
      options.desc = "Go to definition";
    }
    {
      mode = "n";
      key = "<leader>FF";
      action.__raw = "function() vim.lsp.buf.format() end";
      options.desc = "Format the code";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>TodoTelescope<cr>";
      options.desc = "Telescope for todo";
    }
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Editing Move line down";
      };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Editing Move line up";
      };
    }
  ];
}
