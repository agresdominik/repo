# App Repo 

Personal Homebrew tap for my applications.

## Install

```bash 
brew tap agresdominik/repo https://github.com/agresdominik/repo
brew trust agresdominik/repo  # for updates
```

## Apps 

### cheatsh 

```bash
brew install cheatsh
```

Visit [cheat_sheet](https://github.com/agresdominik/cheat_sheet) to see more info

### download-ram

```brew 
brew install download-ram
```

Visit [download-ram](https://github.com/agresdominik/download-ram) to see more info

## Nix

This repo is also a Nix flake, for NixOS/Nix users.

### Run without installing

```bash
nix run github:agresdominik/repo#cheatsh
nix run github:agresdominik/repo#download-ram
```

### Install into your profile

```bash
nix profile install github:agresdominik/repo#cheatsh
nix profile install github:agresdominik/repo#download-ram
```

### Use as an overlay in a flake-based NixOS config

```nix
{
  inputs.repo.url = "github:agresdominik/repo";

  outputs = { self, nixpkgs, repo, ... }: {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nixpkgs.overlays = [ repo.overlays.default ]; }
        # pkgs.cheatsh / pkgs.download-ram are now available, e.g.
        # environment.systemPackages = [ pkgs.cheatsh pkgs.download-ram ];
      ];
    };
  };
}
```
