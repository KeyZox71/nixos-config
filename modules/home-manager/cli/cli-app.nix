{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  options = {
    cli-app.enable = lib.mkEnableOption "can be used to enable the random cli app i use";
  };

  config = lib.mkIf config.cli-app.enable {
    home.packages = with pkgs; [
      inputs.timmy.packages.${pkgs.system}.timmy
      keyznvim
    ];

    programs.yazi = {
      enable = lib.mkDefault true;
      enableZshIntegration = true;
    };

    programs.thefuck = {
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
        vim_keys = "True";
      };
    };

    nixpkgs.overlays = [
      inputs.keyznvim.overlays.default
    ];
  };
}
