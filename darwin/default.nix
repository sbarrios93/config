{
  imports = [
    ../common # TODO: Remove this, or remove the one on ./hosts/darwin imports
    ./system.nix
    ./NSGlobalDomain.nix
    ./finder.nix
    ./trackpad.nix
    ./dock
    #   ./homebrew
    ./keyboard.nix
    ./CustomUserPreferences.nix
    ./touchID.nix
    ./nix.nix
    ./user.nix
  ];
}
