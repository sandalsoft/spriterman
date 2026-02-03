# fn-1-spriterman-cli-tool.2 Implement CLI framework and create command

## Description
Implement the main spriterman CLI script with subcommand dispatch and the `create` command.

**Size:** M
**Files:** spriterman

## Approach

1. Create CLI framework with:
   - Shebang and strict mode: `#!/usr/bin/env bash` + `set -euo pipefail`
   - Colored logging functions: `_info`, `_warn`, `_error`, `_debug`
   - Error collection array: `ERRORS=()`
   - Dependency check for `sprite` CLI
   - Subcommand dispatch via `case` statement

2. Implement `cmd_create()`:
   - Validate sprite name argument
   - Run `sprite create --skip-console <name>` 
   - Wait for sprite ready (sprite exec auto-wakes, but verify with echo)
   - Call setup steps in order (apt, npm, pip, clone, copy, aliases)
   - Collect errors, continue on failure
   - Report summary at end

3. Setup step functions:
   - `install_apt_packages()` - parse packages.txt for apt: entries
   - `install_npm_packages()` - parse packages.txt for npm: entries
   - `install_pip_packages()` - parse packages.txt for pip: entries
   - `clone_template()` - git clone spriterman repo to /tmp/spriterman
   - `copy_claude_config()` - cp -r /tmp/spriterman/claude ~/.claude
   - `install_aliases()` - source line or copy to ~/.bashrc

4. Error reporting:
   - Use `set +e` around each step, capture exit code
   - Add failures to ERRORS array
   - At end, print all errors and exit with code 1 if any failures

## Key Context

- Use `sprite exec -s <name> -- <cmd>` for remote execution
- sprite CLI handles authentication via `sprite login`
- Sprites auto-wake on first exec command (no explicit polling needed)
- Follow pattern from hedgedoc/cli for case dispatch
- Follow pattern from jnsgruk/firecracker-ubuntu for colored logging
## Acceptance
- [ ] spriterman is executable with shebang
- [ ] Running `spriterman` with no args shows usage
- [ ] `spriterman create <name>` creates sprite and runs all setup steps
- [ ] Missing sprite CLI detected with clear error message
- [ ] Partial failures don't stop other steps
- [ ] All failures reported at end with summary
- [ ] Exit code 0 on full success, 1 on partial failure, 2 on fatal error
## Done summary
Implemented the spriterman CLI framework with colored logging, error collection, and subcommand dispatch. The create command creates sprites via sprite CLI and runs setup steps (apt/npm/pip packages, template clone, Claude config copy, aliases) with partial failure handling.
## Evidence
- Commits: 7eccd9e, 65ecba5, 1bdcf2e, 49f1628
- Tests: bash -n spriterman, spriterman (no args), spriterman create (no name), spriterman help
- PRs: