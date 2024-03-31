{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # General packages for development and system management
    awscli # Command-line interface for AWS
    bash-completion # Programmable completion for Bash
    coreutils # Basic file, shell, and text manipulation utilities
    file # Utility for determining file types
    gnumake # GNU Make build automation tool
    jq # Lightweight and flexible command-line JSON processor
    killall # Utility to kill processes by name
    neofetch # Command-line system information tool
    openssh # Remote login program and SSH client/server
    sqlite # Command-line interface for SQLite databases
    wget # Non-interactive network downloader
    zip # Compression and file packaging utility

    # Git and version control
    git # Distributed version control system
    git-branchless # Enhance git stacked diffs
    lazygit # Simple terminal UI for Git commands

    # Monitoring and resource management
    btop # Resource monitor that shows usage and stats for CPU, memory, disks, network, and processes
    htop # Interactive process viewer and system monitor
    iftop # Display bandwidth usage on an interface
    zenith # Resource monitor and system information tool

    # Node.js development tools
    nodejs # JavaScript runtime environment
    nodePackages.npm # Package manager for Node.js
    nodePackages.prettier # Opinionated code formatter

    # Python packages
    rye # Experimental Python package management tool

    # Rust
    rustup # Rust toolchain installer

    # Security
    gnupg # GNU Privacy Guard - a free implementation of the OpenPGP standard
    libfido2 # Library for using FIDO2 devices

    # Terminal and text utilities
    fd # Simple, fast, and user-friendly alternative to 'find'
    jetbrains-mono # Typeface for developers
    less # Terminal pager program
    neovim # Vim-fork focused on extensibility and usability
    ripgrep # Line-oriented search tool that recursively searches directories for a regex pattern
    tmux # Terminal multiplexer
    tree # Recursive directory listing command
    unrar # Utility for extracting RAR archives
    unzip # Extraction utility for .zip compressed files

    # Trash management
    rmtrash # Command-line trash utility
    trash-cli # Command-line interface to the freedesktop.org trashcan

    # Video and font
    ffmpeg # Complete solution to record, convert, and stream audio and video
    font-awesome # Icon font and CSS toolkit
  ];
}
