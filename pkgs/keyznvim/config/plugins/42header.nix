{
  pkgs,
  ...
}:
let
  plugin = pkgs.vimUtils.buildVimPlugin {
    pname = "42header-nvim";
    version = "4303be09d9615e9169661b3e5d5a98c3eecee0ff";
    src = pkgs.fetchFromGitHub {
      owner = "Diogo-ss";
      repo = "42-header.nvim";
      rev = "4303be09d9615e9169661b3e5d5a98c3eecee0ff";
      sha256 = "7byIoFoaRag23Zej7ioL+2WjAv7Zttn1/WZrya0NZPo=";
    };
  };
in
{
  extraPlugins = [
    plugin
  ];
  extraConfigLua = "
require(\"42header\").setup {
  default_map = true, -- Default mapping <F1> in normal mode.
  auto_update = true, -- Update header when saving.
  user = \"adjoly\", -- Your user.
  mail = \"adjoly@student.42angouleme.fr\", -- Your mail.
-- add other options.
}
  ";
}
