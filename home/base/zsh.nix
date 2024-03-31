{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    autocd = true;
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "zdharma-continuum/fast-syntax-highlighting"
        "zsh-users/zsh-history-substring-search"
        "mafredri/zsh-async"
        "robbyrussell/oh-my-zsh path:plugins/gitfast"
        "robbyrussell/oh-my-zsh path:plugins/colored-man-pages"
        "robbyrussell/oh-my-zsh path:plugins/common-aliases"
        "robbyrussell/oh-my-zsh path:plugins/sudo"
      ];
    };
    history = {
      # Record timestamp
      extended = true;
      # If a new command line being added to the history list duplicates an
      # older one, the older command is removed from the list (even if it is
      # not the previous event)
      ignoreAllDups = true;
      # Do not enter command lines into the history list if they are duplicates
      # of the previous event
      ignoreDups = true;
      # Do not enter command lines into the history list if the first character
      # is a space
      ignoreSpace = true;
      # Share command history between zsh sessions
      share = true;
      # Number of history lines to keep in memory
      size = 10000;
      # Number of history lines to save to the history file
      save = 10000;
    };
    shellAliases = import ../../config/zsh/aliases.nix;
    envExtra = builtins.readFile ../../config/zsh/env.zsh;
    initExtra = builtins.concatStringsSep "\n" (
      map builtins.readFile (
        builtins.map (path: ../../config/zsh/initExtra + ("/" + path)) (
          builtins.attrNames (builtins.readDir ../../config/zsh/initExtra)))
    );
  };
}
