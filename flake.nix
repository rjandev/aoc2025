{
  description = "Advent of Code 2025 - TypeScript + Vitest dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "aoc-2025-ts";

        buildInputs = with pkgs; [
          nodejs_24
          git
          yarn
          pnpm
        ];

        NODE_ENV = "development";

        shellHook = ''
          echo "Nix dev shell loaded!"
          echo "Node: $(node --version)"
          echo "npm:  $(npm --version || true)"
          echo "pnpm: $(pnpm --version || true)"
          echo "yarn: $(yarn --version || true)"
        '';
      };
    };
}
