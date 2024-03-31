{
  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
    stateVersion = 4;
    defaults.menuExtraClock = {
      Show24Hour = true;
    };
  };
  # Create /etc/zshrc that loads the nix-darwin environment
  # WARNING: THIS IS CRITICAL FOR THE CORRECT PATHS TO BE SET
  # WHEN useUserPackages and UseGlobalPkgs ARE SET TO TRUE
  programs.zsh.enable = true;
  # Remove default prompt
  programs.zsh.promptInit = "";
}
