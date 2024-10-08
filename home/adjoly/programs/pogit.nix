{ inputs, ... }:

{
	imports = [
		inputs.pogit.homeManagerModules.default
	];
	programs.pogit = {
		enable = true;
	};
}
