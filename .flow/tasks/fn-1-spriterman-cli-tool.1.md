# fn-1-spriterman-cli-tool.1 Scaffold project structure and config files

## Description
Create the initial project structure for spriterman in the github.com/sandalsoft/spriterman repository.

**Size:** M
**Files:** spriterman, config/aliases.sh, config/packages.txt, README.md

## Approach

1. Create directory structure:
   ```
   spriterman/
   ├── spriterman              # main executable (empty for now)
   ├── config/
   │   ├── aliases.sh          # shell aliases and functions
   │   └── packages.txt        # package manifest
   ├── claude/                  # placeholder for user's ~/.claude/
   │   └── README.md           # instructions for adding config
   └── README.md
   ```

2. Create config/aliases.sh with all aliases from the interview:
   - Claude/Codex shortcuts (gcy, co, cl, clm)
   - Git shortcuts (gb, grao, grso, g, gd, lg, gl, p, etc.)
   - Bun shortcuts (brd, brb, bt)
   - NPM shortcuts (nrd, nrb, ns, nt, ni, etc.)
   - Convert aliases with $1/$@ to shell functions

3. Create config/packages.txt with format:
   ```
   apt:git
   apt:curl
   apt:jq
   apt:yq
   npm:pnpm
   pip:uv
   ```

4. Create README.md with:
   - Project description
   - Prerequisites (sprite CLI)
   - Installation
   - Quick start
   - Configuration

## Key Context

- Aliases using `$1` or `$@` must be shell functions, not aliases
- The `$npmCommand` variable should default to `npm` if not set
- Use XDG-compliant paths in documentation
## Acceptance
- [ ] Directory structure created: config/, claude/
- [ ] config/aliases.sh contains all aliases from interview, functions for $1/$@
- [ ] config/packages.txt lists: apt:git, apt:curl, apt:jq, apt:yq, npm:pnpm, pip:uv
- [ ] README.md documents installation and basic usage
- [ ] claude/README.md explains how to add user's ~/.claude/ contents
- [ ] All files committed to repository
## Done summary
Created project scaffolding with config/aliases.sh (shell aliases and functions for Claude, Git, Bun, NPM), config/packages.txt (package manifest), claude/README.md (instructions for Claude config), README.md (project documentation), and spriterman executable placeholder.
## Evidence
- Commits: 9e4d334 feat(scaffold): create project structure and config files
- Tests:
- PRs: