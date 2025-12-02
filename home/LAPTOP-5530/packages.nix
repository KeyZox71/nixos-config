{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    slack
    postman
    mockoon
    firefox
    gearlever # for beeper cause the one from the nixpkgs seems bugged
    parsec-bin
    strawberry # for itunes lib and need to test if upload to ipod works
    libreoffice
    brightnessctl
    prismlauncher
    # jellyfin-media-player
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
