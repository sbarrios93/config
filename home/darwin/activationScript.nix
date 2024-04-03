{lib, ...}:
let 
brewPath = /opt/homebrew/bin/brew;
in { 
  reloadAerospaceSettings = lib.hm.dag.entryAfter ["writeBoundary"] ''    
      eval "$(${brewPath} shellenv)"
      # AeroSpace
      echo "Reloading aerospace settings..." >&2
      if [ -x "$(brew --prefix)/bin/aerospace" ]; then
        echo "Reloading aerospace config" >&2
        "$(brew --prefix)/bin/aerospace" reload-config
      else
        echo "Aerospace not set up" >&2
      fi
      '';
}
