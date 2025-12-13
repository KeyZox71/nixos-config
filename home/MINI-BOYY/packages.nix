{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    k3d
    kubectl

    parsec-bin
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
