{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    feishin
    mpv

    slack
    postman
    mockoon
    firefox
    gearlever
    parsec-bin
    libreoffice
    brightnessctl
    prismlauncher
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
