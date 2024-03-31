{
  description = "my macOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @inputs:
    let
      vars = import ./vars;
    in
    {
      darwinConfigurations."aarch64-darwin" = import ./hosts/darwin
        {
          inherit inputs vars;
        };
      # nix fmt formatter
      formatter = {
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      };
    };
}
