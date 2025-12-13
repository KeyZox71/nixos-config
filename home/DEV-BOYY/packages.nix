{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    feishin
    mpv

    (prismlauncher.override {
      jdks = [
        javaPackages.compiler.temurin-bin.jre-8
        javaPackages.compiler.temurin-bin.jre-11
        javaPackages.compiler.temurin-bin.jre-17
        javaPackages.compiler.temurin-bin.jre-21
        javaPackages.compiler.temurin-bin.jre-25
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
