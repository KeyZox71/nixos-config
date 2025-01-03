{ pkgs, ... }:

{
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true;
	environment.systemPackages = with pkgs; [
		qemu
	];
	users.users.adjoly.extraGroups = [ "libvirtd" ];
}
