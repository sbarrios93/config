# Seba's macOS Configuration (config)

This repository contains my personal dotfiles and system configuration for setting up a macOS system using the Nix package manager and the `nix-darwin` framework. The configuration is defined using a flake-based approach, allowing for reproducible and declarative system configuration.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Flake Structure](#flake-structure)
- [Home Manager Configuration](#home-manager-configuration)
  - [Darwin-specific Configuration](#darwin-specific-configuration)
  - [Base Configuration](#base-configuration)
- [Darwin Configuration](#darwin-configuration)
  - [System Settings](#system-settings)
  - [Finder Settings](#finder-settings)
  - [Dock Configuration](#dock-configuration)
  - [Homebrew Integration](#homebrew-integration)
- [Common Configuration](#common-configuration)
- [Variables](#variables)
- [Additional Configuration](#additional-configuration)
- [Makefile Usage](#makefile-usage)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before using this configuration, ensure that you have the following prerequisites:

- macOS system (tested on aarch64 architecture)
- Command Line Tools for Xcode installed
- Basic understanding of Nix and NixOS configuration

## Installation

To install and use this configuration, follow these steps:

1. Install Command Line Tools for Xcode:

   ```shell
   xcode-select --install
   ```

2. Install Nix using the Determinate Systems installer:

   ```shell
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

   For more information on the Determinate Systems Nix installer, refer to the following resources:
   - [Determinate Systems Nix Installer GitHub Repository](https://github.com/DeterminateSystems/nix-installer)
   - [Determinate Systems Blog Post](https://determinate.systems/posts/determinate-nix-installer/)

3. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/sbarrios93/config.git
   ```

4. Navigate to the cloned repository:

   ```shell
   cd config
   ```

5. Run the deployment command using the provided Makefile:

   ```shell
   make deploy
   ```

   This command will build and switch to the NixOS configuration defined in the flake.

6. After the deployment is complete, reboot your system to ensure all changes take effect.

## Flake Structure

The flake structure of this configuration is as follows:

- `flake.nix`: The main flake file that defines the inputs, outputs, and configurations.
- `home/`: Directory containing the Home Manager configuration files.
  - `darwin/`: Home Manager configuration specific to macOS.
  - `base/`: Common Home Manager configuration shared across systems.
- `darwin/`: Directory containing the Darwin (macOS) system configuration files.
- `common/`: Directory containing common configuration files shared across systems.
- `hosts/`: Directory containing host-specific configuration files.
  - `darwin/`: Configuration specific to macOS hosts.
- `vars/`: Directory containing variable definitions used in the configuration.
- `config/`: Directory containing additional configuration files.

## Home Manager Configuration

The Home Manager configuration is defined in the `home/` directory. It includes configuration files for various user-specific settings and dotfiles.

### Darwin-specific Configuration

The `home/darwin/` directory contains Home Manager configuration specific to macOS. It includes:

- `files.nix`: Configuration for syncing dotfiles and configuration files.
- `home.nix`: Home Manager configuration for the user's home directory.
- `packages.nix`: Configuration for installing packages specific to macOS.
- `modules/`: Directory for additional Home Manager modules.

### Base Configuration

The `home/base/` directory contains common Home Manager configuration shared across systems. It includes:

- `bat.nix`: Configuration for the `bat` command-line tool.
- `eza.nix`: Configuration for the `eza` command-line tool.
- `fonts.nix`: Configuration for installing and managing fonts.
- `fzf.nix`: Configuration for the `fzf` command-line fuzzy finder.
- `git.nix`: Configuration for Git version control system.
- `home.nix`: Common Home Manager configuration for the user's home directory.
- `packages.nix`: Configuration for installing common packages.
- `starship.nix`: Configuration for the Starship prompt.
- `tmux.nix`: Configuration for the `tmux` terminal multiplexer.
- `zoxide.nix`: Configuration for the `zoxide` directory jumper.
- `zsh.nix`: Configuration for the Zsh shell.

## Darwin Configuration

The Darwin (macOS) system configuration is defined in the `darwin/` directory. It includes various system-level settings and preferences specific to macOS.

### System Settings

The `darwin/system.nix` file contains system-wide settings and preferences, such as enabling the Nix daemon and configuring the Zsh shell.

### Finder Settings

The `darwin/finder.nix` file contains settings for the Finder application, such as showing hidden files and setting the default view style.

### Dock Configuration

The `darwin/dock/` directory contains configuration files for managing the macOS Dock. It includes:

- `config.nix`: Configuration options for the Dock.
- `default.nix`: Main configuration file for the Dock.

### Homebrew Integration

The `darwin/homebrew/` directory contains configuration files for integrating Homebrew package management with Nix. It includes:

- `casks.nix`: List of Homebrew casks to install.
- `default.nix`: Main configuration file for Homebrew integration.

## Common Configuration

The `common/` directory contains configuration files that are shared across different systems. It includes:

- `home.nix`: Common Home Manager configuration.
- `nix.nix`: Configuration for Nix package manager.
- `version.nix`: Configuration for system versioning.

## Variables

The `vars/` directory contains variable definitions used in the configuration. It includes:

- `default.nix`: Main variable definition file.
- `users/default.nix`: User-specific variable definitions.

## Additional Configuration

The `config/` directory contains additional configuration files, such as aliases and environment settings for the Zsh shell.

## Makefile Usage

The provided Makefile offers convenient commands for managing the NixOS configuration:

- `make deploy`: Deploys the NixOS configuration by building and switching to the defined configuration.
- `make fmt`: Formats the Nix code using `nixfmt`.
- `make lint`: Lints the Nix code using `nixfmt` and `deadnix`.
- `make help`: Displays the available Makefile commands and their descriptions.

## Customization

While this configuration is tailored to my personal preferences and setup, you can still use it as a starting point for your own configuration. Feel free to explore the files in the `home/`, `darwin/`, and `common/` directories and adapt them to suit your needs.

Remember to review the configuration files carefully and understand the implications of any changes you make.

## Troubleshooting

If you encounter any issues while using this configuration, consider the following troubleshooting steps:

- Ensure that you have the latest version of Nix installed.
- Double-check that you have met all the prerequisites mentioned in the [Prerequisites](#prerequisites) section.
- Review the configuration files for any syntax errors or conflicting settings.
- Consult the Nix and NixOS documentation for specific error messages or issues.
- Seek help from the Nix community or open an issue in this repository if you need further assistance.

## Contributing

While this configuration is primarily for my personal use, if you have any suggestions or improvements, feel free to open an issue or submit a pull request. I appreciate any feedback or ideas that can enhance my setup.

## License

This configuration is open-source and available under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per the terms of the license.

