{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  options = {
    keyzox.cli-app.enable = lib.mkEnableOption "can be used to enable the random cli app i use";
  };

  config = lib.mkIf config.keyzox.cli-app.enable {
    home.packages = with pkgs; [
      inputs.timmy.packages.${pkgs.stdenv.hostPlatform.system}.timmy
      tea
	  forgejo-cli
    ];

    programs.yazi = {
      enable = lib.mkDefault true;
      enableZshIntegration = true;
    };

    programs.fastfetch = {
      enable = true;
    };

    programs.btop = {
      enable = true;
      settings = {
        color_theme = "ayu";
        vim_keys = true;
      };
    };
  };
}
