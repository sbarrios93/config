{ inputs, vars, ... }:
let
  self = inputs.self;
  darwinSystem = inputs.darwin.lib.darwinSystem;
  home-manager = self.inputs.home-manager;
  user = vars.users;
  environment = vars.environments;
  nix-homebrew = self.inputs.nix-homebrew;
  homebrew-core = self.inputs.homebrew-core;
  homebrew-cask = self.inputs.homebrew-cask;
  homebrew-bundle = self.inputs.homebrew-bundle;
  aerospace-tap = self.inputs.aerospace-tap;
in
darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit self user nix-homebrew environment; };
  modules = [
    home-manager.darwinModules.home-manager
    {
      home-manager.users.${user.username} = import ../../home/darwin;
      home-manager.extraSpecialArgs = { inherit user; };
    }
    # TODO: Move this to its own module
    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        user = user.username;
        enable = true;
        taps = {
          "homebrew/homebrew-core" = homebrew-core;
          "homebrew/homebrew-cask" = homebrew-cask;
          "homebrew/homebrew-bundle" = homebrew-bundle;
          "nikitabobko/homebrew-tap" = aerospace-tap;
        };
        mutableTaps = false;
        autoMigrate = true;
      };
    }
    ../../common
    ../../darwin
  ];
}
