{
  pkgs,
  ...
}:
let
  auto-dark-mode-plugin = pkgs.vimUtils.buildVimPlugin {
    pname = "auto-dark-mode";
    version = "";
    src = pkgs.fetchFromGitHub {
      owner = "f-person";
      repo = "auto-dark-mode.nvim";
      rev = "e300259ec777a40b4b9e3c8e6ade203e78d15881";
      sha256 = "PhhOlq4byctWJ5rLe3cifImH56vR2+k3BZGDZdQvjng=";
    };
  };
in
{
  extraPlugins = [
    auto-dark-mode-plugin
  ];
  extraConfigLua = "
require(\"auto-dark-mode\").setup {
	  update_interval = 1000,
	  set_dark_mode = function()
		vim.cmd('Catppuccin macchiato')
		vim.cmd(\"hi Normal ctermbg=none guibg=none\")
	  end,
	  set_light_mode = function()
		vim.cmd('Catppuccin latte')
		vim.cmd(\"hi Normal ctermbg=none guibg=none\")
	  end,
}
  ";
}
