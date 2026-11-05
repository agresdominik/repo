{
  description = "agresdominik's personal package tap (Homebrew + Nix)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          cheatsh = pkgs.callPackage ./pkgs/cheatsh.nix { };
          download-ram = pkgs.callPackage ./pkgs/download-ram.nix { };
          default = self.packages.${system}.cheatsh;
        };

        apps = {
          cheatsh = flake-utils.lib.mkApp {
            drv = self.packages.${system}.cheatsh;
          };
          download-ram = flake-utils.lib.mkApp {
            drv = self.packages.${system}.download-ram;
          };
        };
      }
    ) // {
      overlays.default = final: prev: {
        cheatsh = final.callPackage ./pkgs/cheatsh.nix { };
        download-ram = final.callPackage ./pkgs/download-ram.nix { };
      };
    };
}
