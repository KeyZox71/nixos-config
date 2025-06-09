{ pkgs, ... }:
{
	users.users.adjoly.extraGroups = [ "kvm" "adbusers" ];
	programs = {
		adb.enable = true;
	};
	environment.systemPackages = with pkgs; [
		android-studio
	];
}
