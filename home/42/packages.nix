{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    mockoon
    brightnessctl
    (self.packages.${pkgs.system}.keyznvim.override {
      home = "/home/adjoly/";
    })
  ];
}
