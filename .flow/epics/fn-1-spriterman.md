# Epic: Spriterman - Sprite Template Tool

## Overview

A Bash CLI tool for creating and managing templated sprites on sprites.dev. Automates sprite creation with pre-configured aliases, packages, and Claude Code settings.

## Repository

`github.com/sandalsoft/spriterman`

## Commands

### `spriterman create <name>`
Creates a new sprite via the Sprites API and runs full setup.

### `spriterman update <name>`
Re-runs setup on an existing sprite (idempotent).

### `spriterman export <name>`
Dumps a sprite's current config to stdout for adding to the template.

## Directory Structure

```
spriterman/
├── spriterman              # main bash script (executable)
├── config/
│   ├── aliases.sh          # shell aliases and functions
│   └── packages.txt        # package manifest
├── claude/                 # ~/.claude/ contents to sync
│   ├── settings.json
│   └── ...
└── README.md
```

## Configuration

### Aliases (`config/aliases.sh`)

```bash
# Claude/Codex shortcuts
alias gcy='git commit -y'
alias co='claude'
alias cl='claude'
alias clm='claude --model'

# Git shortcuts
alias gb='git branch'
alias g='git status'
alias gd='git diff'
alias lg='git log --oneline'
alias gl='git log'
alias p='git push'
alias pu='git push -u origin HEAD'

# Functions
grao() { git remote add origin "$1"; }
grso() { git remote set-url origin "$1"; }
gco() { git checkout "$@"; }
gcob() { git checkout -b "$1"; }

# Bun shortcuts
alias brd='bun run dev'
alias brb='bun run build'
alias bt='bun test'

# NPM shortcuts (uses $npmCommand variable)
alias nnpm='/usr/local/bin/npm'
alias npm_package_list='npm pack && tar -xvzf *.tgz && rm -rf package *.tgz'
alias npl='npm_package_list'
alias npms='npms --color search'
alias nrd='$npmCommand run --silent dev'
alias nrb='$npmCommand run --silent build'
alias nrp='$npmCommand run preview'
alias nb='nrb'
alias ns='$npmCommand run --silent start'
alias nrs='ns'
alias nsq='$npmCommand --silent run start'
alias nrc='$npmCommand run --silent clean'
alias nbw='$npmCommand run --silent build:watch'
alias nt='$npmCommand run --silent test'
alias ntw='$npmCommand run --silent test:watch'
alias nid='$npmCommand add --save-dev'
alias ni='$npmCommand i'
alias nnpx='/usr/local/bin/npx'
alias nsd='$npmCommand run --silent start:dist'
alias nig='$npmCommand add -g'
alias nsb='npm run storybook'
```

### Packages (`config/packages.txt`)

```
# apt packages
apt:git
apt:curl
apt:jq
apt:yq

# npm globals
npm:pnpm

# pip packages
pip:uv
```

### Claude Config (`claude/`)

Contents of `~/.claude/` directory:
- Settings
- Allowed tools configuration
- MCP servers configuration

## Setup Steps (create/update)

1. **Create sprite** (create only) - `sprite create <name>` via CLI
2. **Wait for sprite ready** - run `sprite exec` to auto-wake
3. **Install apt packages** - `sprite exec <name> -- sudo apt update && sudo apt install -y git curl jq yq`
4. **Install npm global** - `sprite exec <name> -- npm install -g pnpm`
5. **Install pip package** - `sprite exec <name> -- pip install uv`
6. **Clone spriterman repo** - `sprite exec <name> -- git clone <repo> /tmp/spriterman.XXXXXX`
7. **Copy Claude config** - `sprite exec <name> -- cp -a /tmp/spriterman.XXXXXX/claude/. ~/.claude/`
8. **Install aliases** - copy to `~/.spriterman/aliases.sh` and add source line to `~/.bashrc`
9. **Cleanup** - remove temp directory
10. **Report results** - summarize successes and any failures

## Authentication

- Uses `$SPRITE_TOKEN` environment variable
- Token can be created at sprites.dev/account or via `sprite org auth`

## Error Handling

- Continue on failure, report all failures at end
- Each step logs success/failure
- Exit code reflects whether all steps succeeded

## Export Command

`spriterman export <name>` captures from a running sprite:
- Current shell aliases (parse from rc files)
- Installed packages (apt list --installed, npm list -g, pip list)
- `~/.claude/` directory contents

Outputs to stdout in a format suitable for updating the template.

## Future Enhancements (out of scope for v1)

- Dotfiles support (user will add later)
- Environment variables
- SSH key management
- Multiple template profiles

## Tasks

1. [ ] Create repo structure and initial README
2. [ ] Implement `spriterman create` command
3. [ ] Implement `spriterman update` command
4. [ ] Implement `spriterman export` command
5. [ ] Add config/aliases.sh with all aliases and functions
6. [ ] Add config/packages.txt manifest
7. [ ] Add user's ~/.claude/ contents to claude/ directory
8. [ ] Test end-to-end on a real sprite
