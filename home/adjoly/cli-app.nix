{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.timmy.packages.${pkgs.system}.timmy
  ];
}
