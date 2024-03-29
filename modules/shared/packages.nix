{ pkgs }:

with pkgs; [
  # General packages for development and system management
  bash-completion
  coreutils
  killall
  neofetch
  openssh
  sqlite
  wget
  zip

  gnupg
  libfido2

  ffmpeg
  fd
  font-awesome

  # Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs

  # Text and terminal utilities
  htop
  iftop
  jetbrains-mono
  tree
  tmux
  unrar
  unzip

  # Python packages
  rye

  # rust
  rustup

  # trash command
  trash-cli
  rmtrash

]
