{
  description = "Common devShells";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-21.url = "github:NixOS/nixpkgs/21.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, nixpkgs-21, flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem(
        system: 
        let 
        pkgs = import nixpkgs { inherit system;};
        pkgs21 = import nixpkgs-21 { inherit system;};
        in {
        devShells = {
        python = import ./shells/python.nix {inherit pkgs ;};
        cuda = import ./shells/cuda.nix {inherit pkgs;};
        ember-shell = import ./shells/ember-shell.nix {inherit pkgs21;};
      };
    }
  );
}
