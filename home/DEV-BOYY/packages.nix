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
    gearlever # for beeper cause the one from the nixpkgs seems bugged
    strawberry # for itunes lib and need to test if upload to ipod works
    parsec-bin
    libreoffice
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness # for adjusting brightness on ddc/ci screen
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
