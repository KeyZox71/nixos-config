{
  pkgs,
  self,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    feishin
    mpv

    (inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher.override {
      jdks = [
        jdk8
        jdk17
        jdk21
        jdk25
      ];
    })

    slack
	vesktop
    postman
    mockoon
    firefox
    gearlever
    parsec-bin
    libreoffice
    brightnessctl
    self.packages.${pkgs.stdenv.hostPlatform.system}.adjust-brightness
    (self.packages.${pkgs.stdenv.hostPlatform.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];
}
