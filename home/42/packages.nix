{
	pkgs,
	self,
	inputs,
	...
}:

{
	home.packages = with pkgs; [
		mockoon
		brightnessctl
		inputs.randomTimer.packages.${pkgs.system}.default
	];
}
