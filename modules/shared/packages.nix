{ pkgs }:

with pkgs; [
  # General packages for development and system management
  bash-completion
  bat
  btop
  coreutils
  eza
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  zsh
  neovim-nightly

  gnupg
  libfido2

  ffmpeg
  fd
  font-awesome
  fzf

  # Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs

  # Text and terminal utilities
  htop
  iftop
  jetbrains-mono
  jq
  ripgrep
  tree
  tmux
  unrar
  unzip

  # Python packages
  rye
]
