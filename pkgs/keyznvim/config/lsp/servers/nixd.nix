{
  config.nixd = {
    formatting = {
      command = [ "nixfmt" ];
    };
    nixpkgs = {
      expr = "import <nixpkgs> { }";
    };
  };
}
