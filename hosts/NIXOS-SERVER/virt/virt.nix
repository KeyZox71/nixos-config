{ pkgs, ... }:

{
	virtualisation.libvirtd.enable = true;
	environment.systemPackages = with pkgs; [
		qemu
	];
	users.users.adjoly.extraGroups = [ "libvirtd" ];
}
