{
  config,
  # pkgs,
  lib,
  ...
}:
{
  # hardware.graphics = {
  #   extraPackages = [
  #     pkgs.intel-vaapi-driver
  #   ];
  #   extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
  #   enable = true;
  #   enable32Bit = true;
  # };
  nixpkgs.config.allowInsecurePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta" # aka “wl”
    ];
  # services.thermald.enable = true;
  # hardware.facetimehd.enable = false;
  # services.mbpfan.enable = true;
  boot = {
    # initrd.kernelModules = [
    #   "i915"
    # ];
    kernelModules = [
      # "coretemp"
      # "applesmc"
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
