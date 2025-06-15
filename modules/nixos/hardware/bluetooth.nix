{
	config,
	lib,
	pkgs,
	...
}:

{
	options = {
		keyzox.hardware.bluetooth.enable = lib.mkEnableOption "Can be used to enable bluetooth";
	};

	config = lib.mkIf config.keyzox.hardware.bluetooth.enable {
		environment.systemPackages = with pkgs; [
			bluetuith
		];
		hardware.bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
	};
}
