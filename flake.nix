{
  description = "My neovim config";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in {
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
        name = "neovim-conf";
        src = ./.;

        installPhase = ''
          mkdir -p $out
          cp -r $src $out
        '';

        meta = {
          description = "Derivation storing my neovim configuration";
        }
      }
    };
}
