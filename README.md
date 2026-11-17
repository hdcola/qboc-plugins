# qboc-plugins

Plugins that connect AI agents to QuickBooks Online through the
[QuickBooks Online Agents Connector](https://qboc.hdcola.org) (qboc).

Each plugin declares one remote MCP server and ships the same five skills.
There is no backend in this repository.

## Status

Skeleton, not yet tested in any desktop app. The endpoint is currently the
Intuit **sandbox** preview, `https://sandbox.qboc.hdcola.org/mcp`. Design and
findings from the official docs live in the
[website repository](https://github.com/hdcola/QuickBooksConnectSite) (`docs/plugin-design.md`, `docs/plugin-p0.md`).

## Layout

```
skills/          shared skills (the single source)
claude/          Claude plugin        (.claude-plugin/plugin.json, .mcp.json)
codex/           Codex plugin         (.codex-plugin/plugin.json, .mcp.json)
antigravity/     Antigravity plugin   (plugin.json, mcp_config.json)
.claude-plugin/marketplace.json     Claude marketplace
.agents/plugins/marketplace.json    Codex marketplace
scripts/sync-skills.sh              copy skills/ into each plugin (--check for CI)
scripts/set-endpoint.sh <mcp-url>   point all three plugins at another endpoint
```

Edit skills only in `skills/`, then run `scripts/sync-skills.sh`.

## Skills

`record-expense`, `create-invoice`, `categorize-transactions`, `run-reports`,
`safe-delete-and-void`. Tool names are those of the qboc MCP server
(`worker/mcp/` in the website repository); update the skills when tools change.

## Validate

```
claude plugin validate .
claude plugin validate ./claude
agy plugin validate --strict ./antigravity
```

Codex has no validate command; it validates on upload.

Codex uses the compatibility layout (`.codex-plugin/plugin.json` with `"mcpServers": "./.mcp.json"`), the same as OpenAI's own plugins: the desktop app did not pick up the portable root `mcp.json`.

## Closed beta

Only invited users can connect their QuickBooks company. Sign up at
https://qboc.hdcola.org.

## Disclaimer

QuickBooks is a registered trademark of Intuit Inc. This project is not
affiliated with or endorsed by Intuit.
