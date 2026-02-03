# Spriterman

A Bash CLI tool for creating and managing templated sprites on [sprites.dev](https://sprites.dev) with pre-configured aliases, packages, and Claude Code settings.

## Overview

Spriterman automates the setup of new sprites with a consistent development environment. Instead of manually configuring each sprite, run a single command that creates the sprite and applies your template configuration.

## Prerequisites

- [sprite CLI](https://docs.sprites.dev/cli/) installed and authenticated
- Bash 4.0 or later

```bash
# Verify sprite CLI is available
which sprite || echo "Install sprite CLI first - see https://docs.sprites.dev/cli/"

# Login to sprites.dev
sprite login
```

## Installation

Clone this repository:

```bash
git clone https://github.com/sandalsoft/spriterman.git
cd spriterman
```

Optionally, add spriterman to your PATH:

```bash
export PATH="$PATH:$(pwd)"
# Or add to ~/.bashrc for persistence
echo 'export PATH="$PATH:/path/to/spriterman"' >> ~/.bashrc
```

## Quick Start

```bash
# Create a new templated sprite
spriterman create my-dev-sprite

# Update existing sprite with latest template
spriterman update my-dev-sprite

# Export sprite config to file
spriterman export my-dev-sprite > my-config.sh
```

## Commands

### `spriterman create <name>`

Creates a new sprite via the sprite CLI and applies the full template configuration:

1. Creates the sprite
2. Waits for it to be ready
3. Installs packages from `config/packages.txt`
4. Installs aliases from `config/aliases.sh`
5. Copies Claude Code config from `claude/`

### `spriterman update <name>`

Re-applies the template to an existing sprite. Idempotent - safe to run multiple times without duplicating aliases or packages.

### `spriterman export <name>`

Extracts the current configuration from a sprite and outputs it to stdout. Useful for backing up or migrating configurations.

## Configuration

### Aliases (`config/aliases.sh`)

Shell aliases and functions for common development tasks:

- **Claude/Codex**: `co`, `cl`, `clm`, `gcy`
- **Git**: `g`, `gd`, `lg`, `gl`, `p`, `pu`, `ga`, `gcm`, `gac`
- **Bun**: `brd`, `brb`, `bt`, `bi`, `ba`
- **NPM**: `nrd`, `nrb`, `ns`, `nt`, `ni`, `nr`

To customize, edit `config/aliases.sh` before running spriterman.

### Packages (`config/packages.txt`)

Package manifest with format `<manager>:<package>`:

```
apt:git
apt:curl
apt:jq
apt:yq
npm:pnpm
pip:uv
```

Supported package managers:
- `apt` - System packages
- `npm` - Node.js global packages
- `pip` - Python packages (via uv if available)

### Claude Config (`claude/`)

Copy your `~/.claude/` directory contents to `claude/` to sync Claude Code settings across sprites. See `claude/README.md` for details.

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Partial failure (some steps failed) |
| 2 | Fatal error |
| 3 | Configuration error |

## License

MIT
