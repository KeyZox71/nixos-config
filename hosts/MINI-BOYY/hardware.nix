{
  config,
  lib,
  ...
}:
{
  nixpkgs.config.allowInsecurePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta"
    ];
  boot = {
    kernelModules = [
      "wl"
    ];
    blacklistedKernelModules = [
      "b43"
      "bcma"
    ];
    extraModulePackages = [
      # install broadcom driver for macos wifi
      # note : the user will need to add it to `permittedInsecurePackages`
      config.boot.kernelPackages.broadcom_sta
    ];
  };
}
