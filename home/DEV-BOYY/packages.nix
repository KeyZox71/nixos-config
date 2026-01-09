{
  pkgs,
  inputs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    feishin
    mpv

    (unstable.prismlauncher.override {
      jdks = [
        jdk8
		jdk11
        jdk17
        jdk21
        jdk25
      ];
    })

    slack
    postman
    firefox
    gearlever
    parsec-bin
    libreoffice
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
