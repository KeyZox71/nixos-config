{
  home ? "",
  ...
}:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;

    smartindent = true;

    swapfile = false;
    backup = false;
    undofile = true;
    undodir = "${if home != "" then home else "/tmp/"}.vim/undodir";
  };
}
