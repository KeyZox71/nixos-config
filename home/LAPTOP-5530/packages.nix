{
  pkgs,
  self,
  ...
}:

{
  home.packages = with pkgs; [
    postman
    mockoon
    gearlever # for beeper cause the one from the nixpkgs seems bugged
    strawberry # for itunes lib and need to test if upload to ipod works
    brightnessctl
    prismlauncher
    jellyfin-media-player
    self.packages.${pkgs.system}.adjust-brightness
  ];
}
