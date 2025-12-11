{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    prismlauncher

    slack
    firefox
    postman
    gearlever 
    parsec-bin
    libreoffice
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness # for adjusting brightness on ddc/ci screen
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
