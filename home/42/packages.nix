{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    nix
    mockoon
    brightnessctl
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      home = "/home/adjoly/";
    })
  ];
}
