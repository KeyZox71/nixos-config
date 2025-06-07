{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    gearlever # for beeper cause the one from the nixpkgs seems bugged
    strawberry # for itunes lib and need to test if upload to ipod works
    self.packages.${pkgs.system}.adjust-brightness # for adjusting brightness on ddc/ci screen
  ];
}
