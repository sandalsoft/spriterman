# fn-1-spriterman-cli-tool.3 Implement update and export commands

## Description
Implement the `update` and `export` commands for spriterman.

**Size:** M
**Files:** spriterman

## Approach

### Update Command

1. Implement `cmd_update()`:
   - Validate sprite name argument
   - Verify sprite exists (run `sprite exec -s <name> -- echo ok`)
   - Run setup steps (same as create, but skip sprite creation)
   - Use idempotency checks before each step

2. Idempotency checks:
   - apt: `sprite exec -s <name> -- dpkg -l <pkg> 2>/dev/null | grep -q ^ii`
   - npm: `sprite exec -s <name> -- npm list -g <pkg> --depth=0 2>/dev/null | grep -q <pkg>`
   - pip: `sprite exec -s <name> -- pip show <pkg> 2>/dev/null`
   - aliases: `sprite exec -s <name> -- grep -qF "source.*spriterman" ~/.bashrc`
   - ~/.claude/: Always overwrite (no merge)

### Export Command

1. Implement `cmd_export()`:
   - Validate sprite name argument
   - Extract configuration sections:
     - Aliases: `sprite exec -s <name> -- cat ~/.bashrc` and parse
     - Packages: List installed apt/npm/pip packages
     - Claude config: `sprite exec -s <name> -- cat ~/.claude/settings.json` etc.
   - Output to stdout in shell-readable format

2. Output format (shell script that can be sourced):
   ```bash
   # Exported from sprite: <name>
   # Date: <timestamp>
   
   # Aliases
   alias foo='bar'
   
   # Packages
   # apt: git curl jq yq
   # npm: pnpm
   # pip: uv
   
   # Claude config would need separate handling
   ```

## Key Context

- Update must be safe to run multiple times without side effects
- Export output should be human-readable and useful for updating template
- Package list extraction: `apt list --installed`, `npm list -g --depth=0`, `pip list`
## Acceptance
- [ ] `spriterman update <name>` re-applies template to existing sprite
- [ ] Update is idempotent - running twice produces same result, no duplicates
- [ ] Update on non-existent sprite gives clear error
- [ ] `spriterman export <name>` outputs config to stdout
- [ ] Export includes aliases, package list, and claude config summary
- [ ] Export output is formatted and human-readable
## Done summary
TBD

## Evidence
- Commits:
- Tests:
- PRs:
