{
  system.defaults.CustomUserPreferences = {
    NSGlobalDomain = {
      WebKitDeveloperExtras = true;
    };

    "com.apple.finder" = {
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = true;
      ShowMountedServersOnDesktop = true;
      ShowRemovableMediaOnDesktop = true;
      FXDefaultSearchScope = "SCcf";
    };

    "com.apple.desktopservices" = {
      # Avoid creating .DS_Store files on network or USB volumes
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };

    "com.apple.WindowManager" = {
      EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
      StandardHideDesktopIcons = 0; # Show items on desktop
      HideDesktop = 0; # Do not hide items on desktop & stage manager
      StageManagerHideWidgets = 0;
      StandardHideWidgets = 0;
    };

    "com.apple.AdLib" = {
      allowApplePersonalizedAdvertising = false;
    };

  };
}
