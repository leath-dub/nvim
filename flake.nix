{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "neovim-conf";
        src = ./.;

        installPhase = ''
          mkdir -p $out
          cp -r $src $out
        '';

        meta = {
          description = "Derivation storing my neovim configuration";
        };
      };
    });
}
