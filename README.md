# qboc-plugins

Plugins that connect AI agents to QuickBooks Online through the
[QuickBooks Online Agents Connector](https://qboc.hdcola.org) (qboc).

Each plugin declares the remote MCP server `https://qboc.hdcola.org/mcp` and
ships a shared set of skills. There is no backend in this repository.

## Status

Under construction. Design: `docs/plugin-design.md` in the
[website repository](https://github.com/hdcola/QuickBooksConnectSite).

Planned platforms: Claude Code, Codex, Antigravity.

## Layout (planned)

```
skills/          shared skills (single source)
claude/          Claude Code plugin
codex/           Codex plugin
antigravity/     Antigravity plugin
scripts/         sync-skills.sh, validate.sh
```

## Closed beta

The service is in closed beta. Only invited users can connect their
QuickBooks company. Sign up at https://qboc.hdcola.org.

## Disclaimer

QuickBooks is a registered trademark of Intuit Inc. This project is not
affiliated with or endorsed by Intuit.
