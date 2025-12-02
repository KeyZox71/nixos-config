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
    (self.packages.${pkgs.system}.keyznvim.override {
      home = "/home/adjoly/";
    })
  ];
}
