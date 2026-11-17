# qboc-plugins

Plugins that connect AI agents to QuickBooks Online through the
[QuickBooks Online Agents Connector](https://qboc.hdcola.org) (qboc).

Each plugin declares one remote MCP server and ships the same five skills.
There is no backend in this repository.

## Status

Tested in the Claude desktop app; Codex is not tested yet. The endpoint is currently the
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

## Install

### Claude desktop app (tested)

1. Cowork tab → Customize → Browse plugins → Personal → **+** → Add marketplace from GitHub → `hdcola/qboc-plugins`.
2. Install `qboc`. You get five skills and one connector.
3. The connector is not added automatically: click **Add**, then **Connect**, and sign in with Intuit.

Codex desktop app: not tested yet.

Antigravity: not supported. Its desktop app installs plugins through the
command line tool and only from its official marketplace, which we are not in.
The `antigravity/` folder is kept for reference and is not published.

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
