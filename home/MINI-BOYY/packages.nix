{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    postman
    mockoon
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
