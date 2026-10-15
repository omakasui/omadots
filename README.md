# dotfiles

> [!WARNING]
> I am starting to adopt [`chezmoi`](https://www.chezmoi.io) instead of custom scripts. This repository will not receive active maintenance and remains as an example of dotfiles structure.

This repository provides a modular dotfiles setup with an easy-to-use command-line interface.

## Installation

The **recommended approach** is to clone this repository into a `.cfg` directory in your HOME folder. This approach ensures all installer scripts and configurations work correctly without requiring path modifications.

### Automatic Installation (Recommended)

For a quick and guided installation using the recommended approach:

```bash
curl -fsSL https://omakasui.org/dotfiles | bash
```

This script will automatically:

- Clone the repository to `~/.cfg`
- Set up everything you need to manage your configurations

### Manual Installation

If you prefer to install manually:

```bash
# Clone the repository
git clone https://codeberg.org/Kasui92/dotfiles.git ~/.cfg

# Run the bootstrap script
bash ~/.cfg/boot.sh
```

The bootstrap script will set up the `dotfiles` command for you.
