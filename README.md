# omadots

Modular dotfiles managed through the `dotfiles` command, the [Omakasui](https://omakasui.org) way.

## Installation

```bash
curl -fsSL https://omakasui.org/omadots | bash
```

The bootstrap script clones this repository into `~/.cfg` and adds `~/.cfg/bin` to `PATH`, providing the `dotfiles` command.

### Manual installation

```bash
git clone https://github.com/omakasui/omadots.git ~/.cfg
bash ~/.cfg/boot.sh
```
