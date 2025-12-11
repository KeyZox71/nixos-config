# ❄️ NixOS configuration :D

Welcome to my NixOS configuration repository! \
This repository contains the configuration files and scripts for setting up and managing my NixOS-based system.

## 📦 Packages

#### `keyznvim` or `keyznvim-lite`
My custom nixvim config with lsp support, auto sessions, auto light/dark mode and other QOL plugins and features. It also has a lite mode, that does not install all the lsp servers.

#### `adjust-brightness`
A wrapper script for ddcutil to change brightness of a DDC/CI compatible screen (need ddcutil installed and working).

### Using the packages
- For just running it:
```bash
nix run github:keyzox71/nixos-config#<package-name>
```
- Installing it in your session:
```bash
nix profile install github:keyzox71/nixos-config#<package-name>
```
- Or install it in your config:
```nix
inputs = {
  keynixos.url = "github:keyzox71/nixos-config";
};
...
environment.systemPackages = [
  inputs.keyznixos.packages.${pkgs.stdenv.hostPlatform.system}.<package-name>
];
```

## 📁 Directory Structure
- **flake.lock** and **flake.nix**: Used for managing dependencies and configurations using Nix flakes.
- **home/**: Contains configurations for home-manager.
- **hosts/**: Contains configurations for my differents machine.
- **modules/**: This directory contains reusable modules for different configurations:
  - `home-manager/`: For managing user environments with Home Manager.
  - `nixos/`: For NixOS-specific configurations.
  - `nixvim/`: For Nixvim configurations.
- **pkgs/**: Custom package definitions (Nixvim config, adjust-brighness).

## 📝 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
