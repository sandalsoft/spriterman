# Claude Configuration Directory

This directory is a placeholder for your Claude Code configuration files.

## Setup

Copy the contents of your local `~/.claude/` directory into this folder to include your Claude Code settings in the spriterman template.

```bash
# From your local machine (not the sprite)
cp -r ~/.claude/* /path/to/spriterman/claude/
```

## What to Include

Common files from `~/.claude/`:

- `settings.json` - Claude Code preferences and settings
- `projects/` - Project-specific configurations
- `mcp.json` - MCP server configurations
- Any other Claude Code configuration files

## Privacy Note

Be careful not to commit sensitive information. Consider adding these to `.gitignore`:

- API keys or tokens
- Personal identifiers
- Credentials files

## How Spriterman Uses This

When you run `spriterman create` or `spriterman update`, the contents of this directory are copied to `~/.claude/` on the target sprite, giving you a consistent Claude Code environment across all your sprites.
