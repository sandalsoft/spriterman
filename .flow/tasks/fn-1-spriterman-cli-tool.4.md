# fn-1-spriterman-cli-tool.4 Add Claude config template and end-to-end testing

## Description
Add the Claude config template directory and perform end-to-end testing on a real sprite.

**Size:** M
**Files:** claude/*, README.md

## Approach

### Claude Config Template

1. Create claude/ directory structure:
   - Add user's current ~/.claude/ contents (settings.json, etc.)
   - Or create placeholder with instructions if user hasn't provided
   - Document what files are expected

2. Files typically in ~/.claude/:
   - settings.json (permissions, defaults)
   - allowed-tools/ or permissions config
   - MCP server configs
   - Any custom plugins

### End-to-End Testing

1. Test `spriterman create`:
   - Create a test sprite: `spriterman create test-spriterman-e2e`
   - Verify all packages installed
   - Verify aliases work
   - Verify ~/.claude/ exists on sprite
   - Delete test sprite after

2. Test `spriterman update`:
   - Run update on existing sprite
   - Verify no duplicate aliases
   - Verify packages not reinstalled (check timing)

3. Test `spriterman export`:
   - Export config from test sprite
   - Verify output is parseable
   - Verify it matches what was set up

4. Update README with:
   - Verified installation steps
   - Example output
   - Troubleshooting section

## Key Context

- User should copy their own ~/.claude/ contents to the repo
- Testing requires actual sprite creation (uses quota)
- Clean up test sprites after testing
## Acceptance
- [ ] claude/ directory contains valid Claude Code configuration or placeholder with instructions
- [ ] End-to-end test of create command succeeds on real sprite
- [ ] End-to-end test of update command is idempotent
- [ ] End-to-end test of export command produces valid output
- [ ] README updated with verified examples and troubleshooting
- [ ] Test sprite cleaned up after testing
## Done summary
TBD

## Evidence
- Commits:
- Tests:
- PRs:
