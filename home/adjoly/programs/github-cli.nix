{ pkgs, ... }:

{
  programs = {
    gh = {
      enable = true;
      settings = {
        editor = "nvim";
        git_protocol = "https";
      };
      extensions = [
        pkgs.gh-eco
      ];
    };
    gh-dash = {
      enable = true;
    };
  };
}
