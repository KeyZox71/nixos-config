{
	pkgs,
	self,
	inputs,
	...
}:

{
	home.packages = with pkgs; [
		postman
		mockoon
		inputs.keyznvim.packages.${pkgs.system}.default
	];
}
